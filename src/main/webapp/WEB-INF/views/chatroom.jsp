<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>	
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<link href="${a}/bootstrap.min.css" rel="stylesheet"/>
 <script src="${b}/jquery-2.2.3.min.js">
 </script>
<script src="${b}/bootstrap.min.js">
</script>
<jsp:include page="layout/header.jsp">
	<jsp:param value="New Chatroom" name="title" />
	<jsp:param value="chatroom" name="page" />
</jsp:include>

<h2>New Chatroom:</h2>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form cssClass="form-horizontal" commandName="chatroom">

	<c:if test="${param.success}">
		<div class="form-group">
			<div class="col-sm-6">
				<div class="alert alert-success">
					Successfully saved!
				</div>
			</div>
		</div>
	</c:if>

	<div class="form-group errorMsg" style="display: none">
		<div class="col-sm-6">
			<div class="alert alert-danger">
				Error! Check form!
			</div>
		</div>
	</div>

	<form:errors path="name" />
	<div class="form-group">
		<label class="col-sm-1 control-label">Name:</label>
		<div class="col-sm-5">
			<form:input cssClass="form-control" placeholder="Name" path="name" />
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword" class="col-sm-1 control-label">Description:</label>
		<div class="col-sm-5">
			<form:input cssClass="form-control" placeholder="Description" path="description" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-5">
			<input type="submit" class="btn btn-primary btnSubmit" />
		</div>
	</div>
</form:form>

<script type="text/javascript">
	$(document).ready(function() {
		$(".btnSubmit").click(function(e) {
			if(! $("#name").val()) {
				e.preventDefault();
				$(".errorMsg").show();
			}
		});
	});
</script>


<jsp:include page="layout/footer.jsp" />