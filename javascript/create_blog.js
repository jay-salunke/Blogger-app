const form = document.querySelector("form");
const title = document.querySelector("#title");
const content = document.querySelector("#content");
const file_path = document.querySelector("#file_path");
const file_source = document.querySelector("#file_source");

const isEmpty = (element) => element.value.trim().length == 0;

form.onsubmit = (e) => {
  e.preventDefault();
  const reader = new FileReader();
  reader.onload = () => {
    file_source.value = reader.result;
    form.submit();
  };
  if (isEmpty(title)) return errorMessage("Title");
  if (isEmpty(content)) return errorMessage("Content");
  if (isEmpty(file_path)) return errorMessage("File");
  reader.readAsDataURL(file_path.files[0]);
};

const errorMessage = (message) => {
  alert(`${message} should not be empty!!`);
};
