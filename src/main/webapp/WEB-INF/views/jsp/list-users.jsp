<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<title>Users List</title>
<link rel="stylesheet" href="resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/core/css/font-awesome.css">
<script src="resources/core/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="resources/core/js/bootstrap.min.js"></script></head>
<body>
<header><%@include file="header.jsp" %></header>
<c:if test="${sessionScope.isAdmin }">
<div class="container">
<div class="row">
  <div class="col-md-12 mt-2">
   <h4>Total users in system</h4>
   <hr />
   <!-- <input type="button" value="Add User"
    onclick="window.location.href='showForm'; return false;"
    class="btn btn-primary" /> -->
    <div class="table-responsive">
	     <table class="table table-striped table-bordered">
		    <thead>
		      <tr>
		      	   <th>#</th>
		      	   <th>View</th>
			       <th>First Name</th>
			       <th>Last Name</th>
			       <th>Email</th>
			       <th>DOB</th>
			       <th>Gender</th>
			       <th>Contact</th>
			       <th>Address</th>
		      </tr>
			</thead>  
	
	      		<!-- loop over and print our customers -->
	      	<c:forEach var="tempUser" items="${users}" varStatus="varStatus">
	       		
	       		<%-- <!-- construct an "delete" link with user id -->
	       		<c:url var="addressLink" value="/userAddress">
	        		<c:param name="aid" value="${tempUser.addresss[0].aid}" />
	       		</c:url> --%>
	       		<c:url var="addressLink" value="/userAddress">
	        		<c:param name="uid" value="${tempUser.uid}" />
	       		</c:url> 
	       		
	       		<c:url var="userDetailLsink" value="/userDetails">
	        		<c:param name="uid" value="${tempUser.uid}" />
	       		</c:url> 
	       		
			<tbody>
	       		<tr>
	       			<td>${varStatus.count}</td>
	       			<td><a class="fa fa-eye text-primary ml-2 mt-3" href="${ userDetailLsink }"></a></td>
			        <td>${tempUser.firstName}</td>
			        <td>${tempUser.lastName}</td>
			        <td>${tempUser.email}</td>
					<td>${tempUser.dob}</td>
					<td>${tempUser.gender}</td>
					<td>${tempUser.phoneNumber}</td>
					<td><a class="btn btn-success" href="${addressLink }">User address</a></td>
	       		</tr>
			</tbody>
	      		</c:forEach>
	
	    		</table>
			</div>
    		</div>
  		 </div>
	  </div>
	  </c:if>
<c:if test="${sessionScope.isUser and !sessionScope.isAdmin }">
	<div class="row">
		<div class="col">
			<h4 class="text-red text-center">Please login.</h4>
		</div>
	</div>
</c:if>

<!-- <script type="text/javascript">
$(document).ready(function() {

	$('#showUserAddress').click(function() {
		$.ajax({
			type : 'GET',
			url : 'userAddress',
			data : 
			success : function(result) {
				alert("reached userAddress controller");
			}
		});
	});
});
</script> -->
</body>
</html>