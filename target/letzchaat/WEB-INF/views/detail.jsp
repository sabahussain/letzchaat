<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>	
<html>
<head>
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<link href="${a}/bootstrap.min.css" rel="stylesheet"/>
 <script src="${b}/jquery-2.2.3.min.js">
 </script>
<script src="${b}/bootstrap.min.js">
</script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
 <script>
 angular.module('myApp', [])
 .controller('ctrl2', function($scope) {
  $scope.chat =${list}  
 });
</script>
</head>
<body>
<jsp:include page="layout/header.jsp">
	<jsp:param value="Chatroom List" name="title" />
	<jsp:param value="list" name="page" />
</jsp:include>

<h2>${chatroom.name}</h2>
${chatroom.description}<br><br>

<form action="" method="post">
	<input type="hidden" name="id" value="${chatroom.id}">
	<div class="form-group">
		<div class="col-sm-5">
			<input type="text" class="form-control" placeholder="Message" name="message" autofocus="autofocus" />
		</div>
		<div class="col-sm-5">
			<input type="submit" class="btn btn-primary" />
		</div>
	</div>
</form>
<br><br><br>
<script>
 var repeatme = function print() {
		$.ajax({
			url : '<spring:url value="/chatroom/detail/${chatroom.id}.json" />',
			cache : false
		}).done(function(data) {
			$(".messages").html("");
			$.each(data.chatmessages, function(index, value) {
				$(".messages").append(value.message + "<br>");
			});
		});
	};

	$(document).ready(function() {
		repeatme();
		//setInterval(repeatme, 1000);
	}); 
</script>

<!-- <div class="list-group" ng-repeat="x in chat">
    <a href="#" class="list-group-item active">
        <p class="list-group-item-text">{{x.message}}</p>
    </a>
</div> -->
<div class="messages"></div>

<jsp:include page="layout/footer.jsp" />
</body>
</html>
