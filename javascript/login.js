const form = document.querySelector("form");
const email = document.querySelector("#email");
const password = document.querySelector("#password");
const eyeIcon = document.querySelector("#eye-icon");

form.onsubmit = (e) => {
  e.preventDefault();
  if (isEmpty(email)) return showErrorMessage("Email");
  if (isEmpty(password)) return showErrorMessage("Password");
  form.submit();
};

const isEmpty = (element) => element.value.trim().length === 0;

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

const showErrorMessage = (message) => {
  Swal.fire({
    icon: "error",
    title: "Error message!!",
    text: `${message} cannot be empty`,
  });
};
