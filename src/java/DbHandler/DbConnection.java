/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbHandler;

import Utils.Category;
import Utils.Comments;
import Utils.Constants;
import Utils.UplaodStatus;
import Utils.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
    
    /**
     * Handle Category
     * @return
     * @throws Exception 
     */
    public ArrayList<Category> getCategory() throws Exception{
           Statement statement = null;
        ArrayList<Category> list  = new ArrayList();
           Connection getcon  = getConnection();
      statement =  getcon.createStatement();
       String Sql = "select *from category";
        ResultSet rs =statement.executeQuery(Sql);
        while(rs.next()){
       Category category = new Category();
               category.setId(rs.getInt("id"));
               category.setCategory(rs.getString("category"));
               list.add(category);
        }
        
        return list;
    }
     
    /**
     *  @uplaodStatus 
     * @param post
     * @return
     * @throws Exception 
     */
    public boolean uplaodStatus(UplaodStatus post) throws Exception{
       
        Statement statement = null;
          Connection getcon = getConnection();
             statement = getcon.createStatement();
          String  sql =" insert  into poststatus(title, author, category,Description,userId,role) "+
                  "values('"+post.getTitle()+"','"+post.getAuthor()+"','"+post.getCategory()+"','"+post.getDescription()+"','"+post.getUserId()+"','"+post.getRole()+"')";
          statement.execute(sql);
          getcon.close();
       return true;
    }
    
    
   /**
    *   Read Posts 
    * @return
    * @throws Exception 
    */
    
    public ArrayList<UplaodStatus> readPosts() throws Exception{
          ArrayList<UplaodStatus>  list= new ArrayList();
        Connection con = getConnection();
        Statement statement =  null;
        ResultSet rs = null;
             statement = con.createStatement();
          String  sql ="select *from poststatus";
           rs= statement.executeQuery(sql);
          if(rs!=null){
          while(rs.next()){
              UplaodStatus post = new UplaodStatus();
              post.setId(rs.getInt("id"));
              post.setTitle(rs.getString("title"));
              post.setAuthor(rs.getString("author"));
               post.setTime(rs.getTimestamp("time"));
               post.setCategory(rs.getString("category"));
              post.setDescription(rs.getString("Description"));
               post.setUserId(rs.getInt("userId"));
              post.setRole(rs.getString("role"));
             
             
              list.add(post);
          }
          }
        
        //  rs.close();
          con.close();
          return  list;
    }
    
    public boolean addComments(Comments comments) throws Exception{
        
        Statement statement = null;
          Connection getcon = getConnection();
             statement = getcon.createStatement();
          String  sql =" insert  into comments(comment, userId, userName,postId) "+
                  "values('"+comments.getComment()+"','"+comments.getUserid()+"','"+comments.getUserName()+"','"+comments.getPostId()+"')";
          statement.execute(sql);
          getcon.close();
       return true;
    }
    
    /**
     * read  Comments
     * @return
     * @throws Exception 
     */
    public ArrayList<Comments> readComments(int  postid) throws Exception{
            ArrayList<Comments>  list= new ArrayList();
        Connection con = getConnection();
        Statement statement =  null;
        ResultSet rs = null;
             statement = con.createStatement();
          String  sql ="select *from comments where postId='"+postid+"'";
           rs= statement.executeQuery(sql);
          if(rs!=null){
          while(rs.next()){
              
              Comments comments = new Comments();
              comments.setId(rs.getInt("id"));
              comments.setComment(rs.getString("comment"));
              comments.setPostId(rs.getInt("postId"));
              comments.setUserName(rs.getString("userName"));
              comments.setTime(rs.getTimestamp("time"));
              comments.setUserid(rs.getInt("userId"));
              System.out.println("user Comment"+rs.getString("comment"));
              list.add(comments);
          }
          }
          con.close();
          return  list;
    }
    
    /*
    Delete Comments
    */
    public void deleteComments(int id) throws Exception{

          Statement statement = null;
          Connection getcon = getConnection();
          statement = getcon.createStatement();
          String  sql =" Delete from comments where id='"+id+"' ";
          statement.execute(sql);
          getcon.close();
    }
    
    /*
     Search Posts
    */
    public ArrayList<UplaodStatus> searchPost(String catgName) throws Exception{
          ArrayList<UplaodStatus>  list= new ArrayList();
        Connection con = getConnection();
        Statement statement =  null;
        ResultSet rs = null;
             statement = con.createStatement();
          String  sql ="select *from poststatus where  category= '"+catgName+"'";
           rs= statement.executeQuery(sql);
          if(rs!=null){
          while(rs.next()){
              UplaodStatus post = new UplaodStatus();
              post.setId(rs.getInt("id"));
              post.setTitle(rs.getString("title"));
              post.setAuthor(rs.getString("author"));
               post.setTime(rs.getTimestamp("time"));
               post.setCategory(rs.getString("category"));
              post.setDescription(rs.getString("Description"));
               post.setUserId(rs.getInt("userId"));
              post.setRole(rs.getString("role"));
             
             
              list.add(post);
          }
          }
        
        //  rs.close();
          con.close();
          return  list;
    }
    
    /*
    Update Comments 
    */
    public void updateComments(Comments comment) throws Exception{
        

          Statement statement = null;
          Connection getcon = getConnection();
          statement = getcon.createStatement();
          String  sql =" Update comments  set comment='"+comment.getComment()+"' where id='"+comment.getId()+"' ";
          statement.executeUpdate(sql);
          getcon.close();
    }
    
    /*
    Delete Post
    */
    public void deletePost(int id) throws Exception{

          Statement statement = null;
          Connection getcon = getConnection();
          statement = getcon.createStatement();
          String  sql =" Delete from poststatus where id='"+id+"' ";
          statement.execute(sql);
          getcon.close();
    }
    
}
