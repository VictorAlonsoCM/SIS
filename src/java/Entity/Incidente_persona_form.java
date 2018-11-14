/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author eherd
 */
public class Incidente_persona_form {
    private String nombre_persona;
    private String telefono_persona;
    private String edad_persona;
    private String descripcion_incidente;
    private double longitud;
    private double latitud;
    
    public Incidente_persona_form(){
        
    }

    public String getNombre_persona() {
        return nombre_persona;
    }

    public void setNombre_persona(String nombre_persona) {
        this.nombre_persona = nombre_persona;
    }

    public String getTelefono_persona() {
        return telefono_persona;
    }

    public void setTelefono_persona(String telefono_persona) {
        this.telefono_persona = telefono_persona;
    }

    public String getEdad_persona() {
        return edad_persona;
    }

    public void setEdad_persona(String edad_persona) {
        this.edad_persona = edad_persona;
    }

    public String getDescripcion_incidente() {
        return descripcion_incidente;
    }

    public void setDescripcion_incidente(String descripcion_incidente) {
        this.descripcion_incidente = descripcion_incidente;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    
    
    
    
    
}
