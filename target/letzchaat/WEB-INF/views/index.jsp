<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>
<html>
<head>
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<c:url value="/resources/images" var="z"></c:url>
<link href="${a}/bootstrap.min.css" rel="stylesheet"/>
<link href="${a}/login.css" rel="stylesheet"/>
<link href="${a}/navbar.css" rel="stylesheet"/>
 <script src="${b}/jquery-2.2.3.min.js">
 </script>
<script src="${b}/bootstrap.min.js">
</script>
</head>
<body background="${z}/landscape-nature-sunset-trees.jpg">
    <nav class="navbar navbar-default navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     <a class="navbar-brand" style="color: navy;font-size: 20px; box-shadow: inset 7px -9px #ff0000 ;" href="#">LetzChaat.com</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index">Home</a></li>
         <li><a href="contactus">Contact</a></li>
        <li class="dropdown">
           <a class="dropdown-toggle" data-toggle="dropdown" href="#">What's New<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">News Flash</a></li>
            <li><a href="#">Job Oppurtunities</a></li>
            <li><a href="#">Gallery</a></li>  
            <li><a href="#">Latest Events</a></li>                        
          </ul>
         <c:if test="${!empty name}">
       <li><a href="chatroom">CHAT</a></li>
        <li><a href="forumwelcome">BLOG</a></li>
        </c:if>
        </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${empty name}">
        <li><a href="signup"><span class="glyphicon glyphicon-user"></span> Register</a></li>
        <li id="login">
      <a id="login-trigger" style="background-color: #9370DB;"href="#">
        Log in &#9660;
      </a>
      <div id="login-content">
        <form action="login" method="post">
          <fieldset id="inputs">
            <input id="username" type="text" name="username" placeholder="Your Username" required>   
            <input id="password" type="password" name="password" placeholder="Password" required>
          </fieldset>
          <fieldset id="actions">
            <input type="submit" id="submit" value="Log in">
            <label><input type="checkbox" checked="checked"> Keep me signed in</label>
          </fieldset>
        </form>
      </div>                     
    </li>
    </c:if>
     <c:if test="${!empty name}">
     
     <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
     style="background-color: #000000; margin-top:10%; margin-right: 20%; color: #bababa; ">Hi, ${name}
    
    <span class="caret"></span></button>
    <ul class="dropdown-menu" style="font-size: 20px; background-color: #aaaaaa;">
      <li><a href="#">View Profile</a></li>
      <li class="divider"></li>
      <li><a href="signOut">Sign Out</a></li>
    </ul>
  </div>
      </c:if>
      </ul>
    </div>
  </div>
</nav>
      
      <div class="jumbotron" style="margin-left: 4% ; margin-right: 4%">
        <h1><span style="margin-left: 2%;font-size: 70px;color: red;">C</span>onnecting <span style="color: blue; font-family:sans-serif;font-size: 55px; ">NIIT</span> Professionals</h1>
        <p style="margin-left: 3%">One place for all NIIT Students and Alumni.</p>
         <div class="arrow-style" style="margin-left: 3%"> <a href="../../components/#navbar" role="button"> Learn more &raquo;</a> </div>
      </div>
      
<script>
$(document).ready(function(){
	  $('#login-trigger').click(function(){
	    $(this).next('#login-content').slideToggle();
	    $(this).toggleClass('active');          
	    
	    if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
	      else $(this).find('span').html('&#x25BC;')
	    })
	});
</script>
</body>
</html>
