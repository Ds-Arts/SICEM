package model;

import java.time.LocalDate;

public class PrestamosVo {
    private int  cuentadantefk;
    private int elementoFk;
    private LocalDate fechaTranspaso;
    private boolean tipo;
    private LocalDate fechaInicio;
    private LocalDate fechaFin; 
    private int prestatariofk;
    private int usu;
    private int us;
 
    public PrestamosVo() {
    }

    public PrestamosVo(int cuentadantefk, int elementoFk, LocalDate fechaTranspaso, boolean tipo, LocalDate fechaInicio,
            LocalDate fechaFin, int prestatariofk, int usu,int us) {
        this.cuentadantefk = cuentadantefk;
        this.elementoFk = elementoFk;
        this.fechaTranspaso = fechaTranspaso;
        this.tipo = tipo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.prestatariofk = prestatariofk;
        this.usu= usu;
        this.us= us;
    }

    public int getUs() {
        return us;
    }

    public void setUs(int us) {
        this.us = us;
    }

    public int getUsu() {
        return usu;
    }

    public void setUsu(int usu) {
        this.usu = usu;
    }

    public int getCuentadantefk() {
        return cuentadantefk;
    }

    public void setCuentadantefk(int cuentadantefk) {
        this.cuentadantefk = cuentadantefk;
    }

    public int getPrestatariofk() {
        return prestatariofk;
    }

    public void setPrestatariofk(int prestatariofk) {
        this.prestatariofk = prestatariofk;
    }

    public int getElementoFk() {
        return elementoFk;
    }

    public void setElementoFk(int elementoFk) {
        this.elementoFk = elementoFk;
    }

    public LocalDate getFechaTranspaso() {
        return fechaTranspaso;
    }

    public void setFechaTranspaso(LocalDate fechaTranspaso) {
        this.fechaTranspaso = fechaTranspaso;
    }

    public boolean isTipo() {
        return tipo;
    }

    public void setTipo(boolean tipo) {
        this.tipo = tipo;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }
}
