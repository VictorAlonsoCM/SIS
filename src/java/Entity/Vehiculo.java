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
public class Vehiculo {
    private String niv;
    private String tipo;
    private String placa;
    private String seriegps;
    private boolean status;
    private String dispositivoMovil_imei;
    //private DispositivoMovil dispositivoMovil;

    public String getDispositivoMovil_imei() {
        return dispositivoMovil_imei;
    }

    public void setDispositivoMovil_imei(String dispositivoMovil_imei) {
        this.dispositivoMovil_imei = dispositivoMovil_imei;
    }
    
    
    public Vehiculo(){
        //setDispositivoMovil(new DispositivoMovil());
    }
    
    public Vehiculo(String niv, String tipo, String seriegps, Boolean status) {
        this.niv = niv;
        this.tipo = tipo;
        this.seriegps = seriegps;
        this.status = status;
    }

//    public DispositivoMovil getDispositivoMovil() {
//        return dispositivoMovil;
//    }
//
//    public void setDispositivoMovil(DispositivoMovil dispositivoMovil) {
//        this.dispositivoMovil = dispositivoMovil;
//        dispositivoMovil.setVehiculo(this);
//    }

    
    
    public String getNiv() {
        return niv;
    }

    public void setNiv(String niv) {
        this.niv = niv;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getSeriegps() {
        return seriegps;
    }

    public void setSeriegps(String seriegps) {
        this.seriegps = seriegps;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
}
