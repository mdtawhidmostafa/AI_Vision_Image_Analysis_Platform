import os, uuid, json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from ultralytics import YOLO
from google import genai
from google.genai.types import Content
from django.shortcuts import render

model = YOLO("yolov8n.pt")  # local YOLO model
def homes(request):
    return render(request, "home.html")
@csrf_exempt
def detect_image(request):
    if request.method != "POST" or "image" not in request.FILES:
        return JsonResponse({"error": "Invalid request"}, status=400)

    img_file = request.FILES["image"]
    ext = img_file.name.split('.')[-1]
    unique_name = f"{uuid.uuid4()}.{ext}"
    upload_path = os.path.join(settings.MEDIA_ROOT, "uploads", unique_name)
    os.makedirs(os.path.dirname(upload_path), exist_ok=True)
    with open(upload_path, "wb+") as f:
        for chunk in img_file.chunks():
            f.write(chunk)

    results = model(upload_path)[0]
    annotated_name = f"annotated_{uuid.uuid4()}.jpg"
    annotated_path = os.path.join(settings.MEDIA_ROOT, "annotated", annotated_name)
    os.makedirs(os.path.dirname(annotated_path), exist_ok=True)
    results.plot(save=True, filename=annotated_path)

    detections = [{"label": results.names[int(b.cls)], "confidence": float(b.conf), "bbox": b.xyxy[0].tolist()} for b in results.boxes]

    return JsonResponse({
        "status": "success",
        "annotated_image_url": settings.MEDIA_URL + "annotated/" + annotated_name,
        "uploaded_image_url": settings.MEDIA_URL + "uploads/" + unique_name,
        "results": detections
    })

@csrf_exempt
def ask_question(request):
    if request.method != "POST":
        return JsonResponse({"error": "Invalid request"}, status=400)

    body = json.loads(request.body)
    question = body.get("question")
    detections = body.get("detections")
    if not question:
        return JsonResponse({"error": "No question provided"}, status=400)

    client = genai.Client(api_key=settings.GEMINI_API_KEY)
    context = f"Detected objects:\n{json.dumps(detections, indent=2)}\nAnswer user question clearly."
    prompt = f"{context}\nUser Question: {question}"

    try:
        response = client.models.generate_content(model="gemini-2.5-flash", contents=[Content(role="user", parts=[{"text": prompt}])])
        ai_answer = response.text
    except Exception as e:
        ai_answer = f"Error: {str(e)}"

    return JsonResponse({"answer": ai_answer})
