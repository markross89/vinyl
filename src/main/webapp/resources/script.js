// user menu expand list

var coll = document.getElementsByClassName("collapsible");
const userOverlay = document.getElementById("user-overlay");
var i;
for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
        this.classList.toggle("active");
        userOverlay.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    });
}

const elements = document.getElementsByClassName("add-remove");
const menus = document.getElementsByClassName("add-remove-content");


for (i = 0; i < elements.length; i++) {
    elements[i].addEventListener("mouseover", function () {
        this.nextElementSibling.style.display = "flex";
    },);
}
for (i = 0; i < menus.length; i++) {
    menus[i].addEventListener("mouseleave", function () {
        this.style.display = "none";
    });
}
userOverlay.addEventListener("click", () => {
    userOverlay.classList.remove("active");
    coll[0].nextElementSibling.style.display = "none";
    coll[0].classList.remove("active");
});


// user menu expand list end

// pop up window for login register etc.
const openModalButton = document.querySelectorAll("[data-modal-target]");
const closeModalButton = document.querySelectorAll("[data-close-button]");
const overlay = document.getElementById("overlay");

openModalButton.forEach((button) => {
    button.addEventListener("click", () => {
        const modal = document.querySelector(button.dataset.modalTarget);
        openModal(modal);
    });
});
overlay.addEventListener("click", () => {
    const modals = document.querySelectorAll(".modal.active");
    modals.forEach((modal) => {
        closeModal(modal);
    });
});

closeModalButton.forEach((button) => {
    button.addEventListener("click", () => {
        const modal = button.closest(".modal");
        closeModal(modal);
    });
});

function openModal(modal) {
    if (modal == null) return;
    modal.classList.add("active");
    overlay.classList.add("active");
}

function closeModal(modal) {
    if (modal == null) return;
    modal.classList.remove("active");
    overlay.classList.remove("active");
}

// pop up window for login register etc. end


// login validation


let form = document.querySelector('.markus-form')

function checkValid() {
    let username = form.querySelector('#email').value.trim();
    let pass = form.querySelector('#password').value.trim();
    let username_error = form.querySelector('#email_error');
    let password_error = form.querySelector('#password_error');
    let usernameRegex = /^\S+@\S+\.\S+$/;
    let passRegex = /^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;

    if (username === '' || !username.match(usernameRegex)) {
        username_error.style.display = "block"
        if (pass === '' || !pass.match(passRegex)) {
            password_error.style.display = "block"
        } else {
            password_error.style.display = "none"
        }

    } else {
        username_error.style.display = "none"
        if (pass === '' || !pass.match(passRegex)) {
            password_error.style.display = "block"
        } else {
            password_error.style.display = "none"
            username_error.style.display = "none"
            form.submit();
        }
    }
}

form.addEventListener('submit', (e) => {
    e.preventDefault();

    checkValid();
})

// login validation end


// email validation

function validate() {
    const form = document.querySelector('.markus-email-form');
    const emailValue = document.getElementById("email-verification").value;
    const emailError = document.getElementById("email-verification-error");
    const regex = /^\S+@\S+\.\S+$/;
    if (regex.test(emailValue)) {
        emailError.style.display = "none";
        form.submit();
    } else {
        emailError.style.display = "block";
    }
}

function validatePlaylist() {
    const form = document.getElementById("playlist-form");
    const emailValue = document.getElementById("playlistName").value;
    const emailError = document.getElementById("playlistError");
    const regex = /\S+/;
    if (regex.test(emailValue)) {
        emailError.style.display = "none";
        form.submit();
    } else {
        emailError.style.display = "block";
    }
}

function validateBox() {
    const form = document.getElementById("box-form");
    const emailValue = document.getElementById("box-input").value;
    const emailError = document.getElementById("error-message");
    const regex = /\S+/;
    if (regex.test(emailValue)) {
        emailError.style.display = "none";
        form.submit();
    } else {
        emailError.style.display = "block";
    }
}

function ggg() {
    document.getElementById('song-id').value = event.currentTarget.id
}




