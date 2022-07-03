<%@page import="com.web.model.User"%>
<%@page import="com.web.model.Address"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application</title>
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
$("#datepicker").datepicker({ 
	dateFormat: 'yy-mm-dd',
	maxDate: '0'
	});
});
</script> 
</head>

<body>
<section class="vh-100 bg-image"
  style="background-image: url('https://static.vecteezy.com/system/resources/previews/004/479/643/original/blue-color-watercolor-background-free-photo.jpg');">
   <div class="mask d-flex align-items-center h-100 gradient-custom-3"> 
    <div class="container h-100">
     <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6">
		<div class="card rounded-3" style="border-radius: 15px;">
 		 <div class="card-body p-5">	
 			<c:if test="${user != null}"><h2 class="text-uppercase text-center mb-5 display-6">Update User</h2>  
 			 <form action="<%=request.getContextPath()%>/updateUser" method="post">
  			</c:if>
 			<c:if test="${user eq null}"><h2 class="text-uppercase text-center mb-5 display-6">User Registration Form</h2>
 			 <form action="<%=request.getContextPath()%>/save" method="post">
 			</c:if>

 <form>
 	<c:if test="${user != null}">
         <input type="hidden" name="id" value="${user.id}"/>
    </c:if>
 	<div class="form-floating mb-3">
     <input type="text" id="floatingInput" class="form-control" placeholder="Name" name="name" value="${user.name}" required/>
   	 <label for="floatingInput">Name</label>
    </div>

 	<div class="form-floating mb-3">
     <input type="text" id="floatingInput" class="form-control" placeholder="Surname" name="surname" value="${user.surname}" required/>
     <label for="floatingInput">Surname</label>
    </div>

	<div class="form-floating  mb-3">
  	 <select class="form-select" name="gender" id="gender" required>  
		 <c:if test="${user == null}">
  				<option selected></option>
    			<option value="Female">Female</option>
   				<option value="Male">Male</option>
    	 </c:if>
    	 <c:if test="${user != null}">
    		<c:if test="${user.gender eq 'Male'}">
  				<option selected>${user.gender}</option> 
    			<option value="Female">Female</option>
    		</c:if>
    		<c:if test="${user.gender eq 'Female'}">
     			<option selected>${user.gender}</option> 
    			<option value="Male">Male</option>
    		</c:if>
    	 </c:if>
	</select>
    <label for="floatingSelect">Gender</label>
	</div>

 	<div  class="form-floating mb-3">
 	 <input type = "text" id = "datepicker" class="form-control" name="birthDate" value="${user.birthdate}" required>
  	 <label for="floatingInput">Date of birth</label>
	</div>


	<div class="form-floating mb-3">
  	 <textarea class="form-control"  id="text" style="height: 100px" name="workAddress">${user.addressId.workAddress}</textarea>
  	 <label for="floatingTextarea2">Work Address</label>
	</div>

	<div class="form-floating mb-3">
  	 <textarea class="form-control"  id="text" style="height: 100px" name="homeAddress">${user.addressId.homeAddress}</textarea>
  	 <label for="floatingTextarea2">Home Address</label>
	</div>

	<div class="d-flex justify-content-center">
   	 <c:if test="${user == null}">
     	<button type="submit" class="btn btn-info btn-block btn-lg" value="save">Register</button>
     </c:if> 
     <c:if test="${user != null}">
    	<button type="submit" class="btn btn-info btn-block btn-lg" value="updateUser">Update</button>
     </c:if>
  </div>
</form>

</div>
</div>
</div>
</div>
</div>
</div>
</section>
</body>
</html>