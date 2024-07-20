
package com.learn.mycart.servelts;

import com.learn.mycart.entities.Users;
import com.learn.mycart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.hibernate.Session;
import org.hibernate.Transaction;



public class RegisterSevlets extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
               String userName =  request.getParameter("user_name");
               String userEmail =  request.getParameter("user_email");
               String userPassword =  request.getParameter("user_password");
               String userPhone =  request.getParameter("user_phone");
               String userAddress =  request.getParameter("user_address");
               String userType =request.getParameter("user_types").trim();
               //validation
                if(userName.isEmpty())
                {
                    out.println("Name is blank");
                    return;
                }
       //creating user object to store data
       
     Users users =  new Users(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,userType);
        
                Session hibernateSession =   FactoryProvider.getFactory().openSession();
                Transaction tx= hibernateSession.beginTransaction();
                
                int userId =(int) hibernateSession.save(users);
                
              
                tx.commit();
                hibernateSession.close();
                
                HttpSession httpSession =  request.getSession();
                httpSession.setAttribute("message", "Registration Successful !!User id is "+userId);
                
                response.sendRedirect("register.jsp");
                return;
                
            } catch (Exception e) { 
                 e.printStackTrace();
            }
           
        }
    }

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
