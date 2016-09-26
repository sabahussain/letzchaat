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
 <%-- <script src="${b}/app.js"></script>
 <script src="${b}/blog_service.js"></script>
 <script src="${b}/blog_controller.js"></script> --%>
 <!-- <script>
 var app=angular.module('NewApp', [])
 app.controller('ctrl', function($scope) {
  $scope.articles =${listpost}  
 });
 </script>
  -->
<script>
function Ids() {
	  document.getElementById("a").onclick;
	}
</script>
</head>
<body onLoad=Ids()>
 
<div class="blog-masthead">
        <div class="container">
            <nav class="blog-nav">
                <a class="blog-nav-item active" href="postList">Home</a>
                <a class="blog-nav-item " href="addPost">Add Post</a>
 
            </nav>
        </div>
    </div>
   
    <div ng-app="NewApp">
     <div>
    <div ng-controller="ctrl">
    
    <div class="list-group"    ng-repeat="article in articles">
   <a href="#" onclick="return false;" class="list-group-item active">
        <h4 class="list-group-item-heading">{{article.txtTitle}}</h4>
        <p class="list-group-item-text">{{article.txtPost}}</p>
    </a>
     <script>
   /*  angular.module('NewApp', []).controller('ctrl', function($scope) {
	  $scope.articles =${listpost}  
	 });  */
 
   // var app = angular.module('NewApp', []); 
   /*  app.controller('ctrl', function($scope) {
   	  $scope.articles =${listpost}  
   	 }); 
     */
   /* app.ctrl($scope){
   	 $scope.articles =${listpost};
   	 console.log("Hello me");
   }; */

  var app = angular.module('NewApp', []);
   
/*   function ctrl($scope) {
	      $scope.Foo = function() {
	   	  $scope.articles =${listpost}; */
   
   
  function MyController($scope, $http){ 
    $scope.editPost = function(id) {           
    $http({method: 'GET', url: 'may'}).
    success(function(data, status, headers, config) {
        $scope.postToUpdate = ${command};
        $('#editModal').modal();
    }).
    error(function(data, status, headers, config) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
     });
    
    };
}
  </script>
    <button id="a" data-ng-click="Foo()">Button A</button>
     <button class="btn btn-xs btn-info" data-toggle="modal" data-ng-click="editPost(article.$id)" data-target="#editModal">EDIT</button>
     <button class="btn btn-xs btn-warning">DELETE</button>
     
   </div>
    
    </div>
    </div>
    </div>
 
 <div class="modal" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
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
                        <input type="text" class="form-control" id="recipient-name" ng-model="postToUpdate.txtTitle">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">Post:</label>
                        <textarea class="form-control" id="message-text"  ng-model="postToUpdate.txtPost"></textarea>
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