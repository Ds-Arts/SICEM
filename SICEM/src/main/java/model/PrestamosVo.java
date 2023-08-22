package model;
import java.time.LocalDate;
public class PrestamosVo {
    private  int numPlacaFk;
    private  LocalDate fecha_inicio;
    private  LocalDate fecha_fin;




public PrestamosVo(int numPlacaFk, LocalDate fecha_inicio, LocalDate fecha_fin) {
        this.numPlacaFk = numPlacaFk;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
    }


// contructor
  public PrestamosVo() {
    } 
    // metodos accesores 


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


public int getNumPlacaFk() {
    return numPlacaFk;
}


public void setNumPlacaFk(int numPlacaFk) {
    this.numPlacaFk = numPlacaFk;
}
    
}


