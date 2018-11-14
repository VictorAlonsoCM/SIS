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
public class Incidente_Operador {
    private int incidente_id;
    private int operador_id;
    private int id;
    private Timestamp createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    
    
    public Incidente_Operador() {
    }

    public int getIncidente_id() {
        return incidente_id;
    }

    public void setIncidente_id(int incidente_id) {
        this.incidente_id = incidente_id;
    }

    public int getOperador_id() {
        return operador_id;
    }

    public void setOperador_id(int operador_id) {
        this.operador_id = operador_id;
    }
    
    
    
    
}
