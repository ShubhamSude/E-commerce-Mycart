
package com.learn.mycart.servelts;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.Users;
import com.learn.mycart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;



public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
                
                String email=request.getParameter("email");
                String password=request.getParameter("password");
               
                //validation
                
                
                //authenticating user
                UserDao userDao =   new UserDao(FactoryProvider.getFactory());
                Users users = userDao.getUserByEmailAndPassword(email, password);
                
                //System.err.println(users);
                HttpSession httpSession =   request.getSession();
                
                
                if(users == null)
                {
     
                 httpSession.setAttribute("message", "Invalid Details  !! Try with another one");
                 response.sendRedirect("login.jsp");
                 return;
                }
                else
                {
                 out.println("<h1> Welcome "+users.getUserName()+"</h1>");   
                 //login
                 httpSession.setAttribute("current-user", users);
                 if(users.getUserType().equals("admin")){
                      //Admin: admin.jsp
                     response.sendRedirect("admin.jsp");
                 }
                 else if(users.getUserType().equals("normal"))
                 {
                          //Normal: normal.jsp
                     response.sendRedirect("normal.jsp");
                 }else
                 {
                    out.println("We have not identifed user type"); 
                 }
               
                }
                
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
