<% @Language = "VBScript" %>
<% Option Explicit %>  
<%
  If IsEmpty(Session("email")) Then 
    Response.Redirect("index.html")
  End If
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" -
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/home.css">
    <link rel="stylesheet" href="styles/create.css">
    <title>Blogger | Home</title>
</head>

<body>
    <nav>
        <div class="content">
            <h1></h1>
            <h4>Create Page</h4>
            <i class="fas fa-bars"></i>
        </div>
    </nav>
    <div class="sidebar">
        <div class="header" id="default_page" onclick="open_page('home','grid')">
            <h5><i class="fas fa-th-large"></i>Blogger App</h5>
        </div>
        <ul>
            <li><a href="#" class="tab_link" onclick="open_page('create','flex')"><i
                        class="far fa-plus-square"></i></i>Create</a></li>
            <li><a href="#" class="tab_link" onclick="open_page()"><i class=" far
                    fa-heart"></i>Favourites</a></li>
            <li><a href="#" class="tab_link"><i class="far fa-heart"></i>Profile</a></li>
            <li><a href="asp/logout.asp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </div>

    <div class="main">
        <!-- BLOG PAGE -->
        <div class="card-container tab_content" id="home">
            <%
                Dim con, rs, x

                function connect()
                    set con = Server.CreateObject("ADODB.Connection")
                    con.ConnectionString = "PROVIDER=Microsoft.ACE.OLEDB.12.0"
                    con.Open("D:\ASP Final Project\Blogger-app\database\Blogger.accdb")
                end function
                
                connect()
                set rs = Server.CreateObject("ADODB.recordset")
                rs.Open "SELECT * FROM blogs INNER JOIN users ON blogs.user_id = users.id", con

                Do Until rs.EOF 
                        %>
                            <div class="card">
                                <div class="image">
                                    <img src=<% Response.Write(rs("image_path")) %> alt="computer">
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
                        <%
                    rs.MoveNext
                Loop
                %>

        </div>

        <!-- CREATE PAGE -->
        <div class="card tab_content" id="create">
            <div class="create-content ">
                <div class="photo-content">
                    <img src="./images/create-blog.jpg" alt="" id="temp-img">
                </div>
                <div class="form-content">
                    <h5>Create Blog</h5>
                    <form action="./asp/blog.asp" method="POST">
                        <div class="control">
                            <label for="">Title</label>
                            <input type="text" id="title" placeholder="Enter title" name="title">
                        </div>
                        <div class="control">
                            <label for="">Content</label>
                            <textarea name="content" id="content" cols="30" rows="10"></textarea>
                        </div>
                        <div class="control">
                            <label for="">Select Image</label>
                            <input type="file" placeholder="Select image" id="file_path" name="file_path">
                            <input type="hidden" id="file_source" name="file_source">
                        </div>
                        <button type="submit">Publish</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="./javascript/tab_content.js"></script>
    <script src="./javascript/create_blog.js"></script>
</body>

</html>
