<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  <%
   response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setDateHeader("Expires", 0);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/core/css/font-awesome.css">
<script src="resources/core/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="resources/core/js/bootstrap.min.js"></script></head>
<body>
	<header><%@include file="header.jsp" %></header>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 col-sm-12">
				<div class="m-5 p-3">
					<h3 class="text-center mb-4">Welcome <c:if test="${sessionScope.isAdmin}"> <h4 class="text-success">Admin</h4> </c:if> to User Management System</h3>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div></div>
		</div>
	</div>
	
	<footer></footer>
	
</body>
</html>