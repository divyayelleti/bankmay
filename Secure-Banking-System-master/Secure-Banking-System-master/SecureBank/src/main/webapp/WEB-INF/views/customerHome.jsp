<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

<title>Customer Home Page</title>
</head>
<body>
<%@ include file="customerMenu.jsp"%>
Hello !!!!
<br>
<div class="page-header">
		<h1>Welcome ${fn:escapeXml(fullname)}</h1>
		<h4>Customer Id: ${fn:escapeXml(customerId) }</h4>
	</div>

	<h2>Accounts:</h2>

	<table class="table">
		<thead>
			<tr>
				<th>Account Number</th>
				<th>Balance</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty accounts}">
				<tr><td colspan="3" class="center">No Accounts to display. Please
					contact the bank.</td></tr>
			</c:if>
			<c:forEach items="${accounts}" var="account">
				<tr>
					<td>${fn:escapeXml(account.accountId)} - ${fn:escapeXml(account.accountName)}</td>
					<td>$${fn:escapeXml(account.accountBalance)}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<a href=${pageContext.request.contextPath}/customer/bankStatements>View Statements</a>
</body>
</html>