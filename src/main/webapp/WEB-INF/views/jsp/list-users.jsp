<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Users List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
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
			       <th>First Name</th>
			       <th>Last Name</th>
			       <th>Email</th>
			       <th>DOB</th>
			       <th>Gender</th>
			       <th>Contact</th>
			       <th>Address</th>
			       <th>Action</th>    
		      </tr>
			</thead>  
	
	      		<!-- loop over and print our customers -->
	      	<c:forEach var="tempUser" items="${users}">
	
	       		<!-- construct an "update" link with user id -->
	       		<c:url var="updateLink" value="/updateForm">
	        		<c:param name="uid" value="${tempUser.uid}" />
	       		</c:url>
	
	       		<!-- construct an "delete" link with user id -->
	       		<c:url var="deleteLink" value="/delete">
	        		<c:param name="uid" value="${tempUser.uid}" />
	       		</c:url>
	       		
	       		<!-- construct an "delete" link with user id -->
	       		<c:url var="addressLink" value="/userAddress">
	        		<c:param name="uid" value="${tempUser.uid}" />
	       		</c:url>
	       		
			<tbody>
	       		<tr>
			        <td>${tempUser.firstName}</td>
			        <td>${tempUser.lastName}</td>
			        <td>${tempUser.email}</td>
					<td>${tempUser.dob}</td>
					<td>${tempUser.gender}</td>
					<td>${tempUser.phoneNumber}</td>
					<td><a class="btn btn-success" href="${addressLink}" >User address</a></td>
				
		        	<td>
		         	<!-- display the update link --> <a href="${updateLink}">Update</a>
		         	| <a href="${deleteLink}"
		         	onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
		        	</td>
	       		</tr>
			</tbody>
	      		</c:forEach>
	
	    		</table>
			</div>
    		</div>
  		 </div>
	  </div>
</body>
</html>