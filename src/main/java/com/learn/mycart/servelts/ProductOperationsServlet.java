/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servelts;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.productDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@MultipartConfig
public class ProductOperationsServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            //   sevlet: add category and add product  
         String op =   request.getParameter("operation");
         if(op.trim().equals("addCategory"))
         {
             //addCategory 
             //fecting category data
            
            String title=request.getParameter("catTitle");
            String description=request.getParameter("catDescription");
            
             Category category =  new Category();
             category.setCategoryTitle(title);
             category.setCategoryDescription(description);
             
             //category database save
             CategoryDao cateoryDao=new CategoryDao(FactoryProvider.getFactory());
             
             int catId = cateoryDao.saveCategory(category);
             //out.println("Category saved !!");
             HttpSession httpSession = request.getSession();
             httpSession.setAttribute("message","Category added successfully !!: "+catId);
             response.sendRedirect("admin.jsp");
             
             return;
         }
         else if(op.trim().equals("addProduct"))
         {
             //addProduct
            String pNmae = request.getParameter("pName");
            String pDesc = request.getParameter("pDesc");
            int pPrice = Integer.parseInt(request.getParameter("pPrice").trim()) ;
            int pDiscount = Integer.parseInt(request.getParameter("pDiscount").trim()) ;
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity").trim()) ;
            int catId = Integer.parseInt(request.getParameter("catId").trim());
            Part part = request.getPart("pPic");

            Product product = new Product();
            
            product.setpName(pNmae);
            product.setpDesc(pDesc);
            product.setpPrice(pPrice);
            product.setpDiscount(pDiscount);
            product.setpQuantity(pQuantity);
            product.setpPhoto(part.getSubmittedFileName());
          
            
            //get category by id
            CategoryDao categoryDao =new CategoryDao(FactoryProvider.getFactory());
            Category category =  categoryDao.getCategoryById(catId);
            product.setCategory(category);
            
            //product save..
             productDao pdao=new productDao(FactoryProvider.getFactory());
             pdao.saveProduct(product);
             out.println("Product save success !!");
             
              HttpSession httpSession = request.getSession();
             httpSession.setAttribute("message","Product is added successfully !!");
             response.sendRedirect("admin.jsp");
             //pic upload
             //find out the path to upload photo
             
            String path = request.getServletContext().getRealPath("img") + File.separator + "Products" + File.separator + part.getSubmittedFileName();
             System.out.println(path);
             
             //uploading code
             try {
                 FileOutputStream fos=new FileOutputStream(path);
             InputStream is=part.getInputStream();
             
             //reading data
             byte[] data=new byte[is.available()];
             is.read(data);
             
             //writing the data
             fos.write(data);
             fos.close();
             } catch (Exception e) {
                 e.printStackTrace();
             }
             
                     
             
            
             
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



