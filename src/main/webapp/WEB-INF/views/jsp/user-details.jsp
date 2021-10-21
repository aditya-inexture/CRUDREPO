<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<link rel="stylesheet" href="resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/core/css/font-awesome.css">
<script src="resources/core/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="resources/core/js/bootstrap.min.js"></script>

<style type="text/css">
input:invalid:required {
	border-color: red;
}
</style>
</head>
<body class="bg-light">
<header><%@include file="header.jsp" %></header>
<div class="container">
<c:if test="${sessionScope.isAdmin  || sessionScope.isUser }">
			
				<!-- construct an "update" link with user id -->
	       		<c:url var="updateLink" value="/updateUser">
	        		<c:param name="uid" value="${user.uid}" />
	       		</c:url>
	
	       		<!-- construct an "delete" link with user id -->
	       		<c:url var="deleteLink" value="/delete">
	        		<c:param name="uid" value="${user.uid}" />
	       		</c:url>
	       	
				<c:if test="${(sessionScope.isAdmin eq false) and (sessionScope.isUser eq false) }">
					<div class="row">
						<div class="col">
							<h4 class="text-red text-center">Please login.</h4>
						</div>
					</div>
				</c:if>
	
	<!-- User profile
		~ he/she can update or delete profile from here
	 -->
<div class="mt-3">
		<div class="row mt-1"><div class="col-md-12"><h3 class="text-center text-primary">Profile</h3></div></div>
			<div class="row mt-3">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<form:form action="updateUser" modelAttribute="user">
					<form:hidden path="uid" cssClass="form-control"/>
						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label for="firstName" class="control-label">First Name <i class="text-danger">*</i></label>
									<form:input path="firstName" cssClass="form-control" required="required"/>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="lastName" class="control-label">Last Name</label>
									<form:input path="lastName" cssClass="form-control"/>
								</div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label for="email" class="control-label">Email <i class="text-danger">*</i></label>
									<form:input path="email" cssClass="form-control" required="required"/>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password" class="control-label">Password <i class="text-danger">*</i></label>
									<form:password showPassword="true" path="password" cssClass="form-control" required="required"/>
								</div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label for="gender" class="control-label">Gender : </label>
									<div class="form-check form-check-inline">
										<form:radiobutton path="gender" name="input_gender" value="${user.gender}"/>
											<c:if test="${user.gender eq 'M'.charAt(0)}"><label for="input_gender" class="form-check-label">&nbspMale</label></c:if>
											<c:if test="${user.gender eq 'F'.charAt(0)}"><label for="input_gender" class="form-check-label">&nbspFemale</label></c:if>
											<c:if test="${user.gender eq 'O'.charAt(0)}"><label for="input_gender" class="form-check-label">&nbspOther</label></c:if>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label for="phoneNumber" class="control-label">Contact <i class="text-danger">*</i></label>
									<form:input path="phoneNumber" cssClass="form-control" required="required"/>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="dob" class="control-label">DOB</label>
									<form:input path="dob" cssClass="form-control" placeholder="dd/mm/yyyy"/>
								</div>
							</div>
						</div>
						
						<!-- Lets iterate over user address's -->
						<c:forEach items="${ user.addresss }" var="addresss" varStatus="status">
						<div class="border mt-2 mb-2 p-2 bg-info text-light shadow-sm rounded text-monospace font-weight-bold">
						<form:hidden path="addresss[${status.index }].aid" class="form-control"/>
						<span class="bg-white text-dark" style="box-shadow:0.1rem 0.1rem 0.3rem 0.1rem white;">${status.count}</span>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="inputAddress1" class="control-label">Address line 1 <i class="text-danger">*</i></label>
										<form:input path="addresss[${status.index }].inputAddress1" type="text" class="form-control" value="${ addresss.inputAddress1 }" required="required"/>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="inputAddress2" class="control-label">Address line 2</label>
										<form:input path="addresss[${status.index }].inputAddress2" type="text" class="form-control" value="${ addresss.inputAddress2 }"/>
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="state" class="control-label">State <i class="text-danger">*</i></label>
										<%-- <form:input path="addresss[${status.index }].state" class="form-control" value="${ addresss.state }"/> --%>
										<form:select path="addresss[${status.index }].state" cssClass="form-control" required="required">
												<form:option value="other"/>
												<form:option value="Maharastra" />
												<form:option value="Gujarat" />
												<form:option value="Uttar Pradesh" />
												<form:option value="Madhya Pradesh" />
											</form:select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="city" class="control-label">City <i class="text-danger">*</i></label>
										<form:input path="addresss[${status.index }].city" type="text" class="form-control" value="${ addresss.city }" required="required"/>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="zip" class="control-label">Zip</label>
										<form:input path="addresss[${status.index }].zip" type="text" class="form-control" value="${ addresss.zip }"/>
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label for="country" class="control-label">Country</label>
										<form:input path="addresss[${status.index }].country" type="text" class="form-control" value="${ addresss.country }"/>
									</div>
								</div>
							</div>
							<div class="form-row">
							<div class="col-md-4"></div>
							<div class="col-md-2 col-sm-6"><a href="${updateLink }" class="btn btn-success">Update</a></div>
							
							<!-- construct an "delete" link with address id -->
				       		<c:url var="addressDeleteLink" value="/deleteAddress">
				        		<c:param name="aid" value="${addresss.aid}" />
				       		</c:url>
				       		
							<div class="col-md-2 col-sm-6"><a href="${addressDeleteLink }" class="btn btn-danger">Delete</a></div>
							
							<div class="col-md-4"><span id="result"></span></div>
						</div>
						</div>
						</c:forEach>
						
						
						<form:button name="submit" >Update</form:button>
						
					</form:form>	
				</div>
				<div class="col-md-2">
				</div>
		</div>
</div>
	</c:if>
</div>	

<!-- <script type="text/javascript">

$(document).ready(function() {

$("#deleteAddress").click(
    function(){
        $.ajax({
            url : '${addressDeleteLink}',
            success : function(data) {
                $('#result').html(data);
            }
        });
    })    
});
</script> -->


</body>
</html>