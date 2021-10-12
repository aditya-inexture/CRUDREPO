<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
  <a class="navbar-brand" href="#">USER Maintenance</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href='<c:url value="/"/>'> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showForm">Add User</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list">List Users</a>
      </li>
	</ul>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
		</ul>
	</div>
</nav>

  <!-- JavaScript code -->
         <script>
  
            /* Code for changing active 
            link on clicking */
            var btns = $(".navbar-nav .nav-item");
  
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click",
                                      function () {
                    var current = document
                        .getElementsByClassName("active");
                    //alert("inside for loop "+current.className);
  
                    current[0].className = current[0]
                        .className.replace(" active", "");
  
                    this.className += " active";
                    //alert("inside for loop "+this.className);
                });
            }
  
            /* Code for changing active 
            link on Scrolling */
            $(window).scroll(function () {
                var distance = $(window).scrollTop();
                $('.page-section').each(function (i) {
  
                    if ($(this).position().top 
                        <= distance + 250) {
                          
                            $('.navbar-nav a.active')
                                .removeClass('active');
  
                            $('.navbar-nav a').eq(i)
                                .addClass('active');
                    }
                });
            }).scroll();
        </script>
 </body>
</html>