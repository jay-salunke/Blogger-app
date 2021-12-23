<% @Language="VBScript" %>
<% Option Explicit %>
<%
  Dim id
  Dim rs, con

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
    <div class="card">
      <div class="image">
        <img src=<% Response.Write(rs("image_path")) %> alt="image">
      </div>
      <div class="content">
        <div class="title">
          <h4><% Response.Write(rs("title")) %></h4>
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
        <button id = "delete"><i class="fas fa-trash-alt"></i>DELETE</button>
     </div>
    </div>
    
  </body>
</head>
</html>
