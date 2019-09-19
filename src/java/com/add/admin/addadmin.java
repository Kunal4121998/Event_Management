/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.add.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Kunal
 */
public class addadmin {
    
    
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
    
    public static int save1(admin a){  
        int status=0;  
        try{  
            Connection con=addadmin.getConnection();  
            PreparedStatement ps=con.prepareStatement("INSERT INTO `admindetails`(`Username`, `Password`) VALUES (?,?)");  
            ps.setString(1,a.getUsername());
            ps.setString(2,a.getPassword());
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    
}
