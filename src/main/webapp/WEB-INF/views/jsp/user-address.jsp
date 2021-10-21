<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div >
					<table class="table table-bordered">
					<thead>
						<tr>
							<th>Address Line1</th>
							<th>Address Line2</th>
							<th>City</th>
							<th>State</th>
							<th>Zip</th>
							<th>Country</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty addresss}">
						<tr><td colspan="7" class="text-center text-danger">No records!</td></tr>
					</c:if>
					<c:if test="${not empty addresss}">
						<c:forEach var="addresss" items="${addresss}">
						
								<!-- construct an "update" link with user id -->
					       		<c:url var="updateLink" value="/updateAddressForm">
					        		<c:param name="aid" value="${addresss.aid}" />
					       		</c:url>
					
					       		<!-- construct an "delete" link with user id -->
					       		<c:url var="deleteLink" value="/deleteAddress">
					        		<c:param name="aid" value="${addresss.aid}" />
					       		</c:url>
					       		 
						
							<tr>
								<td>${addresss.inputAddress1}</td>
								<td>${addresss.inputAddress2}</td>
								<td>${addresss.city}</td>
								<td>${addresss.state}</td>
								<td>${addresss.zip}</td>
								<td>${addresss.country}</td>
								<td>
									<a href="${updateLink }">Update</a>
									 | <a href="${deleteLink }">Delete</a>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
				</div>
			</div>
		</div>		
	</div>
</body>
</html>