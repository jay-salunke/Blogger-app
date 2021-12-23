function open_page(pageName = "Home", displayType = "grid") {
  const tabcontent = document.querySelectorAll(".tab_content");

  // add display none for all pages
  tabcontent.forEach((ele) => (ele.style.display = "none"));

  // show selected page
  document.getElementById(pageName).style.display = displayType;
}

const tabcontent = document.querySelectorAll(".tab_content");
tabcontent.forEach((ele) => (ele.style.display = "none"));
// const home = document.getElementById("home");
const home = document.getElementById("profile");
home.style.display = "flex";
home.click();
