<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/core/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.validate.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
	<h4>You have been logged out</h4>
	<% session.invalidate(); %>
<script>
    if (window.history.replaceState) {
	        window.history.replaceState( null, null, window.location.href );
	        
   
    } 
</script> 
</body>
</html>