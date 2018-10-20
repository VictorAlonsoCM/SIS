/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;



/**
 *
 * @author eherd
 */
public class HibernateUtilities {
    private static SessionFactory sessionFactory;
    private static ServiceRegistry serviceRegistry;
    
    static{
        try{
            //Get the configuration from the hibernate.cfg.xml file. Since we can't have the hibernate.cfg.xml
            //file in our Source packages(due we need a packages) we can put this file inside a package
            //and set the path in the configure method as we see below.
            Configuration configuration = new Configuration().configure("/hibernate/hibernate.cfg.xml");
            serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        }
        catch(HibernateException exception){
            System.out.println("Problem creating session factory!");
            throw new HibernateException(exception);
        }
    }
    
    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }
}
