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
 */
public class Incidente {
    private int id;
    private double latitud;
    private double longitud;
    private String descripcion;
    private Timestamp fechaHora;
    private int persona_id;
    private Persona persona;

    public Incidente() {
    }

    public Incidente(double latitud, double longitud, String descripcion, Timestamp fechaHora) {
        this.latitud = latitud;
        this.longitud = longitud;
        this.descripcion = descripcion;
        this.fechaHora = fechaHora;
    }
    
    
    
    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    
    public int getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(int persona_id) {
        this.persona_id = persona_id;
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

    public Timestamp getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Timestamp fechaHora) {
        this.fechaHora = fechaHora;
    }


    
    
    
}
