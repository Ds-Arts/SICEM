package model;

import java.time.LocalDate;

public class PrestamosVo {
    private int usuarioFk;
    private int elementoFk;
    private LocalDate fechaTranspaso;
    private boolean tipo;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;

    public PrestamosVo() {
    }

    public PrestamosVo(int usuarioFk, int elementoFk, LocalDate fechaTranspaso, boolean tipo, LocalDate fechaInicio, LocalDate fechaFin) {
        this.usuarioFk = usuarioFk;
        this.elementoFk = elementoFk;
        this.fechaTranspaso = fechaTranspaso;
        this.tipo = tipo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    public int getUsuarioFk() {
        return usuarioFk;
    }

    public void setUsuarioFk(int usuarioFk) {
        this.usuarioFk = usuarioFk;
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
