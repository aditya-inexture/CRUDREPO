<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/core/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/core/css/font-awesome.css">
<script src="resources/core/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="resources/core/js/bootstrap.min.js"></script></head>
<body>
	<header><%@include file="header.jsp" %></header>
	
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10 col-sm-12 mt-3 mb-3">
				<h3 class="text-center mpb-4">Register</h3>
				<hr class="bg-warning" />
				<form>
					<div class="form-row mx-3 h5">
					    <div class="form-group col-md-6">
					      <label for="inputEmail4"><strong>Email</strong></label>
					      <input type="email" class="form-control" id="inputEmail4" placeholder="Email" aria-describedby="emailHelp">
					      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					    </div>
					    <div class="form-group col-md-6">
					      <label for="inputPassword4"><strong>Password</strong></label>
					      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
					    </div>
				  	</div>
					<div class="field_wrapper">
						<div class="row">
							<div class="col-md-12 col-sm-12">
							    <fieldset class="border mx-3 px-5">  <legend class="w-auto">Address</legend>
							    	<div class="form-group">
										<label for="inputAddress">Address line 1</label>
										<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
									</div>
									<div class="form-group">
										<label for="inputAddress2">Address line 2</label>
										<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCity">City</label>
											<input type="text" class="form-control" id="inputCity">
										</div>
										<div class="form-group col-md-4">
											<label for="inputState">State</label>
											<select id="inputState" class="form-control">
											    <option selected>Choose...</option>
											    <option>Gujarat</option>
											    <option>Maharastra</option>
											    <option>Uttar Pradesh</option>
											    <option>Madhya Pradesh</option>
											</select>
										</div>
										<div class="form-group col-md-2">
											<label for="inputZip">Zip</label>
											<input type="text" class="form-control" id="inputZip">
										</div>
					  				</div>
					  				<input type="submit" name="submit" class="btn btn-primary" value="submit"/>
									<a href="javascript:void(0);" class="btn btn-success add_button float-right" title="Add field"><span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>
								</fieldset>	
							</div> 
						</div>	       		        	
					</div>
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div></div>
		</div>
	</div>
	
	<footer><%@include file="header.jsp" %></footer>
	


<!-- JS script for dynamic address fields insertion -->
<script type="text/javascript">
	$(document).ready(function(){
	    var maxField = 20; //Input fields increment limitation
	    var addButton = $('.add_button'); //Add button selector
	    var wrapper = $('.field_wrapper'); //Input field wrapper
	    var fieldHTML = '<div class="col-md-12 col-sm-12 float-left bg-light shadow p-3 mb-3 rounded"><fieldset class="border px-5">  <legend class="w-auto">Address</legend>'+
		    	'<div class="form-group">'+
					'<label for="inputAddress">Address line 1</label>'+
					'<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main'+ 'St">'+
				'</div>'+
				'<div class="form-group">'+
					'<label for="inputAddress2">Address line 2</label>'+
					'<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment,'+' studio, or floor">'+
				'</div>'+
				'<div class="form-row">'+
					'<div class="form-group col-md-6">'+
						'<label for="inputCity">City</label>'+
						'<input type="text" class="form-control" id="inputCity">'+
					'</div>'+
					'<div class="form-group col-md-4">'+
						'<label for="inputState">State</label>'+
						'<select id="inputState" class="form-control">'+
						   ' <option selected>Choose...</option>'+
						  '  <option>Gujarat</option>'+
							    '<option>Maharastra</option>'+
							   ' <option>Uttar Pradesh</option>'+
							   ' <option>Madhya Pradesh</option>'+
						'</select>'+
					'</div>'+
					'<div class="form-group col-md-2">'+
					'	<label for="inputZip">Zip</label>'+
					'	<input type="text" class="form-control" id="inputZip">'+
					'</div>'+
  				'</div>'+'<a href="javascript:void(0);" class="btn btn-success add_button_etc float-right" title="Add field"><span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>'+
				'<a href="javascript:void(0);" class="btn btn-danger remove_button" title="Remove field"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span>'+'Remove</a>'+
			'</fieldset></div>'; //New input field html
		    			
	    var x = 1; //Initial field counter is 1
	    
	    //On medium size display's make col size to 6
	    //so that two address column can reside side by side
	    

	    //Once add button is clicked
	    $(addButton).click(function(){
	        //Check maximum number of input fields
	        if(x < maxField){ 
	            x++; //Increment field counter
	            $(wrapper).append(fieldHTML); //Add field html
	        }else{alert("You can only add "+ maxField +" address locations")}
	    });

	    //Once remove button is clicked
	    $(wrapper).on('click', '.add_button_etc', function(e){
	        //Check maximum number of input fields
	        if(x < maxField){ 
	            x++; //Increment field counter
	            $(wrapper).append(fieldHTML); //Add field html
	        }else{alert("You can only add "+ maxField +" address locations")}
	    });
	    
	    //Once remove_button is clicked
	    $(wrapper).on('click', '.remove_button', function(e){
	        e.preventDefault();
	        	$(this).parent('fieldset').parent('div').fadeTo(800, 0.1, function(){ 
    				$(this).slideUp(5000, function() {}).remove(); //Remove field html.remove();
			});
	        x--; //Decrement field counter
	    });

	});
</script>
	
</body>
</html>	
	
	