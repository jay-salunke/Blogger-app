<% @Language="VBScript" %>
<% Option Explicit %>
<%
  Dim id,recaffected, query, update_val, delete_val
  Dim rs, con, title, content, file_source

  id = Request.Form("b_id")
  title = Request.Form("title")
  content = Request.Form("content")
  file_source = Request.Form("file_source")
  update_val = Request.Form("update")
 
  set con = Server.CreateObject("ADODB.Connection")
  con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
  con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")

  update()

  function update()
    set rs = Server.CreateObject("ADODB.recordset")
    query = "UPDATE blogs SET title ='" & title & "', content = '" & content & "', image_path = '" & file_source & "' WHERE blog_id = " & id
    con.execute query, recaffected
    If recaffected then
      %>
        <script>
          alert("Blog updated")
          location.replace("../home.asp")
        </script>
      <%
    Else
      %>
        <script>
          alert("Failed to update the blog")
        </script>
      <%
    end If
  end function
%>
