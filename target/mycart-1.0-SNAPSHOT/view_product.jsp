<%-- 
    Document   : view_product
    Created on : 20-Jul-2024, 1:47:33 pm
    Author     : shubham
--%>

<%@page import="com.learn.mycart.entities.Users" %>


<%
  Users users = (Users)session.getAttribute("current-user");  
if(users == null)
{ 
      session.setAttribute("message", "You are not logged in !! Login first ");
      response.sendRedirect("login.jsp");
    return;

}else
{
if(users.getUserType().equals("normal"))
{
      session.setAttribute("message", "You are not admin !! Do not access this page ");
      response.sendRedirect("login.jsp");
    
   return;
}
}

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel-product page</title>
         <%@include file="Componets/comman_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Componets/navbar.jsp" %>
        <h1>Hello World!</h1>
        
        
        <%@include file="Componets/comman_modals.jsp" %> 
    </body>
</html>
