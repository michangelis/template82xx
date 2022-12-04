<%@ page import="exercise3_2022_2023_8200001.User" %>
<%@ page import="exercise3_2022_2023_8200001.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header_ex3_8200001.jsp"/>
</head>

<body>
        <%	User user = (User) session.getAttribute("userObj2022");
            if (user != null){
                String search_username = request.getParameter("uname");
        %>

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
                        <li><a href="about_ex3_8200001.jsp">About</a></li>
                        <li class="active"><a href="dashboard_ex2_8200001.jsp">Dashboard</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <p class="navbar-text">Signed in as <%=user.getUsername()%></p>
                        </li>
                        <li>
                            <a href="logout_ex3_8200001.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                        </li>
                    </ul>

                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container" role="main">
            <div class="jumbotron">
                <h1>3η Ατομική Άσκηση</h1>
            </div>
        <%
            UserDAO userDAO = new UserDAO();
            try{
                User found = userDAO.findUser(search_username);
                if(found != null){

        %>
            <!-- Page Title -->
            <div class="page-header center-block">
                <h1>Profile of : <code><%=found.getFirstname()%> <%=found.getLastname()%></code></h1>
            </div>
            <ul class="list-group">
                <li class="list-group-item" style="border: none"><strong>First Name: </strong><%=found.getFirstname()%></li>
                <li class="list-group-item" style="border: none"><strong>Last Name: </strong><%=found.getLastname()%></li>
                <li class="list-group-item" style="border: none"><strong>Email: </strong><%=found.getEmail()%></li>
                <li class="list-group-item" style="border: none"><strong>Username: </strong><%=found.getUsername()%></li>
            </ul>
<%
                } else {
%>
            <div class="alert alert-danger" role="alert">
                <ul class = "mb-0">
                    <li class="mb-0">User not found</li>
                </ul>
            </div>
<%
                }

%>

<%
            }catch (Exception e){
%>
            <div class="alert alert-danger" role="alert">
                <ul class = "mb-0">
                    <li class="mb-0"><%=e.getMessage()%></li>
                </ul>
            </div>
<%
            }

        } else {
                request.setAttribute("message", "You are not authorized to access this resource. Please login");

        %>
        <jsp:forward page="login_ex3_8200001.jsp"></jsp:forward>

        <%

            }
        %>
        </div>

        <jsp:include page="footer_ex3_8200001.jsp"/>


    </body>
</html>