<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8200001.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="header_ex2_8200001.jsp"/>
	</head>
	
	<body>
		
		<div class="container" role="main">

            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
    
            <form class="form-signin" method="post" action="loginController_ex2_8200001.jsp">
                <h2 class="form-signin-heading text-center">Please sign in</h2>
                <label for="inputusername" class="sr-only">Username</label> 
                <input type="text" name="username" id="inputusername" class="form-control" placeholder="username" required>
                <label for="inputpassword" class="sr-only">Password</label>
                <input name="password" type="password" id="inputpassword" class="form-control" placeholder="password" required>
    
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
            <div class="alert alert-info"><strong>Help: </strong>
                    <ul>
                        <li>For John Doe: jdoe 1111</li>
                        <li>For Mary Smith: msmith 2222</li>
                        <li>For Bob Jakson: bjakson 3333</li>
                    </ul>
            </div>
    
        </div>
		<!-- /container -->

		<jsp:include page="footer_ex2_8200001.jsp"/>


	</body>
</html>