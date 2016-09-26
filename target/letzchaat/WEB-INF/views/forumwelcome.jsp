<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>	
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="http://getbootstrap.com/favicon.ico">
 <link href="${a}/blog.css" rel="stylesheet"/>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-2.0.1.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
 <script src="${b}/app.js"></script>
 <script src="${b}/blog_service.js"></script>
 <script src="${b}/blog_controller.js"></script>
 <script>
 var app=angular.module('myApp', [])
 app.controller('ctrl', function($scope) {
  $scope.articles =${listpost}  
 });
 /*app.controller('ctr', function($scope) {
	  $scope.postToUpdate =${command}  
	 }); */
</script>
<!-- <script>	  
	 $scope.editPost = function(id) {
		    
		    var firebaseObj = new Firebase("https://blistering-heat-2473.firebaseio.com/Articles/" + id);
		 
		    var syn = $firebase(firebaseObj);
		   
		    $scope.postToUpdate = syn.$asObject();
		 
		    $('#editModal').modal();      // triggers the modal pop up
		}
</script> -->
</head>
<body ng-app="myApp" ng-controller="ctrl">
<div class="blog-masthead" ng-controller="BlogController as ctrl1">
        <div class="container">
            <nav class="blog-nav">
                <a class="blog-nav-item active" href="postList">Home</a>
                <a class="blog-nav-item " href="addPost">Add Post</a>
 
            </nav>
        </div>
    </div>
    <div class="container">
        <div class="page-header">
            <h1>Letzchat App</h1>  
        </div>
        <p class="lead">Welcome home !!</p>
       
         ${listPost}
    </div>
    <div>
    <div class="list-group"  ng-repeat="article in articles">
   <a href="#" onclick="return false;" class="list-group-item active">
        <h4 class="list-group-item-heading">{{article.txtTitle}}</h4>
        <p class="list-group-item-text">{{article.txtPost}}</p>
    </a>
    <div>
    <span class="pull-right">
     <!--  <a href="editPost/{{article.id}}">EDIT</a> -->
      <button class="btn btn-xs btn-info" data-toggle="modal" ng-click="ctrl1.editPost(article.$id)" data-target="#editModal">EDIT</button>
      <button class="btn btn-xs btn-warning">DELETE</button>
    </span>
    </div>
</div>
</div>
 
 <div ng-repeat="b in ctrl1.blogs"class="modal" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="editModalLabel">Update Post</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="myForm">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">Title:</label>
                        <input type="text" class="form-control" id="recipient-name" ng-bind="b.txtTitle">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">Post:</label>
                        <textarea class="form-control" id="message-text"  ng-bind="b.txtPost"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Publish</button>
            </div>
        </div>
    </div>
</div>
    <footer class="footer">
        <div class="container">
            <p class="text-muted"></p>
        </div>
    </footer>

</body>
</html>