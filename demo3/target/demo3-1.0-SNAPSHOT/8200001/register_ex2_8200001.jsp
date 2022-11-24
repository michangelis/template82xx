<%@ page import="exercise2_2022_2023_8200001.User" %>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <jsp:include page="header_ex2_8200001.jsp"/>
	</head>

   <body>
    <%request.setCharacterEncoding("ISO-8859-7");%>
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
            <%	User user = (User) session.getAttribute("userObj2022");
                if (user == null){

            %>

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index_ex2_8200001.jsp">Home</a></li>
                    <li><a href="about_ex2_8200001.jsp">About</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="register_ex2_8200001.jsp">Register</a></li>
                    <li><a href="login_ex2_8200001.jsp">Sign In</a></li>
                </ul>

            </div>


            <%

            } else {
            %>					<div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index_ex2_8200001.jsp">Home</a></li>
                <li><a href="about_ex2_8200001.jsp">About</a></li>
                <li><a href="dashboard_ex2_8200001.jsp">Dashboard</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <p class="navbar-text">Signed in as <%=user.getUsername()%></p>
                </li>
                <li>
                    <a href="logout_ex2_8200001.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                </li>
            </ul>
            </ul>
        </div>

            <%

                }
            %>
        </div>
    </nav>

    <div class="container">
        <div class="container theme-showcase" role="main">

            <!-- Main jumbotron for a primary marketing message or call to action -->
            <div class="jumbotron">
                <h1>1η Ατομική Άσκηση</h1>
            </div>
        </div>

            <div class="page-header">
                <h1>Registration Form</h1>
            </div>

        <div class="alert alert-warning alert-dismissible fade in text-center" role="alert">
            <strong>Please fill the following form  to create an account</strong>
        </div>




      <form id = "form1" name = "form1" method="POST" action = "registerController_ex1_8200001.jsp" class="form-horizontal">

        <!-- Firstname -->
        <div class="form-group">
          <label for="firstname" class="col-sm-2 control-label main-label">Name </label>
          <div class="col-sm-5">
            <input type="text" name="firstname" id="firstname" class="form-control" placeholder="your name">
          </div>
        </div>

        <!-- Lastaname -->
        <div class="form-group">
          <label for="surname" class="col-sm-2 control-label main-label">Surname  </label>
          <div class="col-sm-5">
            <input type="text" name="surname" id="surname" class="form-control" placeholder="your surname">
          </div>
        </div>

        <!-- Email -->
        <div class="form-group">
          <label for="email" class="col-sm-2 control-label main-label">Email </label>
          <div class="col-sm-5">
            <input type="text" name="email" id="email" class="form-control" placeholder="your email">
          </div>
        </div>

        <!-- Username -->
        <div class="form-group">
          <label for="username" class="col-sm-2 control-label main-label">Username </label>
          <div class="col-sm-5">
            <input type="text" name="username" id="username" class="form-control" placeholder="your username">
          </div>
        </div>
          <!-- Password -->
          <div class="form-group">
              <label for="password" class="col-sm-2 control-label main-label">Password </label>
              <div class="col-sm-5">
                  <input type="password" name="password" id="password" class="form-control" placeholder="your password">
              </div>
          </div>


          <!-- Confirm -->
          <div class="form-group">
              <label for="confirm" class="col-sm-2 control-label main-label">Confirm </label>
              <div class="col-sm-5">
                  <input type="password" name="confirm" id="confirm" class="form-control" placeholder="confirm your password">
              </div>
          </div>

        
        <!-- terms -->
        <div class="form-group">
    
          <label class="col-sm-2 control-label main-label"></label>
          <div class="col-sm-5">
    
            <label class="checkbox-inline">
              <input type="checkbox" name="checkbox" value="True"> <p class="text-info">I agree to the terms and conditions</p>
            </label>
          </div>
                
        </div>

        
        <!-- buttons -->
        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <a href="registerController_ex1_8200001.jsp">
                    <button type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-ok"></span>Submit
                    </button>
                </a>
                <a href="register_ex2_8200001.jsp">
                    <button type="reset" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> Cancel
                    </button>
                </a>
            </div>
        </div>
      </form>
    </div><!-- /.container -->

    <jsp:include page="footer_ex2_8200001.jsp"/>

   </body>
</html>
