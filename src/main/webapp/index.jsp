<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Web Application</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>
<body>
	<section class="vh-100 bg-image"
 	 style="background-image: url('https://static.vecteezy.com/system/resources/previews/004/479/643/original/blue-color-watercolor-background-free-photo.jpg');">
 	<div class="mask d-flex align-items-center h-100 gradient-custom-3"> 
   	 <div class="container h-100">
    	<div class="row d-flex justify-content-center align-items-center h-100">
     	 <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <h1 class="text-uppercase text-center mb-5 display-4">Home Page</h1>
      		<div class="card rounded-3" style="border-radius: 15px;">
      		 <img src="https://wallpaperaccess.com/full/4542406.jpg" 
      		 class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;">
        		<div class="card-body p-5">	
   				 <div class="d-grid gap-2 d-md-block col-5 mx-auto">
	     			<h1 class="text-uppercase text-center mb-5 display-6">Welcome</h1>
	 				 <div class="d-grid gap-2 col-8 mx-auto justify-content-center">  
						<a href="<%=request.getContextPath()%>/register"><button type="button" class="btn btn-outline-dark btn-lg">Register new User</button></a>
						<a href="<%=request.getContextPath()%>/list"><button type="button" class="btn btn-outline-dark btn-lg">Display Users</button></a>	
	 				</div>
	  			 </div>
				</div>
			</div>
		</div>
	  </div>
	</div>
 </div>
</section>
</body>
</html>
