
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
         <%@include file="Componets/comman_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Componets/navbar.jsp" %>
        <div class="container-fluid">
            
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
       
                <div class="card">
                    
                     <%@include file="Componets/message.jsp" %>
                    
                    <div class="card-body">
                        <h3 class="text-center my-3">SignUp Here !!</h3> 
                        <form action="RegisterSevlets" method="post">
                  <div class="mb-3">
                    <label for="name" class="form-label">User Name</label>
                    <input name="user_name" type="text" class="form-control" placeholder="Enter here" id="name" aria-describedby="emailHelp">
                  </div> 
                  <div class="mb-3">
                    <label for="email" class="form-label">User Email</label>
                    <input name="user_email" type="email" class="form-control" placeholder="Enter here" id="email" aria-describedby="emailHelp">
                  </div> 
                  <div class="mb-3">
                    <label for="password" class="form-label">User Password</label>
                    <input name="user_password" type="password" class="form-control" placeholder="Enter here" id="password" aria-describedby="emailHelp">
                  </div> 
                  <div class="mb-3">
                    <label for="phone" class="form-label">User Phone</label>
                    <input name="user_phone" type="number" class="form-control" placeholder="Enter here" id="phone" aria-describedby="emailHelp">
                  </div> 
                  <div class="mb-3">
                    <label for="user_types" class="form-label">Types of register:admin or normal</label>
                    <input name="user_types" type="text" class="form-control" placeholder="Enter here if you are admin or normal" id="user_types" aria-describedby="emailHelp">
                  </div> 
                  
                  <div class="mb-3">
                    <label for="phone" class="form-label">User Address</label>
                    <textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter here address"></textarea>
                  </div> 
                 
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button> 
                        <button class="btn btn-outline-warning">Reset</button> 
                    </div>                     
                </form>
                        
                    </div>
                </div>
            </div>
        </div>
            
        </div>
    </body>
</html>
