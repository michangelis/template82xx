<%@ page import="exercise2_2022_2023_8200001.User" %>
<%@ page import="exercise2_2022_2023_8200001.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8200001.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="header_ex2_8200001.jsp"/>
	</head>
	
	<body>
	<%	User user = (User) session.getAttribute("userObj2022");
		if (user == null){
			request.setAttribute("message", "You are not authorized to access this resource. Please login");
	%>
			<jsp:forward page="login_ex2_8200001.jsp"></jsp:forward>

	<%
		}
	%>
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
						<li><a href="index_ex2_8200001.jsp">Home</a></li>
						<li><a href="about_ex2_8200001.jsp">About</a></li>
						<li class="active"><a href="dashboard_ex2_8200001.jsp">Dashboard</a></li>
										
					</ul>
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<p class="navbar-text">Signed in as <%=user.getUsername()%></p>
						</li>
						<li>
							<a href="logout_ex2_8200001.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
						</li>								        	
			        </ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>2η Ατομική Άσκηση</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Welcome <code><%=user.getFirstname()%> <%=user.getLastname()%></code></h1>
			</div>

			<%
				UserDAO usr_dao = new UserDAO();
				List<User> users = new ArrayList<User>();
				users = usr_dao.getUsers();
				int available_users = users.size();
			%>
            
            <div class="row">

                <div class="col-xs-12">
                    <h2>Available Users <span class="badge"><%=available_users%></span></h2>
                </div>
				<table class="table table-bordered">
					<tr class="info">
						<th><strong class="text-">A/A</strong></th>
						<th><strong>Last Name</strong></th>
						<th><strong>First Name</strong></th>
						<th><strong>Email</strong></th>
					</tr>
					<tbody>
			<%
						for (int i = 0; i < users.size(); i++){
							if(user.getUsername().equals(users.get(i).getUsername())){
			%>
								<tr class="success">
									<th><%=i+1%></th>
									<td><%=users.get(i).getLastname()%></td>
									<td><%=users.get(i).getFirstname()%></td>
									<td><%=users.get(i).getEmail()%></td>
								</tr>
			<%
							}else {
			%>
								<tr>
									<th scope="row"><%=i+1%></th>
									<td><%=users.get(i).getLastname()%></td>
									<td><%=users.get(i).getFirstname()%></td>
									<td><%=users.get(i).getEmail()%></td>
								</tr>
			<%
						}
				}
			%>


					</tbody>
				</table>

            </div>
			
		</div>
		<!-- /container -->

		<jsp:include page="footer_ex2_8200001.jsp"/>


		
	</body>
</html>