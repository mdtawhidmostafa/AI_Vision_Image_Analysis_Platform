let detectionsList = []; // <-- GLOBAL FIXED STORAGE

const uploadArea = document.getElementById('uploadArea');
const selectBtn = document.getElementById('selectBtn');
const fileInput = document.getElementById('fileInput');
const imagePreview = document.getElementById('imagePreview');
const previewImg = document.getElementById('previewImg');
const resultsSection = document.getElementById('resultsSection');
const annotatedImage = document.getElementById('annotatedImage');
const detectBtn = document.getElementById('detectBtn');
const uploadProgress = document.getElementById('uploadProgress');
const progressBar = document.getElementById('progressBar');
const progressText = document.getElementById('progressText');
const chatContainer = document.getElementById('chatContainer');
const qaInput = document.querySelector('.qa-input');
const qaSubmit = document.querySelector('.qa-submit');

// Prevent double click issue
selectBtn.addEventListener('click', e => {
    e.stopPropagation();
    fileInput.click();
});

// Drag and drop
uploadArea.addEventListener('dragover', e => { e.preventDefault(); uploadArea.classList.add('dragover'); });
uploadArea.addEventListener('dragleave', () => uploadArea.classList.remove('dragover'));
uploadArea.addEventListener('drop', e => {
    e.preventDefault();
    uploadArea.classList.remove('dragover');
    const file = e.dataTransfer.files[0];
    if (file && file.type.startsWith('image/')) handleFile(file);
});

fileInput.addEventListener('change', e => { const file = e.target.files[0]; if(file) handleFile(file); });

function handleFile(file) {
    const reader = new FileReader();
    reader.onload = e => {
        previewImg.src = e.target.result;
        imagePreview.classList.add('active');
    };
    reader.readAsDataURL(file);
}

function removeImage() {
    fileInput.value = '';
    previewImg.src = '';
    annotatedImage.src = '';
    resultsSection.style.display = 'none';
    imagePreview.classList.remove('active');
    detectionsList = []; // reset
}

// ---------- FIXED DETECT FUNCTION ----------
function detectImage() {
    if(!fileInput.files[0]) return alert("Please upload an image first.");

    const formData = new FormData();
    formData.append('image', fileInput.files[0]);

    uploadProgress.style.display = 'block';
    progressBar.style.width = '0%';
    progressText.textContent = '0%';

    fetch('/api/detect/', {
        method: 'POST',
        body: formData,
        headers: {'X-CSRFToken': getCookie('csrftoken')}
    }).then(res => res.json())
      .then(data => {
        if(data.error) { alert(data.error); uploadProgress.style.display='none'; return; }

        annotatedImage.src = data.annotated_image_url;

        detectionsList = data.results;  // <-- FIXED: STORE RESULTS FOR GEMINI

        const tbody = document.querySelector('.results-table tbody');
        tbody.innerHTML = '';

        data.results.forEach(obj => {
            const row = document.createElement('tr');
            row.innerHTML =
                `<td>${obj.label}</td>
                 <td>${(obj.confidence * 100).toFixed(0)}%</td>
                 <td>(${obj.bbox.join(', ')})</td>`;
            tbody.appendChild(row);
        });

        document.getElementById('objectCount').textContent = `${data.results.length} Objects`;
        resultsSection.style.display = 'block';

        // fake progress visual
        let progress = 0;
        const interval = setInterval(()=>{
            progress += 10;
            progressBar.style.width = progress+'%';
            progressText.textContent = progress+'%';
            if(progress>=100) { clearInterval(interval); uploadProgress.style.display='none'; }
        }, 100);
    })
    .catch(err => {
        console.error(err);
        alert("Detection failed");
        uploadProgress.style.display='none';
    });
}

detectBtn.addEventListener('click', detectImage);

// ---------- FIXED Q&A ----------
qaSubmit.addEventListener('click', () => {
    const question = qaInput.value.trim();
    if(!question) return;

    // USER MESSAGE UI
    
    const userAvatar = document.querySelector('.user-menu .avatar').innerHTML || 'User';

    const userMsg = document.createElement('div');
    userMsg.classList.add('chat-message','user');
    userMsg.innerHTML = `
        <div class="message-avatar user">${userAvatar}</div>
        <div class="message-content">${question}</div>
    `;
    chatContainer.appendChild(userMsg);
    chatContainer.scrollTop = chatContainer.scrollHeight;

    // SEND BOTH QUESTION + DETECTIONS
    fetch('/api/ask/', {
        method:'POST',
        headers:{'Content-Type': 'application/json','X-CSRFToken':getCookie('csrftoken')},
        body:JSON.stringify({
            question: question,
            detections: detectionsList   // <-- FIXED: SEND YOLO RESULTS TO GEMINI
        })
    })
    .then(res => res.json())
    .then(data => {
        const aiMsg = document.createElement('div');
        aiMsg.classList.add('chat-message','ai');
        aiMsg.innerHTML =
            `<div class="message-avatar ai">AI</div>
             <div class="message-content">${data.answer||data.error}</div>`;
        chatContainer.appendChild(aiMsg);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    });

    qaInput.value = '';
});

// Cookie helper
function getCookie(name) {
    let cookieValue = null;
    if(document.cookie && document.cookie!=='') {
        const cookies = document.cookie.split(';');
        for(let i=0;i<cookies.length;i++){
            const cookie = cookies[i].trim();
            if(cookie.substring(0,name.length+1)=== (name+'=')){
                cookieValue = decodeURIComponent(cookie.substring(name.length+1));
                break;
            }
        }
    }
    return cookieValue;
}

qaInput.addEventListener('keypress', e=>{ if(e.key==='Enter') qaSubmit.click(); });
