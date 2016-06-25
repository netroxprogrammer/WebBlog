/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DbHandler.DbConnection;
import Utils.UplaodStatus;
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
public class PostStatus extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         DbConnection db = new DbConnection();
       String title = request.getParameter("title");
        String des = request.getParameter("des");
        String category = request.getParameter("category");
        HttpSession session = request.getSession(true);
      String name=  (String)session.getAttribute("name");
       
      String role= (String)session.getAttribute("role");
      int id= (Integer)session.getAttribute("id");
      UplaodStatus uplaod = new UplaodStatus();
       uplaod.setAuthor(name);
       uplaod.setCategory(category);
       uplaod.setDescription(des);
       uplaod.setRole(role);
       uplaod.setTitle(title);
       uplaod.setUserId(id);
    try{
       if(db.uplaodStatus(uplaod)){
           response.sendRedirect("uplaodPost.jsp?message=post successfully  update");
       }
    }
    catch(Exception e){
        e.printStackTrace();
    }
                      
    }
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        
    }

 
}
