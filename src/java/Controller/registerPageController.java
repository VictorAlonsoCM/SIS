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

public class registerPageController {
    
    //para renderizar los jsp.
    @RequestMapping("registerPage.htm")
    public ModelAndView goToSecondPage(){
        List<Vehiculo> vehiculos = getAvailableVehicle();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registerPage");
        mav.addObject("vehiculosActivos",vehiculos);
        return mav;
    }
    
    private List<Vehiculo> getAvailableVehicle(){
        List<Vehiculo> vehiculos = new ArrayList<>();
        
        Session session = HibernateUtilities.getSessionFactory().openSession();
        
        try{
            session.beginTransaction();
            //Getting all the availables vehicles, converting the Criteria object in a list.
            vehiculos = session.createCriteria(Vehiculo.class).
                    add(Restrictions.eq("status",true))
                    .addOrder(Order.asc("tipo")).list();
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a problem retreiving the vehicles. \nProblem Message:"+ex.getMessage());
            session.close();
        }
        return vehiculos;
    }
    
    
}
