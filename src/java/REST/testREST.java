/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package REST;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import hibernate.HibernateUtilities;

import Entity.Vehiculo;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Session;

@RestController
public class testREST {
    
    @RequestMapping(value="/api/vehicle", method= RequestMethod.GET)
    public ResponseEntity<List<Vehiculo>> listAllVehicles(){
        
        List<Vehiculo> vehicles= new ArrayList<Vehiculo>();
        
        Session session = HibernateUtilities.getSessionFactory().openSession();
        
        try{
            
            session.beginTransaction();
            vehicles = session.createCriteria(Vehiculo.class).list();
            session.getTransaction().commit();
            session.close();
        }catch(HibernateException ex){
            System.out.println("There was a problem while inserting Vehiculo and telefono. \nProblem Message:"+ex.getMessage());
            
        }
        
        return new ResponseEntity<List<Vehiculo>>(vehicles, HttpStatus.OK);
        
    }
}
