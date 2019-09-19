/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.table;

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
public class ParDao {
          
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("");
            con=DriverManager.getConnection("", "root", "");
        }catch(Exception ex){}
        return con;
    }
    
    
    public static List<par>getRecords(int start,int total){
      List<par> list=new ArrayList<par>();
      try{
      Connection con =getConnection();
      PreparedStatement ps=con.prepareStatement("select * from participant limit"+(start-1)+","+total);
      ResultSet rs=ps.executeQuery();
      while(rs.next())
      {
          par p=new par();
          p.setId(rs.getInt(1));
          p.setName(rs.getString(2));
          p.setEmail(rs.getString(3));
          p.setEmail(rs.getString(4));
          p.setEvent(rs.getString(5));
          
          list.add(p);
      }}catch(Exception e){}
      
      return list;
    }
}
