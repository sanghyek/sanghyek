package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ActionSignup;

public class Connection extends HttpServlet{

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String ID = request.getParameter("ID");
		String Name = request.getParameter("Name");
		String PW = request.getParameter("PW");
		Cominterface inter = null;
		String viewName = "";

		
		try {
			if(command.equals("list")){
				inter = Service1.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}  
			else if(command.equals("Signup")) {
				inter = Signup.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("Del")) {
				//System.out.print(ID);
				inter = Delete.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			else if(command.equals("update")) {
				//System.out.print("comand="+ID);
				inter = Update.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			} else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}
}
