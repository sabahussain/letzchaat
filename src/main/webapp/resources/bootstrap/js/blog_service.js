'use strict';
 
angular.module('myApp').factory('BlogService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/letzchaat/blog/';
 
    var factory = {
        fetchAllBlogs: fetchAllBlogs,
        addBlog: addBlog,
        updateBlog:updateBlog,
        deleteBlog:deleteBlog
    };
 
    return factory;
 
    function fetchAllBlogs() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching blogs');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function addBlog(blog) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, blog)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating blog');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
 
    function updateUser(blog, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, blog)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating blog');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function deleteBlog(id) {
        var deferred = $q.defer();
        $http.del(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting blog');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
}]);