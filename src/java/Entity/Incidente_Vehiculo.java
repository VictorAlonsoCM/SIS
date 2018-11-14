/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;
import java.sql.Timestamp;
/**
 *
 * @author eherd
 * 
 * This class is used to relate incidente and vehiculo
 */
public class Incidente_Vehiculo {
    private int incidente_id;
    private String vehiculo_niv;
    private int id;
    private Timestamp createdAt;

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Incidente_Vehiculo() {
    }

    public int getIncidente_id() {
        return incidente_id;
    }

    public void setIncidente_id(int incidente_id) {
        this.incidente_id = incidente_id;
    }

    public String getVehiculo_niv() {
        return vehiculo_niv;
    }

    public void setVehiculo_niv(String vehiculo_niv) {
        this.vehiculo_niv = vehiculo_niv;
    }
    
    
    
}
