<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
<style type="text/css">
input.invalid{
	border:1px solid red;
}
.invalid{
	color:red;
}
</style>
</head>
<body>

<header><%@include file="header.jsp" %></header>

<!-- redirect to home page if user is already logged in -->
	<c:if test="${(sessionScope.isAdmin) or (sessionScope.isUser)}">
		<c:redirect url="/" />
	</c:if>

<div class="container my-5">
<div class="row mb-2">
	<div class="col">
		<h2 class="text-center text-warning text-uppercase">Change password</h2>
	</div>
</div>
	<div class="row">
		<div class="col">
			<form action="${pageContext.request.contextPath}/forgotPasswordHandler" id="forgotPassword">
			<div class="row mb-3 ml-3 mr-3">
				<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6 p-3 border" style="background-color:#e8f0fe !important;border-radius: 0.25rem;">
						<div class="text-danger"> <c:out value="${passwordError }"></c:out></div>
					</div>
				<div class="col-md-3 col-sm-3"></div>
			</div>
			
				<div class="row">
					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6">
						<div class="form-group">
							<label for="email" class="control-label">Email</label>
							<input type="email" name="email" class="form-control" />
						</div>
					</div>
					<div class="col-md-3 col-sm-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6">
						<div class="form-group">
							<label for="newPassword" class="control-label">New password</label>
							<input type="password" name="newPassword" id="newPassword" class="form-control" />
						</div>
					</div>
					<div class="col-md-3 col-sm-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6">
						<div class="form-group">
							<label for="confirmNewPassword" class="control-label">Confirm new password</label>
							<input type="password" name="confirmNewPassword" class="form-control" />
						</div>
					</div>
					<div class="col-md-3 col-sm-3"></div>
				</div>
				<div class="row">
					<div class="col"></div>
					<div class="col">
						<input type="submit" name="confirm" class="form-control btn btn-warning" value="Confirm" />
					</div>
					<div class="col"></div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="footer.jsp" %>



<script type="text/javascript">
$(document).ready(function() {
	
$("#forgotPassword").validate({
	errorClass: "invalid",
	   rules: {
	     email: {
	       required: true,
	       email: true
	     },
	     newPassword: {
		       required: true,
		       minlength: 0
		     },
		 confirmNewPassword: {
			    required: true,
			    equalTo: "#newPassword"
			 },
	   },
	   messages: { 
	     email: {
	       required: "Please enter your registered email address",
	       email: "Your email address must be in the format of name@domain.com"
	     },
	     newPassword: {
		       required: "Please enter password",
		       minlength: jQuery.validator.format("At least {0} characters required!")
		     },
		 confirmNewPassword: {
			   required: "Please enter password",
			   equalTo: "Please enter the same password as above"
			 },
	   }
	 });
	 
});

</script>
</body>
</html>