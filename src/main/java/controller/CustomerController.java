package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import dao.SellerDao;
import model.Customer;
import model.Seller;
import services.Service;


@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equalsIgnoreCase("Register")) {
			Customer c = new Customer ();
			c.setName(request.getParameter("name"));
			c.setAddress(request.getParameter("address"));
			c.setContact(Long.parseLong(request.getParameter("contact")));
			c.setEmail(request.getParameter("email"));
			c.setPassword(request.getParameter("password"));
			System.out.println(c);
			CustomerDao.insertcustomer(c);
			request.setAttribute("msg", "Data inserted successfully");
			request.getRequestDispatcher("customer-login.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("Login")) {
			Customer c= new Customer ();
			c.setEmail(request.getParameter("email"));
			c.setPassword(request.getParameter("password"));
			Customer c1 = CustomerDao.logincustomer(c);
			if (c1 == null) {
				request.setAttribute("validate", "Email or Password is incorrecrt");
				request.getRequestDispatcher("customer-login.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("data", c1);
				request.getRequestDispatcher("customer-index.jsp").forward(request, response);

			}
		}
		else if(action.equalsIgnoreCase("update")) {
			Customer c = new Customer();
			c.setId(Integer.parseInt(request.getParameter("id")));
			c.setName(request.getParameter("name"));
			c.setContact(Long.parseLong(request.getParameter("contact")));
			c.setAddress(request.getParameter("address"));
			c.setEmail(request.getParameter("email"));
			CustomerDao.updatecustomer(c);
			HttpSession session = request.getSession();
	 		session.setAttribute("data", c);
	 		request.getRequestDispatcher("seller-profile.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("update password")) {
			String email = request.getParameter("email");
			String op = request.getParameter("op");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");
			boolean flag = CustomerDao.checkPassword(email, op);
			if(flag == true) {
				if(np.equals(cnp)) {
					SellerDao.updatePassword(email, np);
					response.sendRedirect("customer-index.jsp");
				}
				else{
					request.setAttribute("msgpass", "new pass and cnp not matched");
					request.getRequestDispatcher("customer-change-password.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "old password not matched");
				request.getRequestDispatcher("customer-change-password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("get otp")) {
			String email = request.getParameter("email");
			boolean flag = SellerDao.checkEmail(email);
			if(flag == true) {
				Service s = new Service();
				Random r = new Random();
				int num = r.nextInt(9999);
				System.out.println(num);
				s.sendMail(email, num);
				request.setAttribute("email", email);
				request.setAttribute("otp", num);
				request.getRequestDispatcher("customer-verify-otp.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "email id not registred");
				request.getRequestDispatcher("customer-forgot-password.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("verify")) {
			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("otp1"));
			int otp2 = Integer.parseInt(request.getParameter("otp2"));
			if(otp1 == otp2) {
				request.setAttribute("email", email);
				
				request.getRequestDispatcher("customer-new-password.jsp").forward(request, response);
			}
			else {
				request.setAttribute("otpmsg", "OTP not matched");
				request.setAttribute("otp", otp1);
				request.getRequestDispatcher("customer-verify-otp.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("New Password")) {
			String email = request.getParameter("email");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");
			if(np.equals(cnp)) {
				CustomerDao.updatePassword(email, np);
				response.sendRedirect("customer-login.jsp");
			}
			else {
				request.setAttribute("validatepass", "np and cnp not metched");
				request.getRequestDispatcher("customer-new-password.jsp").forward(request, response);
			}
		}
	}
}
