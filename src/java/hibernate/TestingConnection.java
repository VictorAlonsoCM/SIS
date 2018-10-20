/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import Entity.userTest;
import Entity.Persona;

import org.hibernate.Session;
import Entity.Incidente;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


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
        userTest user = new userTest();
        user.setName("Testing1");
        user.setGoal(1000);
        user.setTotal(1);
        
        //Converting LocalDateTime to String
        LocalDateTime dt = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String timestamp = dt.format(dtf);
        
        Incidente inc = new Incidente(10.64,102.5,"Some description", 1, "someNIV");
        Persona per = new Persona("Juan","22","1234567890");
        
        session.save(per);
        
        
        
        //sql insert
        //session.save(user);
        
        session.getTransaction().commit();
        
        
        
        
        
        
        session.close();
        HibernateUtilities.getSessionFactory().close();
        System.out.println("Session closed");
        
    }
    
}
