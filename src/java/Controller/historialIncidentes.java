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


import Entity.Incidente;

import java.util.List;
import java.util.ArrayList;

import hibernate.HibernateUtilities;
import org.hibernate.HibernateException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;

public class historialIncidentes {
    
    @RequestMapping("historialIncidentes.htm")
    public ModelAndView getViewIncidentes(){
        ModelAndView mav = new ModelAndView("historialIncidentes");
        List<Incidente> incidentes = getAllIncidentes();
        mav.addObject("incidentes",incidentes);
        mav.addObject("command",new Incidente());

        return mav;
    }
     
//    @RequestMapping(value="/buscarIncidente", method=RequestMethod.POST)
//    public ModelAndView buscarIncidente(@ModelAttribute("command") Incidente Incidente){
//        
//        
//    }
    
    private List<Incidente> getAllIncidentes(){
        List<Incidente> incidentes = new ArrayList<>();
        Session session = HibernateUtilities.getSessionFactory().openSession();
        
        try{
            session.beginTransaction();
            
            incidentes = session.createCriteria(Incidente.class).list();
            
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a message while retrieving the Incidentes.\nError message: "+ex.getMessage());
        }
        
       return incidentes;
    }
    
}
