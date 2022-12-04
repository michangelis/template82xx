<%@ page import="exercise3_2022_2023_8200001.UserDAO" %>
<%@ page import="exercise3_2022_2023_8200001.User" %>
<%@ page import="exercise3_2022_2023_8200001.DB" %>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header_ex3_8200001.jsp"/>
</head>

<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span> <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">8200001</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="index_ex3_8200001.jsp">Home</a></li>
                <li class="active"><a href="register_ex3_8200001.jsp">Register</a></li>
                <li><a href="about_ex3_8200001.jsp">About</a></li>
            </ul>

        </div>
        <!--/.nav-collapse -->
    </div>
</nav>

<div class="container">
    <div class="container theme-showcase" role="main">

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <h1>3η Ατομική Άσκηση</h1>
        </div>
    </div>

    <% request.setCharacterEncoding("UTF-8");
       String name = request.getParameter("firstname");
       String surname = request.getParameter("surname");
       String email = request.getParameter("email");
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       String confirm = request.getParameter("confirm");
       String box = request.getParameter("checkbox");


       if (check_name(name) && check_name(surname) && username_check(username) && password_check(password) && password_confirm(password, confirm) && checkbox(box)){

           UserDAO userDAO = new UserDAO();
           User usr = new User(name, surname, email, username, password);


           try{
               String msg = "Registration almost done!";
               userDAO.register(usr);
    %>
            <div class="page-header">
                <h1><%=msg%></h1>
            </div>

            <div class="alert alert-success" role="alert">
            A verification link has been sent to : <%=email%>
            </div>

            <h5><strong>Name: </strong><%=name%></h5>
            <h5><strong>Surname: </strong><%=surname%></h5>
            <h5><strong>Email: </strong><%=email%></h5>
            <h5><strong>Username: </strong><%=username%></h5>

    <%
               }catch (Exception e){
                  String msg = "Registration form has errors!";
    %>
    <div class="page-header">
        <h1><%=msg%></h1>
    </div>
    <div class="alert alert-danger" role="alert">
        <ol class = "mb-0">
            <li class="mb-0"><%=e.getMessage()%></li>
        </ol>
    </div>

    <%
               }

        }else {
                String msg = "Registration form has errors!";
    %>

    <div class="page-header">
        <h1><%=msg%></h1>
    </div>
    <div class="alert alert-danger" role="alert">
        <ol class = "mb-0">
            <%
                if (!check_name(name)){
            %>
                <li class="mb-0">Name must be at least 3 characters long</li>
            <%
                }if(!check_name(surname)){
            %>
                <li class="mb-0">Surname must be at least 3 characters long</li>
            <%
                }if (!username_check(username)){
            %>
                <li class="mb-0">Username must be at least 5 characters long</li>
            <%
                }if (!password_check(password)){
            %>
                <li class="mb-0">Password must be at least 6 characters long</li>
            <%
                }if(!password_confirm(password, confirm)){
            %>
                <li class="mb-0">Passwords must match</li>
            <%
                }if(!checkbox(box)){
            %>
                <li class="mb-0">You must agree to the terms and conditions</li>
            <%
                }
        }
            %>
        </ol>
    </div>
    <div class="list-group">
        <a href="register_ex3_8200001.jsp">
            <button type="button" class="btn btn-info">
                <span class="glyphicon glyphicon-chevron-left"></span>Back to form
            </button>
        </a>
    </div>


</div>

    <jsp:include page="footer_ex3_8200001.jsp"/>

</body>
</html>

<%! public boolean check_name(String name){
    return name.length() >= 3;


}
    public boolean username_check(String username){
        return username.length() >= 5 ;

    }

    public boolean password_check(String password){
        return  password.length() >= 6;

    }

    public boolean password_confirm(String password, String confirm){
        return password.equals(confirm);

    }

    public boolean checkbox(String box){
        return box != null;

    }%>
