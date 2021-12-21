
<% @Language = "VBScript" %>
<%Option Explicit%>
<html>
<head>
<link rel="stylesheet" href="sweetalert2.min.css">
</head>
<body>
<%
dim email
dim password
dim con
dim rs
dim data
email = Request.Form("email-id")
password = Request.Form("password")
search()

function search()
set con = Server.CreateObject("ADODB.Connection")
con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
con.Open("D:\Classic Asp Project\database\Blogger.accdb")
set rs = Server.CreateObject("ADODB.recordset")
rs.Open "select * from users where email_id = '"&email&"' and password='"&password&"'",con
if rs.EOF then
  %>
   <script>
    alert("nhi hai")
   </script>
  <%
else
  Response.Write("hai")

end if     
end function
%>