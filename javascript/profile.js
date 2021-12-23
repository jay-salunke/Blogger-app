const updatePasswordForm = document.querySelector("#update_password");
const oldPassword = document.querySelector("#oldPassword");
const newPassword = document.querySelector("#newPassword");
const confirmPassword = document.querySelector("#confirmPassword");

updatePasswordForm.onsubmit = (e) => {
  e.preventDefault();
  if (!validatePassword(oldPassword)) return showWarningMessage("Old");
  if (!validatePassword(newPassword)) return showWarningMessage("New");
  if (!validatePassword(confirmPassword)) return showWarningMessage("Confirm");
  if (newPassword.value.trim() !== confirmPassword.value.trim())
    return alert("Password are not matching");
  updatePasswordForm.submit();
};

const validatePassword = (password) => {
  const passwordLength = password.value.trim().length;
  return passwordLength >= 8 && passwordLength <= 16;
};

const showWarningMessage = (message) => {
  alert(`${message} Password range must be between 8 - 16 Characters`);
};
