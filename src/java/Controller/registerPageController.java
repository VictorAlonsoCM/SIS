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
import Entity.Incidente_persona_form;
import Entity.Persona;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import Entity.Vehiculo;
import hibernate.HibernateUtilities;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class registerPageController {
    
    //para renderizar los jsp.
    @RequestMapping("registerPage.htm")
    public ModelAndView goToSecondPage(@RequestParam("niv") String niv){
        List<Vehiculo> vehiculos = getWorkingVehicle();
        Incidente currentIncident = lookIncidente(niv);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registerPage");
        mav.addObject("vehiculosActivos",vehiculos);
        mav.addObject("currentIncident",currentIncident);
        mav.addObject("incidenteForm", new Incidente_persona_form());
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
    
    public static Vehiculo getFirstWorkingVehicule(){
        Vehiculo v = getWorkingVehicle().get(0);
        return v;
    }
    
    //Returns a List of vehicles that are currently working
    public static List<Vehiculo> getWorkingVehicle(){
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
        List<Incidente> incidentes = new ArrayList<Incidente>();
        Incidente incidente = new Incidente();
        
        try{
            Session session = HibernateUtilities.getSessionFactory().openSession();
            session.beginTransaction();
            incidentes = session.createCriteria(Incidente_Vehiculo.class)
                    .add(Restrictions.eq("vehiculo_niv", niv))
                    .addOrder(Order.asc("createdAt"))
                    .setMaxResults(1).list();
            if(incidentes.size()>0){
                incidente = incidentes.get(0);
            }
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a problem retreiving the vehicles. \nProblem Message:"+ex.getMessage());
        }
        
        return incidente;
    }
    
    @RequestMapping(value="/registrarIncidente.htm", method=RequestMethod.POST)
    public ModelAndView registerIncident(@ModelAttribute("incidenteForm") Incidente_persona_form form){
        ModelAndView mav = new ModelAndView();
        Vehiculo v = getFirstWorkingVehicule();
        String url = "redirect:/registerPage.htm?niv="+v.getNiv()+"&success=";
        
        Timestamp now = new Timestamp(System.currentTimeMillis());
        Persona p = new Persona(form.getNombre_persona(), form.getEdad_persona(), form.getTelefono_persona());
        Incidente incidente = new Incidente(form.getLatitud(), form.getLongitud(), form.getDescripcion_incidente(), now);
        
        try{
            Session session = HibernateUtilities.getSessionFactory().openSession();
            
            //Inserting person in order to get an id
            session.beginTransaction();
            session.save(p);
            session.getTransaction().commit();
            
            
            //Adding the id of the person to the incident
            session.beginTransaction();
            incidente.setPersona_id(p.getId());
            session.save(incidente);
            session.getTransaction().commit();
            
            url+="0";

        }catch(HibernateException ex){
            System.out.println("There was a problem \nProblem Message:"+ex.getMessage());
            url+="1";
        }
        
        mav.setViewName(url);
        return mav;
    }
    
    
}
