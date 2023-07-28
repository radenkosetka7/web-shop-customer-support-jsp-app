<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.customer_support_app.beans.MessageBean"%>
<jsp:useBean id="userBean" class="com.example.customer_support_app.beans.UserBean" scope="session"/>
<jsp:useBean id="messageService" class="com.example.customer_support_app.services.MessageService" scope="application"/>


<%! MessageBean messageBean = new MessageBean(); %>
<!DOCTYPE html>
<%
    if (userBean.getLoggedIn())
    {
        if(request.getParameter("id") != null)
        {
            try
            {
                Integer id=Integer.parseInt(request.getParameter("id"));
                messageBean=messageService.getById(id);
                messageService.changeStatus(id);
            }
            catch (Exception ex)
            {
                ex.printStackTrace();
            }
        }
        else if(request.getParameter("submit") != null)
        {
            messageService.anwserQuestion(messageBean.getRecipientMail(),request.getParameter("answer"),messageBean.getQuestion());
            response.sendRedirect("home.jsp");
        }
        else if(request.getParameter("cancel") != null)
        {
            response.sendRedirect("home.jsp");
        }
    }
    else {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Message</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <script>
        function setRequired() {
            var textarea = document.getElementById("form4Example4");
            textarea.required = true;
        }

        function removeRequired() {
            var textarea = document.getElementById("form4Example4");
            textarea.required = false;
        }
    </script>


</head>
<body style="justify-content: center;align-items: center">
<%@include file="WEB-INF/header.jsp"%>
<div class="card-body">
    <div class="card-body">
<form>
    <!-- Name input -->
    <div class="form-outline mb-4">
        <label class="form-label" for="form4Example1">From</label>
        <input style="width: 250px" disabled type="text" id="form4Example1" value="<%=messageBean.getRecipientMail()%>" class="form-control"/>
    </div>
    <!-- Message input -->
    <div class="form-outline mb-4">
        <label class="form-label" for="form4Example3">Received question</label>
        <textarea disabled class="form-control" id="form4Example3" rows="4"><%=messageBean.getQuestion()%></textarea>
    </div>

    <div class="form-outline mb-4">
        <label class="form-label" for="form4Example3">Answer</label>
        <textarea placeholder="Answer..." class="form-control" id="form4Example4" name="answer" rows="4" ></textarea>
    </div>

<div></div>
    <div>
        <button type="submit" id="sendButton" name="submit" style="width: 80px" onclick="setRequired()" class="btn btn-primary mb-4 d-inline-block">
            Send
        </button>
        <button type="cancel" name="cancel" id="cancelButton" style="width: 80px" onclick="removeRequired()" class="btn btn-danger mb-4 d-inline-block">
            Cancel
        </button>
    </div>

</form>
    </div></div>
</body>
</html>
