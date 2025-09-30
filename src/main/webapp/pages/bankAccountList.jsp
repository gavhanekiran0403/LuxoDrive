<%@page import="com.luxodrive.dao.BankAccountOperation"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.model.BankAccount"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Account List</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bankAccountList.css">
</head>
<body>

    <jsp:include page="adminNavbar.jsp"></jsp:include>

<%
    List<BankAccount> accounts = BankAccountOperation.getAllBankAccount();
    request.setAttribute("accounts", accounts); 
%>

    <div class="list-container">
        <div class="header-row">
            <h1>Bank Account List</h1>
        </div>

        <table>
        <thead>
            <tr>
                <th>Account Id</th>
                <th>Account Holder</th>
                <th>Bank Name</th>
                <th>Account Number</th>
                <th>IFSC Code</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="acc" items="${accounts}">
            <tr>
                <td>${acc.bankAccId}</td>
                <td>${acc.accHolderName}</td>
                <td>${acc.bankName}</td>
                <td>${acc.accountNo}</td>
                <td>${acc.ifscNo}</td>
            </tr>
            </c:forEach>
        </tbody>
        </table>
    </div>
</body>
</html>
