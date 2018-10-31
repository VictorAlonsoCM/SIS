/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;


import org.hibernate.Session;
import Entity.Vehiculo;
import java.util.List;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author eherd
 */
public class TestingConnection {
    public static void main(String args[]){
        System.out.println("Hello world");
        Session session = HibernateUtilities.getSessionFactory().openSession();
        
        
        session.beginTransaction();
        //Code we will execute to CRUD
//        Incidente inc = new Incidente();
//        inc.setDescripcion("coche llamas");
//        inc.setLatitud(12.78);
//        inc.setLongitud(123.52);
//        inc.getPersona().setNombre("reportador");
//        inc.getPersona().setEdad("22");
//        inc.getPersona().setTelefono("4129012");

//        Vehiculo ve = new Vehiculo();
//        ve.setNiv("4");
//        ve.setTipo("Policia");
//        ve.setSeriegps("calandoesto");
//        ve.setStatus(Boolean.TRUE);
//        ve.getDispositivoMovil().setImei("insvehi4");
//        ve.getDispositivoMovil().setNumeroTelefonico("1111111111");
        
        
//        Vehiculo v2 = (Vehiculo) session.load(Vehiculo.class, "testingRelationship111");
//        System.out.println("Vehiculo recuperado:"+ v2.getNiv());
//        System.out.println("Vehiculo recuperado:"+ v2.getDispositivoMovil().getImei());
//        System.out.println("Vehiculo recuperado:"+ v2.getDispositivoMovil().getNumeroTelefonico());
        
        //session.save(ve);
        
        //sql insert
        //session.save(user);
        session.getTransaction().commit();
        
        
        
        session.close();
        HibernateUtilities.getSessionFactory().close();
        System.out.println("Session closed");
        
    }
    
}
