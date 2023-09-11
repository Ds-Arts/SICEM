package model;

import java.time.LocalDate;

public class PrestamosVo {
    private int uaurioFk;
    private int elementoFk;
    private LocalDate fecha_inicio;
    private LocalDate fecha_fin;


    
    public PrestamosVo() {
    }
    public PrestamosVo(int uaurioFk, int elementoFk, LocalDate fecha_inicio, LocalDate fecha_fin) {
        this.uaurioFk = uaurioFk;
        this.elementoFk = elementoFk;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
    }
    public int getUaurioFk() {
        return uaurioFk;
    }
    public void setUaurioFk(int uaurioFk) {
        this.uaurioFk = uaurioFk;
    }
    public int getElementoFk() {
        return elementoFk;
    }
    public void setElementoFk(int elementoFk) {
        this.elementoFk = elementoFk;
    }
    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }
    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }
    public LocalDate getFecha_fin() {
        return fecha_fin;
    }
    public void setFecha_fin(LocalDate fecha_fin) {
        this.fecha_fin = fecha_fin;
    }



}
