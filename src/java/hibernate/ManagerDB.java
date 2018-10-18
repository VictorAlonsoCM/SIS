/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author eherd
 */
public class ManagerDB {
    public DriverManagerDataSource GetDataSourceOfConnection(){
        DriverManagerDataSource dataSourceOfConection= new DriverManagerDataSource();
        dataSourceOfConection.setDriverClassName("org.postgresql.Driver");
        dataSourceOfConection.setUrl("jdbc:postgresql://localhost:49267/semaforos");
        dataSourceOfConection.setUsername("postgres");
        dataSourceOfConection.setPassword("root");//admin
        return dataSourceOfConection;
    }
    
}
