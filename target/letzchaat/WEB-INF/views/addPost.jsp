<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="${a}/bootstrap.min.css" rel="stylesheet"/>
 <link href="${a}/blog.css" rel="stylesheet"/>
 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="myApp">
 <div class="blog-masthead">
        <div class="container">
            <nav class="blog-nav">
                <a class="blog-nav-item " href="postList">Home</a>
                <a class="blog-nav-item active" href="addPost">Add Post</a>
 
            </nav>
        </div>
    </div>
 
    <div class="container">
 
        <form class="form-horizontal" action="postAdd">
            <fieldset>
 
                <!-- Form Name -->
                <legend>Create Post</legend>
 
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtTitle">Title</label>
                    <div class="col-md-4">
                        <input id="txtTitle" name="txtTitle" ng-model="article.title" type="text" placeholder="placeholder" class="form-control input-md">
 
                    </div>
                </div>
 
                <!-- Textarea -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtPost">Post</label>
                    <div class="col-md-4">
                        <textarea class="form-control" id="txtPost" ng-model="article.post" name="txtPost"></textarea>
                    </div>
                </div>
 
                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="singlebutton"></label>
                    <div class="col-md-4">
                        <input id="singlebutton"  ng-disabled="!article.title || !article.post" name="singlebutton" class="btn btn-primary" type="submit" value="Publish" />
                    </div>
                </div>
 
            </fieldset>
        </form>
 
 
    </div>
    <div class="container">
    <p> ${msg}</p>
    </div>
    <!-- /.container -->
 
    <jsp:include page="layout/footer.jsp"></jsp:include>
 
 

</body>
</html>