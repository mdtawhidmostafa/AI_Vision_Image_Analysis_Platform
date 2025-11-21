# AI Vision Image Analysis Platform

A full-stack AI web application for real-time object detection and intelligent analysis. Users can log in, upload images, detect objects with YOLO, view sortable detection results, and ask questions using a Gemini-powered AI assistant.

---

## Features

### User Authentication
- Secure login and signup
- Password hashing
- JWT authentication stored in HTTP-only cookies

### Image Upload & Object Detection
- Upload images from the dashboard
- YOLOv8 (or YOLOv11) runs inside the backend Docker container
- Returns:
  - Annotated image with bounding boxes
  - Structured detection results (class, confidence, bounding box)

### Results Visualization
- Annotated image preview
- Sortable results table:
  - Class name  
  - Confidence score  
  - Bounding box coordinates  

### Conversational Q&A
- Ask questions based on YOLO results
- Powered by Gemini 2.5 Flash
- Chat-style response interface

### Frontend
- Built with Next.js
- Responsive layout based on provided HTML designs

---

## Tech Stack

- **Frontend:** Next.js, HTML, CSS, JavaScript  
- **Backend:** Django 4.2, Django REST Framework, Simple JWT  
- **Database:** MySQL 8.0  
- **AI Model:** YOLOv8 (runs locally inside Docker)  
- **AI Assistant:** Gemini 2.5 Flash  
- **Containerization:** Docker & Docker Compose  

---

## Getting Started

### Clone Repository
```bash
git clone https://github.com/mdtawhidmostafa/AI_Vision_Image_Analysis_Platform.git
cd AI_Image_Analysis
```
### Access the Application

- Sign up and log in  
- Upload images 
- Perform YOLO object detection 
- View the annotated detection results 
- Ask questions using the Gemini assistant

### YOLO Model

- **Supported model example:** yolov8n.pt


### Security

- JWT tokens are stored securely in HTTP-only cookies.

### Storage

- Uploaded and annotated images are saved in:

  - backend/media/

### Frontend Communication

- Frontend calls backend APIs using credentials: include for cookie-based authentication.

### Table Features

- Detection table columns are fully sortable.

### Docker Notes

- The backend depends on MySQL, handled through depends_on in docker-compose.yml.

- Persistent storage:

  - db_data → MySQL data

  - media_data → Uploaded & annotated images

- To clean everything:
```bash
  docker compose down -v
```

### Author

-  Md. Tawhid Mostafa










