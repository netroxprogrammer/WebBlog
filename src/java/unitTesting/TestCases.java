/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unitTesting;

import DbHandler.DbConnection;
import static org.junit.Assert.assertEquals;
import org.junit.Test;

/**
 *
 * @author mac
 */
public class TestCases {
    
     DbConnection db =new DbConnection();
     /**
      *  This Test Case Test Login checking
      * @throws Exception 
      */
    @Test
    public void TestLogin() throws  Exception{
        boolean check = db.LoginTestCase("saif@gmail.com", "12345");
        assertEquals(true, check);
       
    }
    /**
     * This Test Case Test SignUp Means Check Email Already Exist or Not
     * @throws Exception 
     */
    @Test
    public void TestSignUp() throws Exception{
        boolean check  = db.checkEmail("saif@gmail.com");
        assertEquals(true, check);
    }
    /**
     *  @This Test Case  Test EmailVaificatiion (Email Pattern) 
     */
    
    @Test 
    public  void  TestEmailVarification(){
    
       String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\"+
      "@([\\w]+\\.)+[\\w]+[\\w]$";
      String email1 = "saif@gmail.com";
      Boolean b = email1.matches(EMAIL_REGEX);
      assertEquals(true,b);
    }
}
