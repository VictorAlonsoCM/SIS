/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.DispositivoMovil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import Entity.Vehiculo;
import Entity.Vehiculo_DispositivoMovil;
import hibernate.HibernateUtilities;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 * @author eherd
 */
@Controller
public class homeController {
    
    //RequestParam is a workaround to show a modal if the insertion was successful
    @RequestMapping("/home.htm")
    public ModelAndView displayHome(@RequestParam(required=false) Integer success){
        ModelAndView mav = new ModelAndView("home");
        String[] lst = getTypes();
        Vehiculo ve = new Vehiculo();
        Vehiculo_DispositivoMovil rel = new Vehiculo_DispositivoMovil();
        List<String> imeis = getAvailableNIV();
        mav.addObject("command", ve);
        mav.addObject("types",lst);
        mav.addObject("success",success);
        mav.addObject("relacion",rel);
            mav.addObject("avImeis",imeis);

        return mav;
    }
    
    private String[] getTypes(){
        String[] lst = new String[]{"Ambulancia","Policia","Bomberos"};
        return lst;
    }
    
    private List<String> getAvailableNIV(){
        List<String> nivs =new ArrayList<>();

        Session session = HibernateUtilities.getSessionFactory().openSession();
        
        try{
            session.beginTransaction();
            //Getting all the availables vehicles, converting the Criteria object in a list.
            nivs = session.createCriteria(Vehiculo.class)
                    .setProjection(Projections.projectionList()
                            .add(Projections.property("niv"),"niv"))
                    .add(Restrictions.isNull("dispositivoMovil_imei")).list();
                    
            
            session.getTransaction().commit();
            session.close();
            
        }catch(HibernateException ex){
            System.out.println("There was a problem retreiving the imeis. \nProblem Message:"+ex.getMessage());
            session.close();
        }
        return nivs;
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
            url+="0";
        }catch(HibernateException ex){
            System.out.println("There was a problem while inserting Vehiculo. \nProblem Message:"+ex.getMessage());
            url+="1";
        }
        
        ModelAndView mav = new ModelAndView(url);
        return mav;
    }
    
    @RequestMapping(value="/relacionarVehCel.htm", method=RequestMethod.POST)
    public ModelAndView relacionarVehiculoCel(@ModelAttribute("relacion") Vehiculo_DispositivoMovil relacion ){
        String url = "redirect:/home.htm?success=";
        Vehiculo ve = new Vehiculo();
        DispositivoMovil dm;
        
        Session session = HibernateUtilities.getSessionFactory().openSession();
        try{
            
            session.beginTransaction();
            ve = (Vehiculo) session.load(Vehiculo.class, relacion.getVehiculo_niv());
            session.getTransaction().commit();
            
            ve.setDispositivoMovil_imei(relacion.getDispositivoMovil_imei());
            dm = new DispositivoMovil(relacion.getDispositivoMovil_imei() , relacion.getNumeroTelefonico());
            
            session.beginTransaction();
            
            session.update(ve);
            session.save(dm);
            
            session.getTransaction().commit();
            
            
            
            session.close();
            url+="0";
        }catch(HibernateException ex){
            System.out.println("There was a problem while inserting Vehiculo and telefono. \nProblem Message:"+ex.getMessage());
            url+="1";
        }
        
        ModelAndView mav = new ModelAndView(url);
        return mav;
    }
    
    
   
    
}
