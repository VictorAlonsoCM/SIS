/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;
import java.time.LocalDateTime;

/**
 *
 * @author eherd
 */
public class Incidente {
    private int id;
    private double latitud;
    private double longitud;
    private String descripcion;
    private String fechaHora;
    private int operador_id;
    private String vehiculo_id;

    public Incidente(double latitud, double longitud, String descripcion,  int operador_id, String vehiculo_id) {
        this.latitud = latitud;
        this.longitud = longitud;
        this.descripcion = descripcion;
        //this.fechaHora = fechaHora;
        this.operador_id = operador_id;
        this.vehiculo_id = vehiculo_id;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public int getOperador_id() {
        return operador_id;
    }

    public void setOperador_id(int operador_id) {
        this.operador_id = operador_id;
    }

    public String getVehiculo_id() {
        return vehiculo_id;
    }

    public void setVehiculo_id(String vehiculo_id) {
        this.vehiculo_id = vehiculo_id;
    }
    
    
    
}
