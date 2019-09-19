/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kunal
 */
public class LogiinDao {
 
    public boolean check(String uname,String pass){
         try {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");
        PreparedStatement st=con.prepareStatement("SELECT * FROM `admindetails` WHERE `Username` =? AND `Password`=?");
        
        st.setString(1, uname);
        st.setString(2, pass);
        ResultSet rs=st.executeQuery();
        
        
        if(rs.next())
        {
            return true;
        }
    } catch (ClassNotFoundException ex) {
             
    } catch (SQLException ex) {
           
            ex.printStackTrace();         
    }
    
    
        
        return false; 
        
    
    }
    
    public boolean check1(String uname,String pass,String event){
         try {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");
        PreparedStatement st=con.prepareStatement("SELECT * FROM `organiser` WHERE `Email` =? AND `Password`=? AND `Event`=?");
        
        st.setString(1, uname);
        st.setString(2, pass);
        st.setString(3, event);
        ResultSet rs=st.executeQuery();
        
        
        if(rs.next())
        {
            return true;
        }
    } catch (ClassNotFoundException ex) {
             
    } catch (SQLException ex) {
           
            ex.printStackTrace();         
    }
    
    
        
        return false; 
        
    
    }
    
    public boolean check2(String event,String pass){
         try {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");
        PreparedStatement st=con.prepareStatement("SELECT * FROM `organiser` WHERE `Event` =? AND `Password`=?");
        
        st.setString(1, event);
        st.setString(2, pass);
        ResultSet rs=st.executeQuery();
        
        
        if(rs.next())
        {
            return true;
        }
    } catch (ClassNotFoundException ex) {
             
    } catch (SQLException ex) {
           
            ex.printStackTrace();         
    }
    
    
        
        return false; 
        
    
    }
    
}
    

