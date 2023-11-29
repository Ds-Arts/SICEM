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

    private int u;

    // Tranquilos, espara los ultimos 4 prestamos regitrados
    private String nom_cuenta;
    private String nom_presta;
    private String nom_elemento;
 
    public PrestamosVo() {
    }

    public PrestamosVo(int cuentadantefk, int elementoFk, LocalDate fechaTranspaso, boolean tipo, LocalDate fechaInicio,
                       LocalDate fechaFin, int prestatariofk, int usu, int us, int u) {
        this.cuentadantefk = cuentadantefk;
        this.elementoFk = elementoFk;
        this.fechaTranspaso = fechaTranspaso;
        this.tipo = tipo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.prestatariofk = prestatariofk;
        this.usu= usu;
        this.us= us;
        this.u= u;

    }

    // Constructor para los ultimos 4 elementos
    public PrestamosVo(int id_cuenta, String nom_cuenta, int id_presta, String nom_presta, int id_elemento,
            String nom_elemento) {
        this.cuentadantefk = id_cuenta;
        this.nom_cuenta = nom_cuenta;
        this.prestatariofk = id_presta;
        this.nom_presta = nom_presta;
        this.elementoFk = id_elemento;
        this.nom_elemento = nom_elemento;

    }

    public int getU() {
        return u;
    }

    public void setU(int u) {
        this.u = u;
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

    public String getNom_cuenta() {
        return nom_cuenta;
    }

    public void setNom_cuenta(String nom_cuenta) {
        this.nom_cuenta = nom_cuenta;
    }

    public String getNom_presta() {
        return nom_presta;
    }

    public void setNom_presta(String nom_presta) {
        this.nom_presta = nom_presta;
    }

    public String getNom_elemento() {
        return nom_elemento;
    }

    public void setNom_elemento(String nom_elemento) {
        this.nom_elemento = nom_elemento;
    }

    
}
