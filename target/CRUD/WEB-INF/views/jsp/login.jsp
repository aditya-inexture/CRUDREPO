<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setDateHeader("Expires", 0);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/core/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.validate.min.js"></script>
<style type="text/css">
.invalid{
	color: red;
}
</style>
</head>
<body>
	<header><%@include file="header.jsp" %></header>
	
	<c:if test="${(sessionScope.isAdmin) or (sessionScope.isUser)}">
		<c:redirect url="/" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 col-sm-12">
				<div class="bg-light m-5 p-3">
					<h3 class="text-center mb-2">Login</h3>
					
						<div class="mb-3 text-center text-danger">
							${invalidLogin }
						
						
					</div>
					<form:form  action="${pageContext.request.contextPath}/loginH" method="post" modelAttribute="loginCredentials">
						<div class="form-group">
							<form:input cssClass="form-control" path="username" placeholder="username" required="required"/>
						</div>
						<div class="form-group">
							<form:password cssClass="form-control" path="password" placeholder="password" required="required" />
						</div>
						<div class="form-group"></div>
						<form:button cssClass="btn  btn-primary"  value="Submit">Login</form:button>
						<br>
						<br>
						<a href="${pageContext.request.contextPath}/forgotPassword">Forgot password?</a>
					</form:form>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div></div>
		</div>
	</div>
	
<!-- Footer -->
	<%@include file="footer.jsp" %>
	
	<script type="text/javascript">
$("#loginCredentials").validate({
	errorClass: "invalid",
	   rules: {
	     email: {
	       required: true,
	       email: true
	     },
	     password: {
		       required: true,
		       minlength: 0
		     },   
	   },
	   messages: { 
	     email: {
	       required: "Please enter your registered email address",
	       email: "Your email address must be in the format of name@domain.com"
	     },
	     password: {
		       required: "Please enter password",
		       minlength: jQuery.validator.format("At least {0} characters required!")
		     },
	   }
	 });

</script>
	
</body>
</html>