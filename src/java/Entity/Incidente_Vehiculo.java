/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author eherd
 * 
 * This class is used to relate incidente and vehiculo
 */
public class Incidente_Vehiculo {
    private int incidente_id;
    private int vehiculo_niv;

    public Incidente_Vehiculo() {
    }

    public int getIncidente_id() {
        return incidente_id;
    }

    public void setIncidente_id(int incidente_id) {
        this.incidente_id = incidente_id;
    }

    public int getVehiculo_niv() {
        return vehiculo_niv;
    }

    public void setVehiculo_niv(int vehiculo_niv) {
        this.vehiculo_niv = vehiculo_niv;
    }
    
    
    
}
