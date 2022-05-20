<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>User Form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/core/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.validate.min.js"></script>
<style type="text/css">
.invalid{
	color: red;
}
input.invalid {
	border:1px solid red;
}
</style>
</head>
<body>

<header>
<%@include file="header.jsp" %></header>

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
	      method="post" modelAttribute="user" enctype="multipart/form-data">
	      
	    
	      <form:hidden path="uid" />
	      <div class="row">
	      	<div class="col-md-6">
	      		<div class="form-group">
	      			<label for="firstname" class="control-label">First Name <i class="text-danger">*</i></label>
	         		<form:input path="firstName" cssClass="form-control" placeholder="First name"/>	
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
	      			<label for="email" class="control-label">Email <i class="text-danger">*</i></label>
	        		<form:input path="email" cssClass="form-control" placeholder="Email"/>		
	      		</div>
	      	</div>
	      	<div class="col-md-6">
	      		<div class="form-group" id="show_hide_password">
					<label for="password" class="control-label">Password <span class="text-danger">*</span></label>
			       	<div class="row no-gutters">
			       		<div class="col"><form:password path="password" showPassword="true" cssClass="form-control" /></div>
			       		<div class="col pl-2" style="font-size:1.5em;"><a href="javascript:void(0)"><i class="fa fa-eye-slash"></i></a></div>
			       	</div>		     				
	      		</div>
	      	</div>
	      </div>
	      <div class="row">
	      	<div class="col-md-6 col-sm-12">
	      		<div class="form-group">
				    <label for="exampleFormControlFile1">Select profile image</label>
				    <input type="file" name="commonsMultipartFile" class="form-control-file" id="exampleFormControlFile1">
				 </div>
	      	</div>
	      </div>
	      <div class="row">
	      	<div class="col-md-12">
		      	<div class="form-group">
			    	<label for="gender" class="control-label">Gender</label><br>
			    	<div class="m-3">
				    	 <form:radiobutton path="gender" value="M" /> <i>Male</i>
					     <form:radiobutton path="gender" value="F" /> <i>Female</i>	
				      	 <form:radiobutton path="gender" value="O" checked="checked" /> <i>Other</i>
			    	</div>      	      	
			  	</div>
	      	</div>
	      </div>
	      <div class="row">
	       <div class="col-md-6">
		       <div class="form-group">
		       	<label for="dob" class="control-label">DOB</label>
		        <form:input type="date"  path="dob" cssClass="form-control" placeholder="yyyy/MM/dd" />
		       </div>	
	       </div>
	        <div class="col-md-6">
		       <div class="form-group">
		       	<label for="phoneNumber" class="control-label">Phone Number <i class="text-danger">*</i></label>
		        <form:input path="phoneNumber" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" cssClass="form-control" required="required" />
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
											<label for="inputAddress1">Address line 1 <i class="text-danger">*</i></label>
											<form:input path="addresss[0].inputAddress1" required="required" cssClass="form-control" id="inputAddress1" name="address" placeholder="1234 Main St" />
										</div>
										<div class="form-group">
											<label for="inputAddress2">Address line 2</label>
											<form:input path="addresss[0].inputAddress2" cssClass="form-control" id="inputAddress2" name="address" placeholder="Apartment, studio, or floor" />
										</div>
										<div class="form-row">
										<div class="form-group col-md-6">
											<label for="city">City <i class="text-danger">*</i></label>
											<form:input path="addresss[0].city" required="required" cssClass="form-control" id="city" name="address" />
										</div>
										<div class="form-group col-md-4">
											<label for="state">State <i class="text-danger">*</i></label>
											<form:select path="addresss[0].state" id="state" name="address" cssClass="form-control" required="required">
												<form:option value="other"/>
												<form:option value="Gujarat" />
												<form:option value="Maharastra" />
												<form:option value="Uttar Pradesh" />
												<form:option value="Madhya Pradesh" />
											</form:select>
										</div>
										<div class="form-group col-md-2">
											<label for="zip">Zip</label>
											<form:input path="addresss[0].zip" type="text" cssClass="form-control" id="zip" name="address" />
										</div>
										<div class="form-group">
											<label for="country">Country</label>
											<form:input path="addresss[0].country" cssClass="form-control" id="country" name="address" placeholder="country" />
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
<!-- Footer -->
	<%@include file="footer.jsp" %>
		      
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
    
    /* Dynamic address fields insertion */
    
    
    var maxField = 20; //Input fields increment limitation
    var fieldIncrement = 0;
    var addButton = $('.add_button'); //Add button selector
    var wrapper = $('.field_wrapper'); //Input field wrapper
    	    			
    var x = 0; //Initial field counter is 0
    

    //Once add button is clicked
    $(addButton).click(function(){
    	
        //Check maximum number of input fields
        if(x < maxField){
        	
            x++; //Increment field counter
            
            addAddressFields(x);
            
        }
        else{
        	alert("You can only add "+ maxField +" address locations")
        }
    });

    $(wrapper).on('click', '.add_button_etc', function(e){
        //Check maximum number of input fields
        if(x < maxField){ 
        	
            x++; //Increment field counter
            addAddressFields(x);
            
        }else{alert("You can only add "+ maxField +" address locations")}
    });
    
    //Once remove_button is clicked
    $(wrapper).on('click', '.remove_button', function(e){
        e.preventDefault();
        	$(this).parent('fieldset').parent('div').fadeTo(800, 0.1, function(){ 
				$(this).slideUp(5000, function() {}).remove(); //Remove field html.remove();
		});
        x--;//Decrement field counter
    });

    //calling add method which provides form add functionality
    function addAddressFields(inc){
    	var fieldHTML = htmlAddressElements(inc);
    	$(wrapper).append(fieldHTML); //Add field html
    }
    
    //dynamic form input elements
   function htmlAddressElements(fieldIncrement){
	   var fieldHTML = '<div class="col-md-12 col-sm-12 float-left bg-light shadow p-3 mb-3 rounded">'
		    +'<fieldset class="border px-5">  <legend class="w-auto">Address</legend>'
		    +'<div class="form-group">'
		    +'<label for="inputAddress1">Address line 1 <i class="text-danger">*</i></label>'
		    +'<input type="text" name="addresss['+(fieldIncrement)+'].inputAddress1" required="required" class="form-control" placeholder="1234 Main St" />'
		    +'</div>'
		    +'<div class="form-group">'
		    +'<label for="inputAddress2">Address line 2</label>'
		    +'<input type="text" name="addresss['+(fieldIncrement)+'].inputAddress2" class="form-control" placeholder="Apartment, studio, or floor" />'
		    +'</div>'
		    +'<div class="form-row">'
		    +'<div class="form-group col-md-6">'
		    +'<label for="city">City <i class="text-danger">*</i></label>'
		    +'<input type="text" name="addresss['+(fieldIncrement)+'].city" required="required" class="form-control" />'
		    +'</div>'
		    +'<div class="form-group col-md-4">'
		    +'<label for="state">State <i class="text-danger">*</i></label>'
		    +'<select name="addresss['+(fieldIncrement)+'].state" class="form-control" required="required">'
		    +'<option value="other">other</option>'
		    +'<option value="Gujarat">Gujarat</option>'
		    +'<option value="Maharastra">Maharastra</option>'
		    +'<option value="Uttar Pradesh">Uttar Pradesh</option>'
		    +'<option value="Madhya Pradesh">Madhya Pradesh</option>'
		    +'<select>'
		    +'</div>'
		    +'<div class="form-group col-md-2">'
		    +'<label for="zip">Zip</label>'
		    +'<input type="text" name="addresss['+(fieldIncrement)+'].zip" class="form-control" />'
		    +'</div>'
		    +'<div class="form-group">'
		    +'<label for="country">Country</label>'
		    +'<input type="text" name="addresss['+(fieldIncrement)+'].country" class="form-control" placeholder="country" />'
		    +'</div>'
		    +'</div>'
		    +'<a href="javascript:void(0);" class="btn btn-success add_button_etc float-right" title="Add field"><span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>'
		    +'<a href="javascript:void(0);" class="btn btn-danger remove_button" title="Remove field"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span>'+'Remove</a>'
		    +'</fieldset></div>'; //New input field html

		    return fieldHTML;
   }
    
    
    
    
   
    
});
</script>



<script type="text/javascript">
$("#user").validate({
	errorClass: "invalid",
	   rules: {
	     firstName: {
	    	 required: true,
	    	 minlength: 2
	     },
	     email: {
	       required: true,
	       email: true
	     },
	     password: {
		       required: true,
		       minlength: 5
		     },
		 phoneNumber: {
			   required: true,
			   minlength: 10,
			   maxlength: 10,
			 },    
	   },
	   messages: {
	     firstName:{
	    	required: "Please specify your name",
	    	minlength: jQuery.validator.format("At least {0} characters required!")
	     }, 
	     email: {
	       required: "We need your email address to contact you",
	       email: "Your email address must be in the format of name@domain.com"
	     },
	     password: {
		       required: "Please enter password",
		       minlength: jQuery.validator.format("At least {0} characters required!")
		     },
		 phoneNumber: {
			   required: "Please enter your phone number",
			   minlength: jQuery.validator.format("At least {0} characters required!"),
			   maxlength: jQuery.validator.format("Please enter valid phone number")
		},
	   }
	 });

</script>

</body>
</html>