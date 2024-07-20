<%@page import="com.learn.mycart.entities.Users" %>
<%@page import="com.learn.mycart.entities.Category" %>
<%@page import="com.learn.mycart.dao.CategoryDao" %>
<%@page import="com.learn.mycart.helper.FactoryProvider" %>
<%@page import="com.learn.mycart.helper.Helper" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>

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

      <%
                CategoryDao categoryDao =new CategoryDao(FactoryProvider.getFactory());
                List<Category> list=categoryDao.getCategories();  
       //getting count
          Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
      
      %>  
             
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
         <%@include file="Componets/comman_css_js.jsp" %>
    </head>
    <body>
         <%@include file="Componets/navbar.jsp" %>
     
         <div class="container admin">
             
             <div class="container-fluid mt-3">
                 
             <%@include file="Componets/message.jsp" %> 
             
             </div>
             
              <!-- //first row -->
             <div class="row mt-3">
                 
                 <!-- //first col -->
                 <div class="col-md-4"data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="Number of users in this website">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon"/>
                             </div>
                             
                             <h1> <%= m.get("userCount")%> </h1>
                             <h1 class="text-uppercase text-muted">Users</h1>  
                             
                         </div>
                     </div> 
                     
                  </div
                  
                  <!-- //second col -->
                      
                <div class="col-md-4" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Total categories">
                     <div class="card">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon"/>
                             </div>
                             
                               <h1><%= list.size() %></h1> 
                             <h1 class="text-uppercase text-muted">category</h1>  
                             
                         </div>
                     </div>
                      
                </div>
                     
                     <!-- //third col -->    
                  <div class="col-md-4" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Total number of products">
                      
                     <div class="card">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/Product.png" alt="user_icon"/>
                             </div>
                             
                             <h1> <%= m.get("ProductCount")%> </h1>
                             <h1 class="text-uppercase text-muted">Product</h1>  
                             
                         </div>
                     </div>
                      
                  </div>
                     
                 
             </div>
             
             
            <!-- //second row -->
             <div class="row mt-3">
                
                 <div class="col-md-6">
                 
                     <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon"/>
                             </div>
                             
                             <p>Click here to add new category</p>
                             <h1 class="text-uppercase text-muted">Add Category</h1>  
                             
                         </div>
                     </div>
                     
             </div>
                 
                 <div class="col-md-6">
                     
                     <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                             </div>
                             
                              <p>Click here to add new Product</p>
                             <h1 class="text-uppercase text-muted">Add Product</h1>  
                             
                         </div>
                     </div>
                 
             </div>
                 
             </div>
            
            <!--view product row-->
            <div onclick="window.location='view_product.jsp'" class="row mt-3" data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="Click here to view all the product">
                
                <div class="col-md-12">
                     
                     <div class="card">
                         <div class="card-body text-center">
                             
                             <div class="container">
                                 <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/view.png" alt="user_icon"/>
                             </div>
                             
                              <p>Click here to view all the products</p>
                             <h1 class="text-uppercase text-muted">View Product</h1>  
                             
                         </div>
                     </div>
                 
             
                
            </div>
              
         </div>
              
              <!-- add category modal -->
              
              <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
          <form action="ProductOperationsServlet" method="post">
             
              <input type="hidden" name="operation" value="addCategory">
              
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />
              </div>
              
               <div class="form-group mt-3">
                   <textarea style="height: 300px" class="form-control"  placeholder="Enter Cateogry Description"  name="catDescription" required ></textarea>
              </div>
              
              <div class="container text-center mt-3">
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
              
          </form>
           
      </div>
    </div>
  </div>
</div>
              
              <!-- End add category modal -->
              <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
              <!-- start add category modal -->
              
            
<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Product Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <!-- form -->
          
          <form action="ProductOperationsServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addProduct" />
              
              <!-- product tile -->
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />   
              </div>
            <!-- product description -->
            <div class="form-group mt-3">
                <textarea style="height:150px " class="form-control" placeholder="Enter product description" name="pDesc" required ></textarea>
            </div>
             <!-- product price -->
            <div class="form-group mt-3">
              <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />    
            </div>
             <!-- product discount -->
            <div class="form-group mt-3">
              <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />    
            </div>
             <!-- product quantity -->
            <div class="form-group mt-3">
              <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required />    
            </div>
             
             <!-- product category -->
     
            <div class="form-group mt-3">
                <select class="form-control" name="catId" id="">
                    <%
                    for(Category c:list)
                    {
                    %>
                    <option value=" <%= c.getCategoryid() %> "> <%= c.getCategoryTitle() %> </option>
                    <%
                     }
                    %>
                
                </select>
            </div>
             
                 <!-- product file -->
                 <div class="form-group mt-3">
                     <label for="pPic">Select picture of product</label>
                     <input type="file" id="pPic" name="pPic" required />
                </div>
                 <!-- product button -->
                 <div class="container text-center mt-3">
                      <button class="btn btn-outline-success">Add product</button>
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 </div>
                           
          </form>
          <!-- end form -->               
      </div>
      
    </div>
  </div>
</div>
              
              <!-- End add category modal -->
            <%@include file="Componets/comman_modals.jsp" %> 
           
               <script>                
                const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
                const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
                </script>
                
    </body>
</html>
