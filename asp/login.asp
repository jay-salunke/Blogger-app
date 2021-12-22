<% @Language="VBScript" %>
<% Option Explicit %>
<%
  dim email, password
  dim con, rs
  email = Request.Form("email")
  password = Request.Form("password")
  connect()
  search()

  function connect()
    set con = Server.CreateObject("ADODB.Connection")
    con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
    con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")
  end function

  function search()
    set rs = Server.CreateObject("ADODB.recordset")
    rs.Open "SELECT * FROM users WHERE email_id = '" & email & "' AND password='" & password & "'", con
    if rs.EOF then
      %>
      <script>
        alert("Invalid credentials")
        location.replace("../index.html")
      </script>
      <%
    else
      Response.Write("Welcome " & email)
      'create a sessions
      Session("email") = email
      Session("username") = rs.fields("username")
      Session("id") = rs.fields("id")
      Response.Redirect("../home.asp")
    end if     
  end function
%>
