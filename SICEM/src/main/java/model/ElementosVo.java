package model;

import java.time.LocalDate;

public class ElementosVo {
    private int Id;
    private String nombre;
    private int numeroPlaca;
    private int cantidad;
    private int costo;
    private String tipo;
    private LocalDate fechaIngreso;
    private String estado;
    private String categoria;
    private int numeroAula;
    private String descripcion;
    private int usu;


    public ElementosVo() {
    }
    
    public ElementosVo(int id, String nombre, int numeroPlaca, int cantidad, int costo, String tipo,
            LocalDate fechaIngreso, String estado, String categoria, int numeroAula, String descripcion, int usu) {
        Id = id;
        this.nombre = nombre;
        this.numeroPlaca = numeroPlaca;
        this.cantidad = cantidad;
        this.costo = costo;
        this.tipo = tipo;
        this.fechaIngreso = fechaIngreso;
        this.estado = estado;
        this.categoria = categoria;
        this.numeroAula = numeroAula;
        this.descripcion = descripcion;
        this.usu = usu;
    }

    public int getUsu() {
        return usu;
    }

    public void setUsu(int usu) {
        this.usu = usu;
    }


    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroPlaca() {
        return numeroPlaca;
    }

    public void setNumeroPlaca(int numeroPlaca) {
        this.numeroPlaca = numeroPlaca;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public LocalDate getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(LocalDate fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getNumeroAula() {
        return numeroAula;
    }

    public void setNumeroAula(int numeroAula) {
        this.numeroAula = numeroAula;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
