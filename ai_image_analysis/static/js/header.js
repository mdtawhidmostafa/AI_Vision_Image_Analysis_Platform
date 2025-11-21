document.addEventListener("DOMContentLoaded", () => {
    fetch("/api/accounts/me/", { method: "GET", credentials: "include" })
    .then(async res => {
        if (res.status === 401 || res.status === 403) window.location.href = "/";
        return res.json();
    })
    .then(data => {
        if (!data) return;
        const fullName = data.full_name;
        const email = data.email;
        document.querySelector(".user-name").textContent = fullName;
        document.querySelector(".user-email").textContent = email;
        const initials = fullName.split(" ").map(n => n[0].toUpperCase()).slice(0,2).join("");
        document.querySelector(".avatar").textContent = initials;
    })
    .catch(() => window.location.href = "/");

    document.querySelector(".logout-btn").addEventListener("click", () => {
        fetch("/api/accounts/logout/", { method: "POST", credentials: "include" })
        .finally(() => window.location.href = "/");
    });
});
