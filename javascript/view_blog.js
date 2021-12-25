const updateButton = document.querySelector("#update");
const deleteButton = document.querySelector("#delete");
const saveButton = document.querySelector("#save");
const cancelButton = document.querySelector("#cancel");
const blogTitle = document.querySelector("#blog_title");

const cardView = document.querySelector("#card_view");
const formView = document.querySelector("#form_view");

const formTitle = document.querySelector("#form_title");
const formContent = document.querySelector("#form_content");
const formFilePath = document.querySelector("#file_path");
const formFileSource = document.querySelector("#file_source");
const buttonType = document.querySelector("#button_type");

console.log(blogTitle.value);

updateButton.addEventListener("click", (e) => {
  e.preventDefault();
  cardView.style.display = "none";
  formView.style.display = "block";
  formTitle.value = blogTitle.textContent;
});

cancelButton.addEventListener("click", (e) => {
  e.preventDefault();
  formView.style.display = "none";
  cardView.style.display = "block";
});

const isElementEmpty = (element) => element.value.trim().length == 0;

const errorMessage = (message) => {
  alert(`${message} should not be empty!!`);
};

saveButton.addEventListener("click", (e) => {
  e.preventDefault();
  const reader = new FileReader();
  reader.onload = () => {
    formFileSource.value = reader.result;
    formView.querySelector("form").submit();
  };
  if (isElementEmpty(formTitle)) return errorMessage("Title");
  if (isElementEmpty(formContent)) return errorMessage("Content");
  if (isElementEmpty(formFilePath)) return errorMessage("File");
  reader.readAsDataURL(formFilePath.files[0]);
});
