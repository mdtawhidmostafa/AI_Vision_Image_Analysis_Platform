const signupForm = document.querySelector(".signup-form");
const loginForm = document.querySelector(".login-form");

const csrftoken = document.querySelector('[name=csrf-token]').content;

// Signup
signupForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const full_name = document.getElementById("signup-name").value;
    const email = document.getElementById("signup-email").value;
    const password = document.getElementById("signup-password").value;
    const confirm = document.getElementById("signup-confirm").value;

    if (password !== confirm) {
        alert("Passwords do not match!");
        return;
    }

    const response = await fetch("/api/accounts/signup/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": csrftoken
        },
        body: JSON.stringify({ full_name, email, password })
    });

    const data = await response.json();
    if (response.status === 201) {
        alert(data.message);
        signupForm.reset();
        window.location.href = "/home/";  // redirect after signup
    } else {
        alert(JSON.stringify(data));
    }
});

// Login
loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const email = document.getElementById("login-email").value;
    const password = document.getElementById("login-password").value;

    const response = await fetch("/api/accounts/login/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": csrftoken
        },
        body: JSON.stringify({ email, password })
    });

    const data = await response.json();
    if (response.status === 200) {
        alert(data.message);
        loginForm.reset();
        window.location.href = "/home/";  // redirect after login
    } else {
        alert(JSON.stringify(data));
    }
});
