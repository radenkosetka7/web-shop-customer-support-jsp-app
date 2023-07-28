
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><html>
<%@page isErrorPage="true"%>
<jsp:useBean id="userBean" class="com.example.customer_support_app.beans.UserBean" scope="session"/>


<%
    if(!userBean.getLoggedIn())
    {
        response.sendRedirect("login.jsp");
    }
%>
<head>
    <title>Error page</title>
</head>
<body>
<div className='errorPage'>

    <div>
            <h2>An error occured.</h2>
            <button type="button" onclick="location.href='home.jsp'">Return To Home</button>
        </div>
    </div>

</div>
</body>
</html>
