<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
  <head>  
    <title>BLOG</title>  
    <style>
      .txtTitle.ng-valid {
          background-color: lightgreen;
      }
      .txtTitle.ng-dirty.ng-invalid-required {
          background-color: red;
      } 
      .txtPost.ng-valid {
          background-color: lightgreen;
      }
      .txtPost.ng-dirty.ng-invalid-required {
          background-color: red;
      }
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <%--  <link href="<c:url value='/bootstap/css/app.css' />" rel="stylesheet"></link> --%>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="BlogController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">ADD AND VIEW POSTS</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.blog.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="title">Title</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.blog.txtTitle" id="title" class="form-control input-sm" placeholder="Enter post Title" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.title.$error.required">This is a required field</span>  
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="post">POST</label>
                              <div class="col-md-7">
                                  <input type="textarea" ng-model="ctrl.blog.txtPost" id="post" class="form-control input-sm" placeholder="Enter your Post"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.blog.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of blogs </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Title</th>
                              <th>Post</th>
                              <th>Date</th>
                              <th>User</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.blogs">
                              <td><span ng-bind="u.txtTitle"></span></td>
                              <td><span ng-bind="u.txtPost"></span></td>
                              <td><span ng-bind="u.postDate"></span></td>
                               <td><span ng-bind="u.username"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
      <script src="<c:url value='/resources/bootstrap/js/app.js' />"></script>
      <script src="<c:url value='/resources/bootstrap/js/blog_service.js' />"></script>
      <script src="<c:url value='/resources/bootstrap/js/blog_controller.js' />"></script>
  </body>
</html>