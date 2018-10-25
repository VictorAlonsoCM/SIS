/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import Entity.Vehiculo;
import hibernate.HibernateUtilities;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 * @author eherd
 */
public class homeController {
    
    //RequestParam is a workaround to show a modal if the insertion was successful
    @RequestMapping("/home.htm")
    public ModelAndView displayHome(@RequestParam(required=false) boolean success){
        ModelAndView mav = new ModelAndView("home");
        String[] lst = getTypes();
        Vehiculo ve = new Vehiculo();
        mav.addObject("command", ve);
        mav.addObject("types",lst);
        mav.addObject("success",success);

        return mav;
    }
    
    private String[] getTypes(){
        String[] lst = new String[]{"Ambulancia","Policia","Bomberos"};
        return lst;
    }
    
    @RequestMapping(value="/registrarVehiculo.htm", method = RequestMethod.POST)
    public ModelAndView insertVehiculo(@ModelAttribute("command") Vehiculo nuevoVehiculo){
        String url = "redirect:/home.htm?success=";
        
        Vehiculo ve = nuevoVehiculo;
        
        
        
        Session session = HibernateUtilities.getSessionFactory().openSession();
        try{
            session.beginTransaction();
            session.save(ve);
            session.getTransaction().commit();
            session.close();
            url+="true";
        }catch(HibernateException ex){
            System.out.println("There was a problem while inserting Vehiculo. \nProblem Message:"+ex.getMessage());
            url+="false";
        }
        
        ModelAndView mav = new ModelAndView(url);
        return mav;
    }
    
    
   
    
}
