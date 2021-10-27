<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
  <a class="navbar-brand" href="#">USER Maintenance</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href='<c:url value="/"/>'> Home <span class="sr-only">(current)</span></a>
      </li>
      <c:if test="${sessionScope.isAdmin}">
	      <li class="nav-item">
	        <a class="nav-link" href="list">List Users</a>
	      </li>
      </c:if>
      <c:if test="${sessionScope.isUser}">
      	<li class="nav-item">
        	<a class="nav-link" href="listUser">Your profile</a>
      	</li>
      </c:if>
      <c:if test="${(not sessionScope.isUser) and (not sessionScope.isAdmin)}">
      <li class="nav-item">
	        <a class="nav-link" href="showForm">Register</a>
	  </li>
	  </c:if>
	</ul>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login" id="login-btn">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="logout" id="logout-btn">Logout</a></li>
		</ul>
	</div>
</nav>

<c:if test="${sessionScope.isAdmin or sessionScope.isUser}">
	<script type="text/javascript">
		var login_btn = document.getElementById("login-btn");
		var logout_btn = document.getElementById("logout-btn");
		
		login_btn.style.display = "none";
		logout_btn.style.display = "block";
	</script>
</c:if>
<c:if test="${not (sessionScope.isAdmin or sessionScope.isUser) }">
	<script type="text/javascript">
		var login_btn = document.getElementById("login-btn");
		var logout_btn = document.getElementById("logout-btn");
		
		login_btn.style.display = "block";
		logout_btn.style.display = "none";
	</script>
</c:if>

  <!-- JavaScript code -->
         <script>
         for (var i = 0; i < document.links.length; i++) {
        	    if (document.links[i].href == document.URL) {
        	        document.links[i].className = 'nav-link active';
        	    }
        	}
        </script>
 </body>
</html>