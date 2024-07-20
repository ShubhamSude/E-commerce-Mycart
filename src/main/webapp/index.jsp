<%-- 
    Document   : index
    Created on : 01-Jul-2024, 1:01:41 pm
    Author     : shubham
--%>
<%@page import="com.learn.mycart.entities.Users" %>
<%@page import="com.learn.mycart.helper.Helper" %>
<%@page import="com.learn.mycart.entities.Product" %>
<%@page import="com.learn.mycart.dao.productDao" %>
<%@page import="java.util.List" %>
<%@page import="java.util.*" %>
<%@page import="com.learn.mycart.entities.Category" %>
<%@page import="com.learn.mycart.dao.CategoryDao" %>
<%@page import="com.learn.mycart.helper.FactoryProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file="Componets/comman_css_js.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="Componets/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
              <%
                String cat =  request.getParameter("category");
                 // out.println(cat);
                  
                    productDao pDao =new productDao(FactoryProvider.getFactory());
                    List<Product> list=null;
                    
                    if(cat==null)
                    {
                    list=pDao.getAllProducts();
                     }
                    else if(cat.trim().equals("all"))
                    {
                      list=pDao.getAllProducts();
                     }
                     else
                     {
                      int cid = Integer.parseInt(cat.trim());
            
                     list=pDao.getAllProductsById(cid); 
              }
                CategoryDao cDao =new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cDao.getCategories();  
             
                   %>
                   
            <!-- Show categories -->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                    All Products
                        </a>
                   
        
                   <%
                   for(Category category:clist){
                   
                    %>
                    <a href="index.jsp?category=<%= category.getCategoryid()%>" class="list-group-item list-group-item-action"> <%= category.getCategoryTitle()%> </a>
       
                   <%
                    }
                   %>
             
                   </div>
                   
            </div>
            <!-- Show products -->
           <div class="col-md-10">
               <!-- row -->
                    
                     <div class="row mt-4">
                          <!-- traversing products --> 
                             <%
                            for(Product product:list){   
                             %>
                         <div class="col-md-4 mt-2">
                           
                               
                          <!--  products card -->
                          <div class="card product-card">
                             
                              <div class="container text-center">
                                  
                                <img src="img/Products/<%= product.getpPhoto() %>"style="max-height: 200px;
                                   max-width: 100%;width: auto;" class=<"card-img-top m-2" alt="...">
                                  
                              </div>

                              
                           <div class="card-body">
                               <h5 class="card-title">
                                  <%= product.getpName() %> 
                               </h5>  
                               <p class="card-text">
                                   <%= Helper.get10Words(product.getpDesc())%> 
                               </p>                           
                          </div> 
                               
                               <div class="card-footer text-center">
                                   <button class="btn custom-bg text-white" onclick="add_to_cart( <%= product.getpId() %> , '<%= product.getpName() %>', <%= product.getPriceAfterApplyingDiscount() %>)" >Add to Cart</button>
                                   <button class="btn btn-outline-success"> &#x20b9; <%= product.getPriceAfterApplyingDiscount() %>/- <span class="text-secondary discount-label"> &#x20b9; <%= product.getpPrice() %> , <%=product.getpDiscount()%> off </span></button>
                          </div>
                          
                         
                         
                     </div>
                          
                          
                             
                 </div>
                          
                           <%
                              }
                            if(list.size()==0)
                            {
                             out.println("<h3>No items in this category</h3>");
                            }
                          %>
                         
             </div>
       
        </div>
                          
                          
        </div>                     
    </div>
         
                          <%@include file="Componets/comman_modals.jsp" %>         
                          
    </body>
</html>
