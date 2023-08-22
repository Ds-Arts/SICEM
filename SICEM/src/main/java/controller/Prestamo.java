package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PrestamosDao;
import model.PrestamosVo;

public class Prestamo extends HttpServlet{
    PrestamosVo e = new PrestamosVo ();
    PrestamosDao l = new PrestamosDao ();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Entró al DoPost");
        String a = req.getParameter("accion");
        if (a != null) {
            switch (a) {
                case "pres":
                    prestamo(req, resp);
                break;
            }
        }
    }
        private void prestamo(HttpServletRequest req, HttpServletResponse resp) {
            if(req.getParameter("num_placa_fk")!=null){
                e.setNumPlacaFk(Integer.parseInt(req.getParameter("num_placa_fk")));
            }
            if (req.getParameter("fecha_inicio") != null) {
                    // Convertir la fecha ingreso del formulario a LocalDate
                    LocalDate fecha_inicio = LocalDate.parse(req.getParameter("fecha_inicio"));
                    e.setFecha_inicio(fecha_inicio);
                }
            if (req.getParameter("fecha_fin") != null) {
                    // Convertir la fecha ingreso del formulario a LocalDate
                    LocalDate fecha_fin = LocalDate.parse(req.getParameter("fecha_fin"));
                    e.setFecha_fin(fecha_fin);
                }

            
            try {
                l.registrar(e);
                System.out.println("reel creada correctamente");
                req.getRequestDispatcher("views/prestamo.jsp").forward(req, resp);
            } catch (Exception e) {
                System.out.println("Error en la inserción del registro "+e.getMessage().toString());
            }
    }
}

