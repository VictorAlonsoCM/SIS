/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author eherd
 */


import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;

public class secondPageController {
    
    //para renderizar los jsp.
    @RequestMapping("testSecondPage.htm")
    public ModelAndView goToSecondPage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("testSecondPage");
        return mav;
    }
    
}
