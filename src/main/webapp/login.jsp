<%@page import="com.example.customer_support_app.services.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.customer_support_app.beans.UserBean" %>
<jsp:useBean id="userBean" class="com.example.customer_support_app.beans.UserBean" scope="session"/>
<jsp:useBean id="userService" class="com.example.customer_support_app.services.UserService" scope="application"/>

<jsp:setProperty property="username" name="userBean" param="username" />
<jsp:setProperty property="password" name="userBean" param="password" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administratorska aplikacija</title>
</head>
<body>
<%
    if (request.getParameter("submitted") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userBean = userService.getUser(username, password);

        if (userBean != null) {
            response.sendRedirect("home.jsp");

        } else {
            response.sendRedirect("logout.jsp");

        }
    }
%>
<h2>Prijavi se</h2>
<form method="post" action="login.jsp">

    <label for="username">Korisnicko ime:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Lozinka:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <input type="hidden" name="submitted" value="true">
    <input type="submit" value="Prijavi se">
</form>
</body>
</html>