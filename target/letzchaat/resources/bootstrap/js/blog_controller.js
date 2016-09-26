'use strict';
 
angular.module('myApp').controller('BlogController', ['$scope', 'BlogService', function($scope, BlogService) {
    var self = this;
    self.blog={id:null,txtTitle:' ',txtPost:' '};
    self.blogs=[];
 
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
 
 
    listBlogByUsername();
 
    function listBlogByUsername(){
        BlogService.listBlogByUsername()
            .then(
            function(d) {
                self.blogs = d;
            },
            function(errResponse){
                console.error('Error while fetching Blogs');
            }
        );
    }
 
    function addBlog(blog){
       BlogService.addBlog(blog)
            .then(
            listBlogByUsername,
            function(errResponse){
                console.error('Error while creating Blog');
            }
        );
    }
 
    function updateBlog(id){
        BlogService.updateBlog(id)
            .then(
            listBlogByUsername.
            function(errResponse){
                console.error('Error while updating Blog');
            }
        );
    }
 
    function deleteBlog(id){
        BlogService.deleteBlog(id)
            .then(
            listBlogByUsername,
            function(errResponse){
                console.error('Error while deleting Blog');
            }
        );
    }
 
    function submit() {
        if(self.blog.id===null){
            console.log('Saving New Blog', self.blog);
           addBlog(self.blog);
        }else{
            updateBlog(self.blog, self.blog.id);
            console.log('Blog updated with id ', self.blog.id);
        }
        reset();
    }
 
    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.blogs.length; i++){
            if(self.blogs[i].id === id) {
                self.blog = angular.copy(self.blog[i]);
                break;
            }
        }
    }
 
    function remove(id){
        console.log('id to be deleted', id);
        if(self.blog.id === id) {
            reset();
        }
        deleteBlog(id);
    }
 
 
    function reset(){
        self.blog={id:null,txtTitle:' ',txtPost:' '};
        $scope.myForm.$setPristine(); 
    }
 
}]);