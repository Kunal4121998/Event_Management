/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.adddao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Kunal
 */
public class AddDao {
    
    
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");  
        }catch(Exception e)
        {
            System.out.println(e);
        }  
        return con;  
    }  
    
    public static int save(part e){  
        int status=0;  
        try{  
            Connection con=AddDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("INSERT INTO `event2`(`Event Name`, `Event Type`, `Event Head`, `Event Venue`, `Event Time`) VALUES (?,?,?,?,?)");  
            ps.setString(1,e.getEvname());  
            ps.setString(2,e.getEvtype());  
            ps.setString(3,e.getEvhead());  
            ps.setString(4,e.getEvvenue());  
            ps.setString(5,e.getEvtime()); 
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    
}
