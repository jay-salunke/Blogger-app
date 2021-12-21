<% @Language="VBScript" %>
<% Option Explicit %>
<%
  dim email, password, username
  dim con, rs
  email = Request.Form("email")
  password = Request.Form("password")
  username = Request.Form("username")

  connect()
  search()
  function connect()
    set con = Server.CreateObject("ADODB.Connection")
    con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
    con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")
  end function

  function search()
    set rs = Server.CreateObject("ADODB.recordset")
    rs.Open "select * from users where email_id = '" & email & "'", con
    if not rs.EOF then
      %>
      <script>
        alert("User already exists!")
        location.replace("../pages/signup.html")
      </script>
      <%
    else
      add_user()
      Response.Write("Welcome " & email)
    end if     
  end function

  function add_user()
    dim recordAffected
    set rs = Server.CreateObject("ADODB.recordset")
    dim query
    query = "INSERT INTO users ([email_id], [password], [username]) VALUES ('" & email & "', '" & password & "', '" & username & "')"
    con.Execute query, recordAffected
    if recordAffected then
      %>
      <script>
        alert("Data Inserted Successfully");
      </script>
      <%
    else
      %>
      <script>
        alert("Couldn't Insert Record");
      </script>
      <%
    end if
  end function
%>
