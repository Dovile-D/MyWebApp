<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.web.model.User"%>
<%@page import="com.web.model.Address"%> 
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application</title>
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>

<body>
<section class="vh-100 bg-image"
  style="background-image: url('https://static.vecteezy.com/system/resources/previews/004/479/643/original/blue-color-watercolor-background-free-photo.jpg');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3"> 
   <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6">
 		<div class="card" style="border-radius: 15px;">
 		 <div class="card-body p-5">
		  <div class="container-lg">

<% request.getSession().getAttribute("selectedUser");%>

	<h2 class=" text-center mb-5 display-6">Personal Information of ${selectedUser.name} ${selectedUser.surname}</h2>
	<ul id="listDetails" style="list-style-type:none" class="list-group text-center">
	
			<li class="list-group-item list-group-item-action">${selectedUser.gender}</li>
			<li class="list-group-item list-group-item-action ">${selectedUser.birthdate}</li>
			 <c:if test="${selectedUser.addressId.workAddress != ''}">
			   <li class="list-group-item list-group-item-action">${selectedUser.addressId.workAddress}</li>
			 </c:if>
			 <c:if test="${selectedUser.addressId.homeAddress != ''}">
			   <li class="list-group-item list-group-item-action">${selectedUser.addressId.homeAddress}</li>
			 </c:if>  
	</ul>
	<br><br>
	<div class="d-flex gap-2 justify-content-center">	
	 <a class="btn btn-outline-secondary btn-lg" href="<%=request.getContextPath()%>/edit?id=${selectedUser.id}" role="button">Edit</a>
      <br><br><a class="btn btn-outline-danger btn-lg" href="<%=request.getContextPath()%>/delete?id=${selectedUser.id}" role="button" onclick="return confirm('Are you sure you want to delete ${selectedUser.name} ${selectedUser.surname}?')">Delete</a>
</div>
</div>
</div>
</div>
 <br><br><br>
 	<div class="d-flex justify-content-center">  
	 <a href="<%=request.getContextPath()%>/"><button type="submit" class="btn btn-outline-dark btn-lg">Home Page</button></a>
 	</div>
</div>
</div>
</div>
</div>
</section>	
</body>
</html>