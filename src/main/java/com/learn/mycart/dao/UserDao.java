
package com.learn.mycart.dao;

import com.learn.mycart.entities.Users;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Query;

public class UserDao {
  private SessionFactory factory;  

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
   
    //get user by email and password
    public Users getUserByEmailAndPassword(String email,String password)
    {
       Users users=null;
       
        try {
            
          String query ="from Users where userEmail =:e and userPassword =:p";  
          Session session =  this.factory.openSession();
                Query q=session.createQuery(query);
                q.setParameter("e", email);
                q.setParameter("p", password);
                
               users =(Users)q.uniqueResult();
         
             session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
       
       return users;
    }
    
    
}
