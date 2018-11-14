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
import Entity.Incidente_Vehiculo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import Entity.Vehiculo;
import hibernate.HibernateUtilities;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class registerPageController {
    
    //para renderizar los jsp.
    @RequestMapping("registerPage.htm")
    public ModelAndView goToSecondPage(){
        List<Vehiculo> vehiculos = getWorkingVehicle();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registerPage");
        mav.addObject("vehiculosActivos",vehiculos);
        return mav;
    }
    
    //to return the corresponding data
    @RequestMapping(value="testing.htm", method = RequestMethod.GET)
    public ModelAndView setIncidentData(@RequestParam("niv") String niv){
        ModelAndView mav = new ModelAndView();
        Incidente incidente = lookIncidente(niv);
        List<Vehiculo> vehiculos = getWorkingVehicle();
        mav.setViewName("registerPage");
        mav.addObject("incidente",incidente);
        mav.addObject("vehiculosActivos",vehiculos);
        return mav;
    }
    
    
    
    
    private List<Vehiculo> getWorkingVehicle(){
        List<Vehiculo> vehiculos = new ArrayList<>();
    
        Session session = HibernateUtilities.getSessionFactory().openSession();
    
        try{
            session.beginTransaction();
            //Getting all the availables vehicles, converting the Criteria object in a list.
            vehiculos = session.createCriteria(Vehiculo.class).
                    add(Restrictions.eq("status",false))
                    .addOrder(Order.asc("tipo")).list();
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a problem retreiving the vehicles. \nProblem Message:"+ex.getMessage());
            session.close();
        }
        return vehiculos;
    }
    
    //To look for the incident related to the vehicle
    private Incidente lookIncidente(String niv){
        Incidente incidente = new Incidente();
        
        try{
            Session session = HibernateUtilities.getSessionFactory().openSession();
            session.beginTransaction();
            incidente = (Incidente) session.createCriteria(Incidente_Vehiculo.class)
                    .add(Restrictions.eq("vehiculo_niv", niv))
                    .addOrder(Order.asc("createdAt"))
                    .setMaxResults(1);
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a problem retreiving the vehicles. \nProblem Message:"+ex.getMessage());
        }
        
        return incidente;
    }
    
    
}
