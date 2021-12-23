<% @Language="VBScript" %>
<% Option Explicit %>
<% If IsEmpty(Session("email")) Then Response.Redirect("index.html") End If %>
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
    <link rel="stylesheet" href="styles/profile.css">
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
            <li><a href="#" class="tab_link"><i class="far fa-user"></i>Profile</a></li>
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
                            <div class="card" onclick="handleBlogClick(this);">
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
                                <input type="hidden" id="_id" name=<% Response.Write(rs("blog_id")) %> />
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
                            <label for="title">Title</label>
                            <input type="text" id="title" placeholder="Enter title" name="title">
                        </div>
                        <div class="control">
                            <label for="content">Content</label>
                            <textarea name="content" id="content" cols="30" rows="10"></textarea>
                        </div>
                        <div class="control">
                            <label for="file_path">Select Image</label>
                            <input type="file" placeholder="Select image" id="file_path" name="file_path">
                            <input type="hidden" id="file_source" name="file_source">
                        </div>
                        <button type="submit">Publish</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- PROFILE PAGE -->
        <%
             set rs = Server.CreateObject("ADODB.recordset")
             rs.Open "SELECT * FROM users where [username] = '"& Session("username") & "'", con
        %>
        <div class="profile-page tab_content" id="profile">
            <div class="user-details">
                <h4>My Profile</h4>
                <div class="info">
                    <div class="control">
                        <label for="">Username</label>
                        <input type="text" value=<%Response.Write(rs("username"))%>>
                    </div>

                    <div class="control">
                        <label for="">Email address</label>
                        <input type="email" value=<%Response.Write(rs("email_id"))%>>
                    </div>
        <%
            set rs = Server.CreateObject("ADODB.recordset")
            rs.Open "SELECT COUNT(user_id) as TOTAL FROM blogs WHERE user_id = "& Session("id") &"", con
        %>
                    <div class="control">
                        <label for="">Total blogs</label>
                        <input type="number" value=<%Response.Write(rs("total"))%>>
                    </div>
                </div>
                <form action="./asp/update_password.asp" method="POST" id="update_password">
                    <div class="change-password">
                        <h4>Update Password</h4>
                        <div class="container">
                            <div class="control">
                                <label for="">Old Password</label>
                                <input type="password" name="old_password" placeholder="Old password" id="oldPassword">
                            </div>
                            <div class="control">
                                <label for="">New Password</label>
                                <input type="password" name="new_password" placeholder="New password" id="newPassword">
                            </div>
                            <div class="control">
                                <label for="">Confirm Password</label>
                                <input type="password" name="confirm_password" placeholder="Confirm password" id="confirmPassword">
                            </div>
                            <button type="submit">Update</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="blogs">
                <h4>My blog</h4>
                <div class="card-container">
                    <%
                        Dim query
                        connect()
                        set rs = Server.CreateObject("ADODB.recordset")
                        query = "SELECT * FROM blogs WHERE [user_id] = " & Session("id")
                        rs.Open query, con
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
                                        <h5><% Response.Write(Session("username")) %></h5>
                                    </div>
                                </div>
                            </div>
                        <%
                        rs.MoveNext
                    Loop
                    %>
                </div>
            </div>
        </div>
        <!-- OPEN VIEW PAGE -->
        <div class="card tab_content" id="view">
            <form action="asp/view_blog.asp" method="POST">
                <div class="control">
                    <input type="hidden" id="blog_id" name="blog_id">
                </div>
            </form>
        </div>
    </div>

    <script src="./javascript/tab_content.js"></script>
    <script src="./javascript/create_blog.js"></script>
    <script src="./javascript/view_blog.js"></script>
    <script src="./javascript/profile.js"></script>
</body>

</html>
