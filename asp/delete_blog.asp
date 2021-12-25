<% @Language="VBScript" %>
<% Option Explicit %>

<%
  dim con, rs
  Dim id
  id = Request.Form("blog_id")

  set con = Server.CreateObject("ADODB.Connection")
  con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
  con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")

  Dim recordAffected, query
  set rs = Server.CreateObject("ADODB.recordset")
  query = "DELETE * FROM blogs WHERE [blog_id] = " & id
  con.execute query, recordAffected
  If recordAffected then
    %>
      <script>
        alert("Blog deleted successfully")
        location.replace("../home.asp")
      </script>
    <%
  Else
    %>
      <script>
        alert("Failed to delete the blog")
        location.replace("../home.asp")
      </script>
    <%
  end If
%>
