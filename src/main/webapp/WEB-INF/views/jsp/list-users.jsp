<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
<link rel="stylesheet" href="resources/core/css/dataTables.bootstrap4.min.css">


</head>
<body>
<header><%@include file="header.jsp" %></header>


<c:if test="${(not sessionScope.isAdmin) and (not sessionScope.isUser)}">
	<c:redirect url="/error" />
</c:if>

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
	     <table id="listUser" class="table table-striped table-bordered mb-5">
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
			       <th>Delete</th>
		      </tr>
			</thead>  
	 
	       		
			<tbody>
				<!-- loop over and print our customers -->
		      	<c:forEach var="tempUser" items="${users}" varStatus="varStatus">
		       		
		       		<%-- <!-- construct an "delete" link with user id -->
		       		<c:url var="addressLink" value="/userAddress">
		        		<c:param name="aid" value="${tempUser.addresss[0].aid}" />
		       		</c:url> --%>
		       		
		       		<c:url var="addressLink" value="/userAddress">
		        		<c:param name="uid" value="${tempUser.uid}" />
		       		</c:url> 
		       		
		       		<c:url var="userDetailsLink" value="/userDetails">
		        		<c:param name="uid" value="${tempUser.uid}" />
		       		</c:url>
		       		<tr>
		       			<td>${varStatus.count}</td>
		       			<td>
			       			<c:if test="${tempUser.type != 'admin' }">
			       				<a class="fa fa-eye text-primary ml-2 mt-3" href="${ userDetailsLink }"></a>
			       			</c:if>
		       			</td>
				        <td>${tempUser.firstName}</td>
				        <td>${tempUser.lastName}</td>
				        <td>${tempUser.email}</td>
						<td>
						<c:set var="dob" value="${tempUser.dob}"></c:set>
							${fn:substring(dob,0,10)}
						</td>
						<td>${tempUser.gender}</td>
						<td>${tempUser.phoneNumber}</td>
						<td>
							<%-- <a class="btn btn-success" href="${addressLink }" id="showUserAddress">User address</a> --%>
							<button class="btn btn-warning" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="showUserAddress(${tempUser.uid})">User address</button>
						</td>
						<td>
													
						<c:if test="${tempUser.type == 'admin' }">
						<button class="btn btn-danger text-light" disabled data-toggle="tooltip" data-placement="top" title="Can't delete admin account">
						<i class="fa fa-trash"></i></button>		
						</c:if>
						
						<c:if test="${tempUser.type == 'user' }">
							<button class="btn btn-danger text-light" onclick="deleteUser(${tempUser.uid})">
								<i class="fa fa-trash"></i>
							</button>
						</c:if>
							
						</td>
		       		</tr>
		       		</c:forEach>
				</tbody>
		    </table>
		</div>
		
		
<!-- Modal to display address of user -->		
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg text-break">
    <div class="modal-content ">
    <div class="modal-header bg-warning text-light">
        <h4 class="modal-title" id="exampleModalLongTitle">User Address</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      		<div id="result" class="table-responsive">
			<table id="addressTable" class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Address Line 1</th>
						<th>Address Line 2</th>
						<th>City</th>
						<th>State</th>
						<th>Zip</th>
						<th>Country</th>
					</tr>
				</thead>
				<tbody id="records_body">
					
				</tbody>
			</table>
		</div>
    </div>
  </div>
</div>
		
				
    </div>
  	</div>
</div>
</c:if>
<c:if test="${sessionScope.isUser and (not sessionScope.isAdmin) }">
	<div class="row">
		<div class="col">
			<h4 class="text-red text-center">Please login.</h4>
		</div>
	</div>
</c:if>

<!-- Footer -->
	<%@include file="footer.jsp" %>

<script src="resources/core/js/jquery-3.6.0.min.js"></script>
<script src="resources/core/js/jquery.dataTables.min.js"></script>
<script src="resources/core/js/popper.min.js" ></script>
<script src="resources/core/js/bootstrap.min.js"></script>
<script src="resources/core/js/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#listUser').DataTable();
      
});

function showUserAddress(uid){
	
	$('#records_body').remove();
	
	$.ajax({
		type:"GET",
		url : "getUserAddress/" + uid,
		//dataType : "json",
		success : function(response) {
			//alert("success " + response )
			
			$.each(response,function(i,item){
				
					$("<tbody>",{"id":"records_body"}).appendTo("#addressTable");
				        var $tr = $('<tr>').append(
				        	$('<td>',{"style":"color:black;font-weight:bold;"}).text(++i + '.'),
				        	$('<td>').text(item.inputAddress1),
				            $('<td>').text(item.inputAddress2),
				            $('<td>').text(item.city),
				            $('<td>').text(item.state),
				            $('<td>').text(item.zip),
				            $('<td>').text(item.country)
				        ).appendTo('#records_body');
				       // console.log($tr.wrap('<p>').html());
				    		
			});
		},
		error : function(err) {
			alert("error " + err);
		}
	});
	
}

function deleteUser(uid){
	$.ajax({
		type:"GET",
		url: "deleteUser/" + uid,
		success:function(response){
			setTimeout(function(){ window.location.reload(); }, 500);
			console.log(response);
		},
		error:function(err){
			alert("Error deleting user : "+err);
		}
	});
}

</script>

</body>
</html>