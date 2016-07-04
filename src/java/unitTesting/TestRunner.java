/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unitTesting;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

/**
 *
 * @author mac
 */
public class TestRunner {
    public static void main(String[] args){
      
        Result result = JUnitCore.runClasses(TestCases.class);
        for(Failure failure: result.getFailures()){           
        System.out.println(failure.toString());   // if Failure then show Result
        }
        System.out.println(result.wasSuccessful());
    }    
}
