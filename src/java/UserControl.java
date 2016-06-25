/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DbHandler.DbConnection;
import Utils.UplaodStatus;
import Utils.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author mac
 */
public class UserControl extends HttpServlet {
    DbConnection dbcon = null;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
        dbcon = new DbConnection();
        try{
            
        
        //  check request from login page
        if(request.getParameter("check").equalsIgnoreCase("login")){
        String name = request.getParameter("email");
        String  pass = request.getParameter("password");
              
         if(checkLogin(name,pass,request)){
             //  session.setAttribute("login", );
               response.sendRedirect("index.jsp");
               
         }
         else{
             response.sendRedirect("error.jsp");
         }
       
        }  // end Login Request
        
           if(request.getParameter("check").equalsIgnoreCase("signup")){
                String name = request.getParameter("userName");
                String email = request.getParameter("email");
               String  pass = request.getParameter("password");
                 //  check email already Exist 
          if(!dbcon.checkEmail(email)){     
              Users user =  new Users();
              user.setUserName(name);
              user.setUserEmail(email);
              user.setUserPassword(pass);
              boolean check = dbcon.signUp(user);
              if(check){    // check user singUp or not
                  response.sendRedirect("login.jsp?msg=Please Login");
              }
              else{
              response.sendRedirect("signup.jsp?msg=Sorry Error Found");
              }
              
          }else{
              response.sendRedirect("signup.jsp?msg=email already  exist");
          }
          
          
           }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public boolean checkLogin(String  name, String pass,HttpServletRequest request){
         try{
           Users user = dbcon.loginUser(name, pass);
         
           if(user.getUserEmail()!=null && user.getUserName()!=null){
               System.out.println("User Found");
               HttpSession  session = request.getSession(true);
               session.setAttribute("login", new String("true"));
              session.setAttribute("name",  user.getUserName());
              session.setAttribute("id",  user.getUserId());
               return true; 
    
           }
           else{
               System.out.println("User Not Found");
           }
        //System.out.println(name);
        }
        catch(Exception e){
            e.printStackTrace();
        }
         return false;
    }
   

}
