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
  <title><% Response.Write(rs("title")) %></title>
  <body>
    <div class="card">
      <div class="image">
        <img src=<% Response.Write(rs("image_path")) %> alt="image">
      </div>
      <div class="content">
        <div class="title">
          <h4><% Response.Write(rs("title")) %></h4>
          <i class="far fa-heart"></i>
        </div>
        <p><% Response.Write(rs("content")) %></p>
        <div class="details">
          <h5><% Response.Write(FormatDateTime(rs("created_at"), 1)) %></h5>
          <h5><% Response.Write(rs("username")) %></h5>
        </div>
      </div>
    </div>
    <button>UPDATE</button>
    <button>DELETE</button>
  </body>
</head>
</html>
