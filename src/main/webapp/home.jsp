<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.customer_support_app.beans.MessageBean"%>
<%@ page errorPage="errorPage.jsp" %>


<jsp:useBean id="userBean" class="com.example.customer_support_app.beans.UserBean" scope="session"/>
<jsp:useBean id="messageService" class="com.example.customer_support_app.services.MessageService" scope="application"/>

<!DOCTYPE html>
<%
    if (!userBean.getLoggedIn())
        response.sendRedirect("login.jsp");
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/table.css">

    <script>
        $(document).ready(function() {
            $('#myTable').DataTable();
        });
    </script>

</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Customer Support Messages</h2>
                    </div>
                    </div>
                </div>
            </div>
            <table id="myTable" class="table table-striped">
                <thead>
                <tr>
                    <th>Id</th>
                    <th style="width: 22%;">Question</th>
                    <th style="width: fit-content;">User e-mail</th>
                    <th>Read</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% for(MessageBean messageBean:messageService.getAllMessages()) {%>
                <tr>
                    <td><%=messageBean.getId()%></td>
                    <td style="word-wrap: break-word"><%=messageBean.getQuestion()%></td>
                    <td><%=messageBean.getRecipientMail()%></td>
                    <td><%=messageBean.getStatus() ? "Yes":"No"%>
                    </td>
                    <td>
                        <button class="btn btn-primary view-button" onclick="location.href='message.jsp?id=<%=messageBean.getId()%>'" ><i class="material-icons">&#xE254;</i>View</button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
