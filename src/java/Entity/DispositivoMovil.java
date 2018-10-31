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
public class DispositivoMovil {
    private String imei;
    private String numeroTelefonico;
    private Vehiculo vehiculo;

    
    
    public DispositivoMovil(){
         
    }

    public DispositivoMovil(String imei, String numeroTelefonico) {
        this.imei = imei;
        this.numeroTelefonico = numeroTelefonico;
    }
    
    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
    
    

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei;
    }

    public String getNumeroTelefonico() {
        return numeroTelefonico;
    }

    public void setNumeroTelefonico(String numeroTelefonico) {
        this.numeroTelefonico = numeroTelefonico;
    }
    
    
}
