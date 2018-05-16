package com.reportAndStop.servlet;

import java.io.IOException;
import com.reportAndStop.servlet.LoginValidate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// This method is called by the servlet container to process a 'post' request
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		handleRequest(req, resp);
	}

	public void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		// Reading post parameters from the request
		String param1 = req.getParameter("login_id"), 
				param2 = req.getParameter("login_pwd");

		// Checking for null and empty values
		if(param1 == null || param2 == null || "".equals(param1) || "".equals(param2)) {
			req.setAttribute("error_message", "Please enter login id and password");
			req.getRequestDispatcher("/welcomePage.jsp").forward(req, resp);
		} else {

			boolean isUserFound = LoginValidate.searchUserInDb(param1, param2);
			if(isUserFound) {		
				// if found, direct to new page
				req.getRequestDispatcher("/policeDashboard.jsp").forward(req, resp);
				//resp.sendRedirect(req.getContextPath()+"/listRecords");				
//				req.getRequestDispatcher("/listRecords.jsp").forward(req, resp);
			} else {
				req.setAttribute("error_message", "You are not an authorised user. Please check with administrator.");
				req.getRequestDispatcher("/welcomePage.jsp").forward(req, resp);
			}	
		}		
	}
}