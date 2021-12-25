<% @Language="VBScript" %>
<% Option Explicit %>
<%
  Dim id
  Dim rs, con, title

  id = Request.Form("blog_id")

  set con = Server.CreateObject("ADODB.Connection")
  con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
  con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")

  set rs = Server.CreateObject("ADODB.recordset")
  rs.Open "SELECT * FROM blogs INNER JOIN users ON blogs.user_id = users.id WHERE [blog_id] = " & id, con
%>

<html>
<head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" -
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">  
   <link rel="stylesheet" href="../styles/view_blog.css">
  <title><% Response.Write(rs("title")) %></title>
  <body>

    <!-- CARD VIEW -->
    <div class="card" id="card_view">
      <div class="image">
        <img src=<% Response.Write(rs("image_path")) %> alt="image">
      </div>
      <div class="content">
        <div class="title">
          <h4 id="blog_title"><% Response.Write(rs("title")) %></h4>
        </div>
        <p><% Response.Write(rs("content")) %></p>
        <div class="details">
          <h6><% Response.Write(FormatDateTime(rs("created_at"), 1)) %></h6>
          <h6><% Response.Write(rs("username")) %></h6>
        </div>
      </div>
     <div class="buttons">
        <button id ="update"><i class="fas fa-pen"></i>UPDATE</button>
        &nbsp;&nbsp;&nbsp;
        <form action="./delete_blog.asp" method="POST">
          <input type="hidden" name ="blog_id" value=<% Response.Write(id) %>>
          <button id = "delete" type="submit"><i class="fas fa-trash-alt"></i>DELETE</button>
        </form>
     </div>
    </div>

    <%
      set rs = Server.CreateObject("ADODB.recordset")
      rs.Open "SELECT * FROM blogs INNER JOIN users ON blogs.user_id = users.id WHERE [blog_id] = " & id, con
    %>

    <!-- FORM VIEW -->
    <div class="form-content" id="form_view">
        <form action="./update.asp" method="POST">
            <div class="control">
                <label for="title">Title</label>
                <input type="text" id="form_title" placeholder="Enter title" name="title">
            </div>
            <div class="control">
                <label for="content">Content</label>
                <textarea name="content" id="form_content" cols="30" rows="10">
                  <% Response.Write(rs("content")) %>
                </textarea>
            </div>
            <div class="control">
                <label for="file_path">Select Image</label>
                <input type="file" placeholder="Select image" value=<% Response.Write(rs("image_path")) %> id="file_path" name="file_path">
                <input type="hidden" id="file_source" name="file_source">
            </div>
            <input type="hidden" id="" name="b_id" value=<% Response.Write(id) %>>
            <div class="buttons">
                <button type="submit" value="update" id ="save" name="update">SAVE</button>
                &nbsp;&nbsp;&nbsp;
                <button id = "cancel" name="cancel">CANCEL</button>
            </div>
        </form>
    </div>
    
    <script src="../javascript/view_blog.js"></script>
    <script>
      document.getElementById("form_view").style.display = "none";
    </script>
  </body>
</head>
</html>
