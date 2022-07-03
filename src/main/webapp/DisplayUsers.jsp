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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
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
 			<h2 class="text-uppercase text-center mb-5 display-6">List of Users</h2>	
 		<div class="container-lg">
 		<ul id="list" style="list-style-type:none" class="list-group  list-group-horizontal text-center">
			<li class="list-group-item flex-fill list-group-item-info"><b>&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;</b></li>
			<li class="list-group-item flex-fill list-group-item-info"><b>Surname</b></li>
		</ul>
	
		<c:forEach var="user" items="${listUser}">
			<ul id="list2" style="list-style-type:none" class="list-group   list-group-horizontal text-center">
          	  <li class="list-group-item list-group-item-action "><a href="<%=request.getContextPath()%>/show?id=${user.id}" style="text-decoration: none;" class="link-dark"><c:out value="${user.name}" /></a></li>
				<li class="list-group-item list-group-item-action "><a href="<%=request.getContextPath()%>/show?id=${user.id}" style="text-decoration: none;" class="link-dark"><c:out value="${user.surname}" /></a></li>
			</ul>
		</c:forEach>
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