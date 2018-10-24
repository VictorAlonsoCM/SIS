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
    private Boolean status;
    private String dispositivomovil_id;
    
    public Vehiculo(){
    }
    
    public Vehiculo(String niv, String tipo, String seriegps, Boolean status) {
        this.niv = niv;
        this.tipo = tipo;
        this.seriegps = seriegps;
        this.status = status;
    }

    public String getDispositivomovil_id() {
        return dispositivomovil_id;
    }

    public void setDispositivomovil_id(String dispositivomovil_id) {
        this.dispositivomovil_id = dispositivomovil_id;
    }
    
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
}
