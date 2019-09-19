/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addorg;

import com.addpart.participant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Kunal
 */
public class add_org {  
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
    
    public static int save(organiser e){  
        int status=0;  
        try{  
            Connection con=add_org.getConnection();  
            PreparedStatement ps=con.prepareStatement("INSERT INTO `organiser`(`Name`, `Mobile`, `Email`, `Event`,`Password`) VALUES (?,?,?,?,?)");  
            ps.setString(1,e.getName());  
            ps.setString(2,e.getMobile());  
            ps.setString(3,e.getEmail());  
            ps.setString(4,e.getEvent());
            ps.setString(5, e.getPassword());
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  

  

   
    
}


