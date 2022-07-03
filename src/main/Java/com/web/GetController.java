package com.web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.web.dao.UserDao;
import com.web.model.Address;
import com.web.model.User;
import com.web.model.User.Gender;

@WebServlet("/")
public class GetController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    } 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
	
		switch (action) {
		 case "/register":
			 showRegisterForm(request, response);
			 break;
		 case "/list":
			 userList(request, response);
			 break;
		 case "/show":
			 showUser(request, response);
			 break;
		 case "/edit":
			 showEditForm(request, response);
			 break;
		 case "/delete":
			 deleteUser(request, response);
			 break;
		 default:
			 homepage(request,response);
			 break;
		 } 
     }
		

	private void homepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	private void showUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		User selectedUser = userDao.takeUser(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("displayUserDetails.jsp");
	    request.setAttribute("selectedUser", selectedUser);
	    dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		int id = Integer.parseInt(request.getParameter("id"));
		User editUser = userDao.takeUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Registration.jsp");
		request.setAttribute("user", editUser);
		dispatcher.forward(request, response);
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int id = Integer.parseInt(request.getParameter("id"));
	        userDao.deletionOfUser(id);
	        response.sendRedirect("list");
	}

	private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("Registration.jsp");
        dispatcher.forward(request, response); 
	}

	private void userList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  List<User> listUser = userDao.listEveryUser(); 
		  request.setAttribute("listUser", listUser); 
		  
		  RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayUsers.jsp"); 
		  dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  String action = request.getServletPath();
		  switch (action) { 
		  case "/save": 
			  putUser(request, response); 
			  break; 
		  case "/updateUser": 
			  updateUser(request, response); 
			  break; 
		}
}
	private void putUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String gender = request.getParameter("gender");
        String birthDate = request.getParameter("birthDate");
        String workAddress = request.getParameter("workAddress");
        String homeAddress = request.getParameter("homeAddress");

        Date dt = Date.valueOf(birthDate);
        Gender gen= Gender.valueOf(gender);
       
        User newUser = new User();
        Address aUser = new Address();
        
        newUser.setName(name);
        newUser.setSurname(surname);
        newUser.setGender(gen);
        newUser.setBirthdate(dt);
        aUser.setWorkAddress(workAddress);
        aUser.setHomeAddress(homeAddress);
        
        newUser.setAddressId(aUser);
        
        userDao.newUser(newUser);
        response.sendRedirect("list"); 
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String gender = request.getParameter("gender");
        String birthDate = request.getParameter("birthDate");
        String workAddress = request.getParameter("workAddress");
        String homeAddress = request.getParameter("homeAddress");
        
        Date date = Date.valueOf(birthDate);
        Gender gnd= Gender.valueOf(gender);
        
        User updUser = new User();
        Address apdaUser = new Address();
        
        updUser.setId(id);
        updUser.setName(name);
        updUser.setSurname(surname);
        updUser.setGender(gnd);
        updUser.setBirthdate(date);
        apdaUser.setWorkAddress(workAddress);
        apdaUser.setHomeAddress(homeAddress);
        
        updUser.setAddressId(apdaUser);
        
        userDao.renewalOfUser(updUser);
        response.sendRedirect("list");
	}
}
