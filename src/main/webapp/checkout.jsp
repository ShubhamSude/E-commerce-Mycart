<%-- 
    Document   : checkout
    Created on : 19-Jul-2024, 3:24:02 pm
    Author     : shubham
--%>
<%@page import="com.learn.mycart.entities.Users" %>
<%
Users users = (Users)session.getAttribute("current-user");  
if(users == null)
{ 
      session.setAttribute("message", "You are not logged in !! Login first to access checkout ");
      response.sendRedirect("login.jsp");
    return;

}


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="Componets/comman_css_js.jsp" %>
    </head>
    <body>
         <%@include file="Componets/navbar.jsp" %>
        
         <div class="container">
             <div class="row mt-5">
                 
                 <div class="col-md-6">
                     <!-- card -->
                     <div class="card">
                         <div class="card-body">
                             <h3 class="text-center mb-3">Your selected items</h3>
                           <div class="cart-body">
                             
                         </div>  
                         </div> 
                     </div>
                     
                 </div>
                 <div class="col-md-6">
                       <!-- form details --> 
                       <div class="card">
                         <div class="card-body">
                             <h3 class="text-center mb-3">Your details for order</h3>
                            
                             <form>
                                 
                                 <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" value="<%= users.getUserEmail()%>" class="form-control" placeholder="Enter gmail" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                 
                                 <div class="mb-3">
                                    <label for="name" class="form-label">Your name</label>
                                    <input type="text" value="<%= users.getUserName()%>" class="form-control" placeholder="Enter name" id="name" aria-describedby="emailHelp">
                                   </div>
                                 
                                   <div class="mb-3">
                                    <label for="name" class="form-label">Your Contact</label>
                                    <input type="number" value="<%= users.getUserPhone()%>" class="form-control" placeholder="Enter contact number" id="name" aria-describedby="emailHelp">
                                   </div>
                                   
                                 <div class="form-group">
                                      <label for="floatingTextarea">Your shipping address</label>
                                    <textarea value="<%= users.getUserAddress()%>" class="form-control" placeholder="Enter your address here" id="floatingTextarea"></textarea>
                                  </div>
                                 
                                 <div class="container text-center mt-3">
                                     <button class="btn btn-outline-success">Order Now</button>
                                     <button class="btn btn-outline-primary">Continue Shopping</button>
                                 </div>
                                 
                             </form>
                             
                         </div> 
                     </div>
                 </div>
                 
             </div>
         </div>
        
        <%@include file="Componets/comman_modals.jsp" %>         
    </body>
</html>
