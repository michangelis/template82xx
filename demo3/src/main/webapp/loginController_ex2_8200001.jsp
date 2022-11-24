<%@ page import="exercise2_2022_2023_8200001.UserDAO" %>
<%@ page import="exercise2_2022_2023_8200001.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage = "error_ex2_8200001.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO usr = new UserDAO();

        try {
            User user = usr.authenticate(username, password);
            session.setAttribute("userObj2022", user);
            response.sendRedirect("dashboard_ex2_8200001.jsp");

        }catch(Exception e){
            request.setAttribute("message", "wrong username or password!");
    %>
            <jsp:forward page="login_ex2_8200001.jsp"></jsp:forward>

    <%
        }


    %>


</body>
</html>
