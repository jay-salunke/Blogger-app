function handleBlogClick(e) {
  const blogId = e.querySelector("#_id").name;
  const blogForm = document.querySelector("#view form");
  const blogInput = blogForm.querySelector("#blog_id");
  blogInput.value = blogId;
  blogForm.submit();
}
