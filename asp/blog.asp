<%@Language = "VBScript"%>
<% Option Explicit%>

<%
dim title, content, file_path, username, created_at, id
dim recordAffected, con
title = Request.Form("title")
content = Request.Form("content")
file_path = Request.Form("file_source")
created_at = Date()
username = Session("username")
id = Session("id")

connect()
add_blog()

function connect()
    set con = Server.CreateObject("ADODB.Connection")
    con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
    con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")
end function

function add_blog()
    dim query
    query = "INSERT INTO blogs([title], [content], [created_at], [image_path], [user_id]) VALUES('"& title &"','"& content &"','"& created_at &"','"& file_path &"',"& id &");"
    con.Execute query, recordAffected
    if recordAffected then
      %>
        <script>
          alert("Blog added successfully");
          location.replace("../home.asp")
        </script>
      <%
    else
      %>
        <script>
          alert("Cannot add blog!");
          location.replace("../home.asp")
          document.getElementById("create").click()
        </script>
      <%
    end if
end function
%>
