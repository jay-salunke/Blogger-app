<% @Language="VBScript" %>
<% Option Explicit %>
<%
  dim old_password, new_password
  dim con, rs
  old_password = Request.Form("old_password")
  new_password = Request.Form("new_password")

  connect()
  update_password()

  function connect()
    set con = Server.CreateObject("ADODB.Connection")
    con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
    con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")
  end function

  function update_password()
    dim select_query, recordAffected, update_query
    set rs = Server.CreateObject("ADODB.recordset")
    select_query = "SELECT * FROM users WHERE id = " & Session("id") & ";"
    rs.Open select_query, con
    if rs("password") = old_password then
        update_query = "UPDATE users SET [password] = '"& new_password &"' WHERE id = "& Session("id")&";"
        con.Execute update_query, recordAffected
        if recordAffected then
            %>
                <script>
                    alert("Password updated successfully");
                    location.replace("../home.asp");
                </script>
            <%
        else
            %>
                <script>
                    alert("Failed to update password");
                </script>
            <%
        end if
    else
        %>
            <script>
                alert("Old password isn't matching");
            </script>
        <%
    end if
  end function
%>
