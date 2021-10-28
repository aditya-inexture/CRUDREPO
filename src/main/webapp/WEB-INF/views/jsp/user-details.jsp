<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
input:invalid:required {
	border-color: red;
}
</style>
</head>
<body class="bg-light">
	<header><%@include file="header.jsp"%></header>

	<c:if
		test="${(not sessionScope.isAdmin) and (not sessionScope.isUser)}">
		<c:redirect url="/error" />
	</c:if>

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



			<!-- User profile
		~ he/she can update or delete profile from here
	 -->
			<div class="mt-3">
				<div class="row mt-1">
					<div class="col-md-12">
						<h3 class="text-center text-primary">User profile</h3>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-2"></div>
					<div class="col-md-8">

						<form:form action="updateUser" modelAttribute="user"
							enctype="multipart/form-data">

							<div class="row">
								<div class="col">
									<div class="text-center">
										<img width="30%" height="30%"
											src="data:image/jpeg;base64,${userImage}"
											class="rounded-circle mb-5" style="border-radius: 50%;"
											alt="Profile picture">
									</div>
								</div>
							</div>
							<div>
								<div class="row">
									<div class="col-md-4 col-sm-4"></div>
									<div class="col-md-4 col-sm-4">
										<div class="form-group">
											<label for="exampleFormControlFile1" class="text-success">Change
												profile image</label> <input type="file" name="commonsMultipartFile"
												class="form-control-file" id="exampleFormControlFile1">
										</div>
									</div>
									<div class="col-md-4 col-sm-4"></div>
								</div>
							</div>

							<form:hidden path="uid" cssClass="form-control" />

							<span id="result"></span>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="firstName" class="control-label">First
											Name <i class="text-danger">*</i>
										</label>
										<form:input path="firstName" cssClass="form-control"
											required="required" />
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="lastName" class="control-label">Last Name</label>
										<form:input path="lastName" cssClass="form-control" />
									</div>
								</div>
							</div>

							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="email" class="control-label">Email <i
											class="text-danger">*</i></label>
										<form:input path="email" cssClass="form-control"
											required="required" />
									</div>
								</div>
								<div class="col">
									<div class="form-group" id="show_hide_password">
										<label for="password" class="control-label">Password <span
											class="text-danger">*</span></label>
										<div class="row no-gutters">
											<div class="col">
												<form:password path="password"  showPassword="true"
													cssClass="form-control" />
											</div>
											<div class="col pl-2" style="font-size: 1.5em;">
												<a href="javascript:void(0)"><i class="fa fa-eye-slash"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="gender" class="control-label">Gender : </label>
										<div class="form-check form-check-inline">
											<form:radiobutton path="gender" name="input_gender"
												value="${user.gender}" />
											<c:if test="${user.gender eq 'M'.charAt(0)}">
												<label for="input_gender" class="form-check-label">&nbspMale</label>
											</c:if>
											<c:if test="${user.gender eq 'F'.charAt(0)}">
												<label for="input_gender" class="form-check-label">&nbspFemale</label>
											</c:if>
											<c:if test="${user.gender eq 'O'.charAt(0)}">
												<label for="input_gender" class="form-check-label">&nbspOther</label>
											</c:if>
										</div>
									</div>
								</div>
							</div>

							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="phoneNumber" class="control-label">Contact
											<i class="text-danger">*</i>
										</label>
										<form:input path="phoneNumber" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" cssClass="form-control"
											required="required" />
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="dob" class="control-label">DOB</label>
										<form:input type="date" path="dob" cssClass="form-control"
											placeholder="yyyy/MM/dd" />
									</div>
								</div>
							</div>

							<!-- Check if user has no address field 
						(please check javascript to append below div tag if no address field found while runtime) -->

							<c:if test="${empty user.addresss }">
								<div id="addressButtonWrapper">
									<input type="hidden" id="addressCount" value="-1" />
									<div class="test-center">
										<a href="javascript:void(0);" id="firstAddress"
											class="btn btn-success float-right" onclick="addAddress()"
											title="Add field"><span
											class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>
									</div>
								</div>
							</c:if>




							<div class="field_wrapper">
								<!-- Lets iterate over user address's -->
								<c:forEach items="${ user.addresss }" var="addresss"
									varStatus="status">

									<div
										class="address_wrapper border mt-2 mb-2 p-2 bg-info text-light shadow-sm rounded text-monospace font-weight-bold">

										<!-- Address unique id (primary key) -->
										<form:hidden path="addresss[${status.index }].aid"
											class="form-control" />

										<span class="bg-white text-dark"
											style="box-shadow: 0.1rem 0.1rem 0.3rem 0.1rem white;">${status.count}</span>
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="inputAddress1" class="control-label">Address
														line 1 <i class="text-danger">*</i>
													</label>
													<form:input path="addresss[${status.index }].inputAddress1"
														type="text" class="form-control"
														value="${ addresss.inputAddress1 }" required="required" />
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="inputAddress2" class="control-label">Address
														line 2</label>
													<form:input path="addresss[${status.index }].inputAddress2"
														type="text" class="form-control"
														value="${ addresss.inputAddress2 }" />
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="city" class="control-label">City <i
														class="text-danger">*</i></label>
													<form:input path="addresss[${status.index }].city"
														type="text" class="form-control"
														value="${ addresss.city }" required="required" />
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="state" class="control-label">State <i
														class="text-danger">*</i></label>
													<%-- <form:input path="addresss[${status.index }].state" class="form-control" value="${ addresss.state }"/> --%>
													<form:select path="addresss[${status.index }].state"
														cssClass="form-control" required="required">
														<form:option value="other" />
														<form:option value="Maharastra" />
														<form:option value="Gujarat" />
														<form:option value="Uttar Pradesh" />
														<form:option value="Madhya Pradesh" />
													</form:select>
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="zip" class="control-label">Zip</label>
													<form:input path="addresss[${status.index }].zip"
														type="text" class="form-control" value="${ addresss.zip }" />
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col-md-6 col-sm-12">
												<div class="form-group">
													<label for="country" class="control-label">Country</label>
													<form:input path="addresss[${status.index }].country"
														type="text" class="form-control"
														value="${ addresss.country }" />
												</div>
											</div>
										</div>
										<div class="form-row">


											<!-- construct an "update" link with address id -->
											<%-- <c:url var="addressUpdateLink" value="/updateAddress">
				        		<c:param name="addressObject" value="addresss[${status.index }]" />
				       		</c:url>
				       		
							<c:if test="${status.index != 0 }">
							<div class="col-md-2 col-sm-6"><button value="${addresss}" class="updateAddress btn btn-success">Update</button></div>
							</c:if> --%>

											<!-- construct an "delete" link with address id -->
											<c:url var="addressDeleteLink" value="/deleteAddress">
												<c:param name="aid" value="${addresss.aid}" />
											</c:url>


											<!-- To delete current address of user -->
											<%-- <div class="col-md-2 col-sm-6"><button value="${addresss.aid }" class="btn btn-danger deleteCurrentAddress">Delete</button></div> --%>

											<div class="col">
												<a href="javascript:void(0);"
													class="btn btn-danger float-left remove_field">Remove</a>
											</div>

											<div class="col">

												<c:if test="${status.last }">
													<input type="hidden" id="addressCount"
														value="${status.index }" />
												</c:if>

												<a href="javascript:void(0);"
													class="btn btn-success float-right" onclick="addAddress()"
													title="Add field"><span
													class="glyphicon glyphicon glyphicon-plus"
													aria-hidden="true"></span>Add</a>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
							<!-- Field Wrapper -->

							<div class="mb-3">
								<form:button name="submit" class="btn btn-primary btn-lg">Update</form:button>
								<a id="reloadPage" href="${pageContext.request.contextPath }/"
									class="btn btn-warning btn-lg">Cancel</a>
							</div>

						</form:form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</c:if>
	</div>
	<%-- <c:if test="${not sessionScope.isUser and (not sessionScope.isAdmin) }">
		<div class="row">
			<div class="col">
				<h4 class="text-red text-center">Please login.</h4>
			</div>
		</div>
	</c:if>
 --%>
	<!-- Footer -->
	<%@include file="footer.jsp"%>




	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#show_hide_password a")
									.on(
											'click',
											function(event) {
												event.preventDefault();
												if ($(
														'#show_hide_password input')
														.attr("type") == "text") {
													$(
															'#show_hide_password input')
															.attr('type',
																	'password');
													$('#show_hide_password a i')
															.addClass(
																	"fa-eye-slash");
													$('#show_hide_password a i')
															.removeClass(
																	"fa-eye");
												} else if ($(
														'#show_hide_password input')
														.attr("type") === "password") {
													$(
															'#show_hide_password input')
															.attr('type',
																	'text');
													$('#show_hide_password a i')
															.removeClass(
																	"fa-eye-slash");
													$('#show_hide_password a i')
															.addClass("fa-eye");
												}
											});

							/* to reload current page */
							/* $('#reloadPage').on('click', function() {
								window.location.reload();
							}); */

						});
	</script>


	<!-- Script for dynamic address insertion -->
	<script type="text/javascript">
		/* Dynamic address fields insertion */

		var maxField = 20; //Input fields increment limitation
		var fieldIncrement = 0;
		var addButton = $('.add_button'); //Add button selector
		var wrapper = $('.field_wrapper'); //Input field wrapper

		var x = $("#addressCount").val();

		//Once add button is clicked
		function addAddress() {
			$("#firstAddress").remove();
			//Check maximum number of input fields
			if (x < maxField) {
				alert("Add new Address field?")
				x++; //Increment field counter

				addAddressFields(x);

			} else {
				alert("You can only add " + maxField + " address locations :"
						+ x)
			}
		}

		$(wrapper).on('click', '.add_button_etc', function(e) {
			//Check maximum number of input fields
			if (x < maxField) {

				x++; //Increment field counter
				addAddressFields(x);

			} else {
				alert("You can only add " + maxField + " address locations")
			}
		});

		//Once remove_button is clicked
		$(wrapper)
				.on(
						'click',
						'.remove_button',
						function(e) {
							e.preventDefault();
							$(this).parent('fieldset').parent('div').fadeTo(
									800, 0.1, function() {
										$(this).slideUp(5000, function() {
										}).remove(); //Remove field html.remove();
									});
							x--;//Decrement field counter
							if (x == 0) {

								//if value of x is zero then append add button to add address fields

								$("#addressButtonWrapper")
										.append(
												'<input type="hidden" id="addressCount"'
								+' value="-1" />'
														+ '	<div class="test-center">'
														+ '		<a href="javascript:void(0);" '
														+ '			id="firstAddress" '
														+ '			class="btn btn-success float-right" onclick="addAddress()" '
														+ '			title="Add field"><span '
								+'			class="glyphicon glyphicon glyphicon-plus" '
								+'			aria-hidden="true"></span>Add</a> '
														+ '	</div>');
							}
						});

		//calling add method which provides form add functionality
		function addAddressFields(inc) {
			var fieldHTML = htmlAddressElements(inc);
			$(wrapper).append(fieldHTML); //Add field html
		}

		//dynamic form input elements
		function htmlAddressElements(fieldIncrement) {
			var fieldHTML = '<div class="border mt-2 mb-2 p-2 bg-info text-light shadow-sm rounded text-monospace font-weight-bold">'
					+ '<span class="bg-white text-dark" '
					+ 'style="box-shadow: 0.1rem 0.1rem 0.3rem 0.1rem white;">New</span>'
					+ '<fieldset class="">  <legend class="w-auto"></legend>'
					+ '<div class="form-row">'
					+ '<div class="col">'
					+ '<div class="form-group">'
					+ '<label for="inputAddress1">Address line 1 <i class="text-danger">*</i></label>'
					+ '<input type="text" name="addresss['
					+ (fieldIncrement)
					+ '].inputAddress1" required="required" class="form-control" placeholder="1234 Main St" />'
					+ '</div>'
					+ '</div>'
					+ '<div class="col">'
					+ '<div class="form-group">'
					+ '<label for="inputAddress2">Address line 2</label>'
					+ '<input type="text" name="addresss['
					+ (fieldIncrement)
					+ '].inputAddress2" class="form-control" placeholder="Apartment, studio, or floor" />'
					+ '</div>'
					+ '</div>'
					+ '</div>'

					+ '<div class="form-row">'
					+ '<div class="col">'
					+ '<div class="form-group">'
					+ '<label for="city">City <i class="text-danger">*</i></label>'
					+ '<input type="text" name="addresss['
					+ (fieldIncrement)
					+ '].city" required="required" class="form-control" />'
					+ '</div>'
					+ '</div>'
					+ '<div class="col">'
					+ '<div class="form-group">'
					+ '<label for="state">State <i class="text-danger">*</i></label>'
					+ '<select name="addresss['
					+ (fieldIncrement)
					+ '].state" class="form-control" required="required">'
					+ '<option value="other">other</option>'
					+ '<option value="Gujarat">Gujarat</option>'
					+ '<option value="Maharastra">Maharastra</option>'
					+ '<option value="Uttar Pradesh">Uttar Pradesh</option>'
					+ '<option value="Madhya Pradesh">Madhya Pradesh</option>'
					+ '</select>'
					+ '</div>'
					+ '</div>'
					+ '<div class="col">'
					+ '<div class="form-group">'
					+ '<label for="zip">Zip</label>'
					+ '<input type="text" name="addresss['
					+ (fieldIncrement)
					+ '].zip" class="form-control" />'
					+ '</div>'
					+ '</div>'

					+ '</div>'

					+ '<div class="form-row">'
					+ '<div class="col-md-6">'
					+ '<div class="form-group">'
					+ '<label for="country">Country</label>'
					+ '<input type="text" name="addresss['
					+ (fieldIncrement)
					+ '].country" class="form-control" placeholder="country" />'
					+ '</div>'
					+ '</div>'
					+ '</div>'

					+ '<a href="javascript:void(0);" class="btn btn-success add_button_etc float-right" title="Add field"><span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>Add</a>'
					+ '<a href="javascript:void(0);" class="btn btn-danger remove_button" title="Remove field"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span>'
					+ 'Remove</a>' + '</fieldset></div>'; //New input field html

			return fieldHTML;
		}
	</script>


	<script type="text/javascript">
		$("#user")
				.validate(
						{
							errorClass : "invalid",
							rules : {
								firstName : {
									required : true,
									minlength : 2
								},
								email : {
									required : true,
									email : true
								},
								password : {
									required : true,
									minlength : 5
								},
								phoneNumber : {
									required : true,
									minlength : 10,
									maxlength : 10,
								},
							},
							messages : {
								firstName : {
									required : "Please specify your name",
									minlength : jQuery.validator
											.format("At least {0} characters required!")
								},
								email : {
									required : "We need your email address to contact you",
									email : "Your email address must be in the format of name@domain.com"
								},
								password : {
									required : "Please enter password",
									minlength : jQuery.validator
											.format("At least {0} characters required!")
								},
								phoneNumber : {
									required : "Please enter your phone number",
									minlength : jQuery.validator
											.format("only {0} characters allowed!"),
									maxlength : jQuery.validator
											.format("Please enter valid phone number")
								},
							}
						});
	</script>

	<script type="text/javascript">
		$(".remove_field").on('click', function(e) {
			e.preventDefault();
			alert("removing current address fields");
			$(this).closest('.address_wrapper').fadeTo(800, 0.1, function() {
				$(this).slideUp(5000, function() {
				}).remove(); //Remove field html.remove();
			});
		});
	</script>


</body>
</html>