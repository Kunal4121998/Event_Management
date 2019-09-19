/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addpart;

import com.addpart.participant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kunal
 */
public class addparticipant {  
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
    
    public static int save(participant e){  
        int status=0;  
        try{  
            Connection con=addparticipant.getConnection();  
            PreparedStatement ps=con.prepareStatement("INSERT INTO `participant`(`Name`, `Mobile`, `Email`, `Event`,`Username`, `Amount Paid`, `Amount Due`, `College Name`, `M.O.P`,`Receiver`, `Team Members`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");  
            ps.setString(1,e.getName());  
            ps.setString(2,e.getMobile());  
            ps.setString(3,e.getEmail());  
            ps.setString(4,e.getEvent()); 
            ps.setString(5,e.getUsername());  
            ps.setString(6,e.getPaid());  
            ps.setString(7,e.getDue());  
            ps.setString(8,e.getCollege()); 
            ps.setString(9,e.getPayment());  
            ps.setString(10,e.getReceiver());  
            ps.setString(11,e.getTeammembers());  
           
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }
    
    
    

   public static int update(participant e){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("update register set name=?,password=?,email=?,sex=?,country=? where id=?");  
        ps.setString(1,e.getName());  
        ps.setString(2,e.getMobile());  
        ps.setString(3,e.getEmail());  
        ps.setString(4,e.getEvent());  
        status=ps.executeUpdate();  
    }catch(Exception ex){System.out.println(e);}  
    return status;  
}  
   
   
public static int delete(participant e){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from register where id=?");  
        ps.setString(1,e.getName());  
        status=ps.executeUpdate();  
    }catch(Exception ex){System.out.println(e);}  
  
    return status;  
}  
public static List<participant> getAllRecords(){  
    List<participant> list=new ArrayList<participant>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from register");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            participant u=new participant();
            u.setId(rs.getInt("Id"));
            u.setName(rs.getString("Name"));  
            u.setMobile(rs.getString("Mobile"));  
            u.setEmail(rs.getString("Email"));  
            u.setEvent(rs.getString("Event"));  
            list.add(u);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  
public static participant getRecordById(int id){  
    participant u=null;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from register where id=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new participant();  
            u.setId(rs.getInt("Id"));  
            u.setName(rs.getString("Name"));  
            u.setMobile(rs.getString("Mobile"));  
            u.setEmail(rs.getString("Email"));  
            u.setEvent(rs.getString("Event"));  
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
}  
}  
    


