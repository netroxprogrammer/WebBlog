/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbHandler;

import Utils.Constants;
import Utils.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author mac
 */
public class DbConnection {
    /*
    Make Connection
    */
    public Connection  getConnection() throws Exception{
     
        
       Class.forName("com.mysql.jdbc.Driver");
        Connection  conn  =   DriverManager.getConnection(Constants.dbUrl, Constants.dbName, Constants.dbPass);
   
          System.out.println(conn);
        return conn;
    }
    /**
     *   Login user
     * @param email
     * @param password  
     * @return
     * @throws Exception 
     */
    public Users loginUser(String email, String password) throws Exception{
       Users user = new Users();
       Connection con = getConnection();
        Statement statement =  null;
        ResultSet rs = null;
        String sql = "select *from users where email='"+email+"' AND password='"+password+"'";
        
        statement =  con.createStatement();
        rs = statement.executeQuery(sql);
        if(rs!=null){
         if(rs.next()){
             user.setUserId(rs.getInt("id"));
             user.setUserEmail(rs.getString("email"));
             user.setUserName(rs.getString("userName"));
             user.setRole(rs.getString("role"));
         }
        }
         return  user;
    
    }
    
    public boolean signUp(Users user) throws  Exception{
          Statement statement = null;
          Connection getcon = getConnection();
             statement = getcon.createStatement();
          String  sql =" insert  into users(userName, email, password,role) values('"+user.getUserName()+"','"+user.getUserEmail()+"','"+user.getUserPassword()+"','user')";
          statement.execute(sql);
          getcon.close();
       return true;
    }
    /*
    Check  Email Already Exist Or  Not
    */
    public boolean checkEmail(String email) throws Exception{
        Statement statement = null;
       Connection getcon  = getConnection();
      statement =  getcon.createStatement();
       String Sql = "select *from users where email = '"+email+"'";
        ResultSet rs =statement.executeQuery(Sql);
        if(rs.next()){
           // if(rs.getString("email").equals(email)){
                return true;
           // }
        }
        return  false;
    }
}
