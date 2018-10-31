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
public class Vehiculo_DispositivoMovil {
    private String vehiculo_niv;
    private String dispositivoMovil_imei;
    private String numeroTelefonico;

    public String getNumeroTelefonico() {
        return numeroTelefonico;
    }

    public void setNumeroTelefonico(String numeroTelefonico) {
        this.numeroTelefonico = numeroTelefonico;
    }
    
    public Vehiculo_DispositivoMovil(){
        
    }

    public String getVehiculo_niv() {
        return vehiculo_niv;
    }

    public void setVehiculo_niv(String vehiculo_niv) {
        this.vehiculo_niv = vehiculo_niv;
    }

    public String getDispositivoMovil_imei() {
        return dispositivoMovil_imei;
    }

    public void setDispositivoMovil_imei(String dispositivoMovil_imei) {
        this.dispositivoMovil_imei = dispositivoMovil_imei;
    }
    
    
    
}
