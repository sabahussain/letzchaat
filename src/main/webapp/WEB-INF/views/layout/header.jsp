<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<html>
<head>
<title>${param.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<c:url value="resources/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/css/navbar.css"/>"
	rel="stylesheet">
<script src="<c:url value="resources/js/jquery-2.0.3.min.js"/>"></script>
<script src="<c:url value="resources/js/bootstrap.min.js"/>"></script>
<style>
.navbar {
    background-color: #9370DB;
    border-color: #696969;
}
</style>
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/" />">Letzchaat</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
			
					<li class="${param.page == 'chatroom' ? 'active' : ''}"><a href="<c:url value="/chatroom.html" />">New Chatroom</a></li>
					<li class="${param.page == 'list' ? 'active' : ''}"><a href="<c:url value="/chatroom/list.html" />">Chatroom List</a></li>
					
				</ul>
			</div>
			
		</div>
	</div>

	<div class="container">
	
	<br><br><br>