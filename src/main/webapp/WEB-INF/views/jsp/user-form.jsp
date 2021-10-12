<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>User Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<header><%@include file="header.jsp" %></header>
 <div class="container">
 <div class="row">
	 <div class="col-md-3"></div>
	  <div class="col-md-6">
	   <h2 class="text-center">User Form</h2>
	   <div class="panel panel-info">
	    <div class="panel-heading">
	     <div class="panel-title">Add User</div>
	    </div>
	    <div class="panel-body">
	     <form:form action="saveUser" cssClass="form-horizontal"
	      method="post" modelAttribute="user">
	
	      <!-- need to associate this data with customer id -->
	      <form:hidden path="uid" />
	
	      <div class="form-group">
	       <div class="col-md-12">
	       <label for="firstname" class=" control-label">First Name</label>
	        <form:input path="firstName" cssClass="form-control" placeholder="First name" />
	       </div>
	      </div>
	      <div class="form-group">
	       <div class="col-md-12">
	       <label for="lastname" class="control-label">Last
	        Name</label>
	        <form:input path="lastName" cssClass="form-control" placeholder="Last name" />
	       </div>
	      </div>
	
	      <div class="form-group">
	       <div class="col-md-12">
	       	<label for="email" class="control-label">Email</label>
	        <form:input path="email" cssClass="form-control" placeholder="Email"/>
	       </div>
	      </div>
	      
	      <div class="form-group">
	       <div class="col-md-12" id="show_hide_password">
	       	<label for="password" class="control-label">Password</label>
	       	<div class="row no-gutters">
	       		<div class="col"><form:password path="password" showPassword="true" cssClass="form-control" /></div>
	       		<div class="col pl-2" style="font-size:1.5em;"><a href=""><i class="fa fa-eye-slash"></i></a></div>
	       	</div>	
	       </div>
	      </div>
	      
	      <div class="form-group">
	       <div class="col-md-12">
	       	<label for="gender" class="control-label">Gender</label><br>
	        male <form:radiobutton path="gender" value="M" cssClass="form-control" />
	        female <form:radiobutton path="gender" value="F" cssClass="form-control" />
	        other <form:radiobutton path="gender" value="O" cssClass="form-control" />
	       </div>
	      </div>
	      
	      <div class="form-group">
	       <div class="col-md-12">
	       	<label for="dob" class="control-label">DOB</label>
	        <form:input  path="dob" cssClass="form-control" />	
	       </div>
	      </div>
	      
	      <div class="form-group">
	       <div class="col-md-12">
	       <label for="phoneNumber" class="control-label">Phone Number</label>
	        <form:input path="phoneNumber" cssClass="form-control" />	
	       </div>
	      </div>
	
	      <div class="form-group">
	       <!-- Button -->
	       <div class="col-md-offset-3 col-md-9">
	        <form:button cssClass="btn btn-primary">Submit</form:button>
	       </div>
	      </div>
	
	     </form:form>
	    </div>
	   </div>
	  </div>
	  <div class="col-md-3"></div>
	</div>
 </div>
 
 
<script type="text/javascript"> 
 $(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") === "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
});
</script>
 
</body>
</html>