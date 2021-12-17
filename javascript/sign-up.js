const form = document.querySelector("form");
const username = document.querySelector("#username");
const email = document.querySelector("#email");
const password = document.querySelector("#password");
const eyeIcon = document.querySelector("#eye-icon");

form.onsubmit = (e) => {
  e.preventDefault();
  if (!isEmpty(username)) showErrorMessage("Username cannot be empty");
  checkEmail(email);
  checkPassword(password);
};

const checkEmail = (email) => {
  if (!validateEmail(email)) showErrorMessage("Please enter a valid email");
};

const checkPassword = (password) => {
  if (!validatePassword(password))
    showErrorMessage("Password length must be between 8 - 16 characters");
};

const validateEmail = (email) => {
  return String(email.value.trim())
    .toLowerCase()
    .match(/[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/);
};

const validatePassword = (password) => {
  const passwordLength = password.value.trim().length;
  return passwordLength >= 8 && passwordLength <= 16;
};

const isEmpty = (element) => element.value.trim().length > 0;

const showErrorMessage = (message) => {
  Swal.fire({
    icon: "error",
    title: "Error message!!",
    text: message,
  });
};

eyeIcon.addEventListener("click", function (e) {
  e.preventDefault();
  const currentClassList = e.target.classList;
  if (currentClassList.contains("fa-eye")) {
    currentClassList.replace("fa-eye", "fa-eye-slash");
    password.type = "password";
  } else {
    currentClassList.replace("fa-eye-slash", "fa-eye");
    password.type = "text";
  }
});
