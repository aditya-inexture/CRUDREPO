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
<div class="row border pt-3">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-12">
				<h2 class="pt-2 text-primary">User registration form</h2>
				<hr class="bg-warning">
			</div>
		</div>
		<!-- Form to enter user details -->
		<form:form action="saveUser" cssClass="form-horizontal"
	      method="post" modelAttribute="user">
	      <!-- need to associate this data with customer id -->
	      <form:hidden path="uid" />
	      <div class="row">
	      	<div class="col-md-6">
	      		<div class="form-group">
	      			<label for="firstname" class="control-label">First Name</label>
	         		<form:input path="firstName" cssClass="form-control" placeholder="First name" />	
	      		</div>
	      	</div>
	      	<div class="col-md-6">
	      		<div class="form-group">
					<label for="lastname" class="control-label">Last Name</label>
	        		<form:input path="lastName" cssClass="form-control" placeholder="Last name" />	      				
	      		</div>
	      	</div>
	      </div>
	      <div class="row">
	      	<div class="col-md-6">
	      		<div class="form-group">
	      			<label for="email" class="control-label">Email</label>
	        		<form:input path="email" cssClass="form-control" placeholder="Email"/>		
	      		</div>
	      	</div>
	      	<div class="col-md-6">
	      		<div class="form-group" id="show_hide_password">
					<label for="password" class="control-label">Password</label>
			       	<div class="row no-gutters">
			       		<div class="col"><form:password path="password" showPassword="true" cssClass="form-control" /></div>
			       		<div class="col pl-2" style="font-size:1.5em;"><a href="javascript:void(0)"><i class="fa fa-eye-slash"></i></a></div>
			       	</div>		     				
	      		</div>
	      	</div>
	      </div>
	      <div class="row">
	      	<div class="col-md-12">
		      	<div class="form-group">
			    	<label for="gender" class="control-label">Gender</label><br>
			    	<div class="m-3">
				    	<i>Male</i> <form:radiobutton path="gender" value="M" cssClass="" /> 
					    <i>Female</i> <form:radiobutton path="gender" value="F" cssClass="" /> 		
				      	<i>Other</i> <form:radiobutton path="gender" value="O" cssClass="" />
			    	</div>      	      	
			  	</div>
	      	</div>
	      </div>
	      <div class="row">
	       <div class="col-md-6">
		       <div class="form-group">
		       	<label for="dob" class="control-label">DOB</label>
		        <form:input  path="dob" cssClass="form-control" placeholder="dd/MM/yyyy" />
		       </div>	
	       </div>
	        <div class="col-md-6">
		       <div class="form-group">
		       	<label for="phoneNumber" class="control-label">Phone Number</label>
		        <form:input path="phoneNumber" cssClass="form-control" />
		       </div>	
	       </div>
	      </div>
	      <!-- Address field -->
	      <div class="row">
	      	<div class="col-12">
	      		<div class="field_wrapper">
					<div class="row">
						<div class="col-md-12 col-sm-12">
								<fieldset class="border mx-3 px-5">  <legend class="w-auto">Address</legend>
									    <div class="form-group">
											<label for="inputAddress1">Address line 1</label>
											<form:input path="address.inputAddress1" cssClass="form-control" id="inputAddress1" placeholder="1234 Main St" />
										</div>
										<div class="form-group">
											<label for="inputAddress2">Address line 2</label>
											<form:input path="address.inputAddress2" cssClass="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" />
										</div>
										<div class="form-row">
										<div class="form-group col-md-6">
											<label for="city">City</label>
											<form:input path="address.city" cssClass="form-control" id="city" />
										</div>
										<div class="form-group col-md-4">
											<label for="state">State</label>
											<form:select path="address.state" id="state" cssClass="form-control">
												<form:option value="other"/>
												<form:option value="Gujarat" />
												<form:option value="Maharastra" />
												<form:option value="Uttar Pradesh" />
												<form:option value="Madhya Pradesh" />
											</form:select>
										</div>
										<div class="form-group col-md-2">
											<label for="zip">Zip</label>
											<form:input path="address.zip" type="text" cssClass="form-control" id="zip" />
										</div>
										<div class="form-group">
											<label for="country">Country</label>
											<form:input path="address.country" cssClass="form-control" id="country" placeholder="country" />
										</div>
							  		</div>
									<a href="javascript:void(0);" class="btn btn-success add_button float-right" title="Add field"><span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>
								</fieldset>		
							</div> 
						</div>	       		        	
					</div>
	     		</div>
	   		</div>     
	   		<div class="row">
		       <div class="col-md-6">
			       	<div class="form-group">
			       		<!-- Button -->
					    <div class="text-center">
					    	<form:button cssClass="btn btn-primary" value="submit">Submit</form:button>
				    	</div>
				    </div> 
		       </div>
	      </div>
		</form:form>
	</div>
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