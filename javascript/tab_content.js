function open_page(pageName = "Home", displayType = "grid") {
  const tabcontent = document.querySelectorAll(".tab_content");

  // add display none for all pages
  tabcontent.forEach((ele) => (ele.style.display = "none"));

  // show selected page
  document.getElementById(pageName).style.display = displayType;
}
