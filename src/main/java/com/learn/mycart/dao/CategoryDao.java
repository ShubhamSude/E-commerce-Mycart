
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import com.learn.mycart.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;

public class CategoryDao {
  private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    //saves the category to database
    public int saveCategory(Category cat)
    {
        
    Session session = this.factory.openSession();
        Transaction tx=session.beginTransaction();
     int catId = (int) session.save(cat);
        
        tx.commit();
    
    session.close();
        return catId;
    }
    
    public List<Category> getCategories()
    {
      Session session =this.factory.openSession();
        Query query=session.createQuery("from Category");
        List<Category> list = query.list();
        
        return list;
    }
    
   public Category getCategoryById(int catid)
    {
     Category cat = null;
        try {
            Session session = this.factory.openSession();
        cat =(Category) session.get(Category.class,catid);
            
         session.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return cat;
    }
    

}
