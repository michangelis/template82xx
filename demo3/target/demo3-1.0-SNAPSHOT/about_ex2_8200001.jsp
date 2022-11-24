<%@ page import="exercise2_2022_2023_8200001.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="header_ex2_8200001.jsp"/>
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
			<%	User user = (User) session.getAttribute("userObj2022");
				if (user == null){

			%>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="index_ex2_8200001.jsp">Home</a></li>
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
				<li><a href="index_ex2_8200001.jsp">Home</a></li>
				<li class="active"><a href="about_ex2_8200001.jsp">About</a></li>
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

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>Group 21</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Group Members</h1>
			</div>

			<div class="media">
				<div class="media-left media-middle">
				  <a href="#">
					<img class="media-object" src="images/member1.png" alt="Image cannot be displayed">
				  </a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"></h4>
					<h1>John Doe <small>82xxx</small></h1>
					<span class="glyphicon glyphicon-envelope" aria-hidden="true">jdoe@example.com</span> 
			    </div>
			
			</div>

			<div class="media">
				<div class="media-left media-middle">
			  	<a href="#">
					<img class="media-object" src="images/member1.png" alt="Image cannot be displayed">
			  	</a>
			</div>
			<div class="media-body">
				<h4 class="media-heading"></h4>
				<h1>George Smith <small>82xxx</small></h1>
				<span class="glyphicon glyphicon-envelope" aria-hidden="true">jsmith@example.com</span> 
		    </div>
		</div>	
		<!-- /container -->
			<jsp:include page="footer_ex2_8200001.jsp"/>
	</body>
</html>