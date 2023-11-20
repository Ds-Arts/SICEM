package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PrestamosDao;
import model.PrestamosVo;

public class Prestamo extends HttpServlet {
    private PrestamosDao prestamosDao;

    @Override
    public void init() throws ServletException {
        prestamosDao = new PrestamosDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action != null) {
            switch (action) {
                case "registrar":
                    registrarPrestamo(req, resp);
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action != null) {
            switch (action) {
                case "registrar":
                    req.getRequestDispatcher("views/prestamos/Prestamos.jsp").forward(req, resp);
                    break;
                case "listarPrestamos":
                    listarPrestamos(req, resp);
                    break;
                default:
                    // Redirecciona a una página de error u otra página predeterminada
                    req.getRequestDispatcher("views/error.jsp").forward(req, resp);
                    break;
            }
        } else {
            // Si no se proporciona un parámetro "action", redirecciona a una página predeterminada
            req.getRequestDispatcher("Usuario?action=testing").forward(req, resp);
        }
    }

    private void registrarPrestamo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrestamosVo prestamo = new PrestamosVo();
        
        if (req.getParameter("cuentadante_fk") != null) {   
            System.out.println(req.getParameter("cuentadante_fk"));
            prestamo.setCuentadantefk(Integer.parseInt(req.getParameter("cuentadante_fk"))); 
            System.out.println("cuentadante_fk"+prestamo.getCuentadantefk());
        }
        if (req.getParameter("elemento_fk") != null) {
            prestamo.setElementoFk(Integer.parseInt(req.getParameter("elemento_fk")));

        }
    
        // Verificar si fechaTranspaso no es nula
        if (req.getParameter("fechaTranspaso") != null) {
            LocalDate fechaTranspaso = LocalDate.parse(req.getParameter("fechaTranspaso"));
            prestamo.setFechaTranspaso(fechaTranspaso);
        } else {
            // Manejar la situación cuando fechaTranspaso es nula
            // Por ejemplo, puedes establecerla como la fecha actual
            prestamo.setFechaTranspaso(LocalDate.now());
        }
    
        // Verificar si tipo no es nulo
        if (req.getParameter("tipo") != null) {
            boolean tipo = Boolean.parseBoolean(req.getParameter("tipo"));
            prestamo.setTipo(tipo);
        } else {
            // Manejar la situación cuando tipo es nulo
            // Por ejemplo, puedes establecerlo como false o true según tus necesidades
            prestamo.setTipo(false);
        }
    
        if (req.getParameter("fecha_inicio") != null) {
            LocalDate fechaInicio = LocalDate.parse(req.getParameter("fecha_inicio"));
            prestamo.setFechaInicio(fechaInicio);
        }
        if (req.getParameter("fecha_fin") != null) {
            LocalDate fechaFin = LocalDate.parse(req.getParameter("fecha_fin"));
            prestamo.setFechaFin(fechaFin);
        }
          if (req.getParameter("prestatario_fk") != null) {
            System.out.println(req.getParameter("prestatario_fk"));
             prestamo.setPrestatariofk(Integer.parseInt(req.getParameter("prestatario_fk")));  
             System.out.println("este es id de el prestatario"+prestamo.getPrestatariofk());
        }
    
        try {
            prestamosDao.registrar(prestamo);
            req.getRequestDispatcher("Usuario?action=testing").forward(req, resp);
            System.out.println("Registro de préstamo creado correctamente");
          /*   req.getRequestDispatcher("views/ListarElementos.jsp").forward(req, resp);   */
            

        } catch (SQLException e) {
            System.out.println("Error en la inserción del registro de préstamo: " + e.getMessage());
            req.getRequestDispatcher("Usuario?action=testing").forward(req, resp);
        }
    }
    
    

    private void listarPrestamos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<PrestamosVo> prestamos = prestamosDao.listarPrestamos();
            // Puedes almacenar la lista en el request para que esté disponible en el JSP
            req.setAttribute("prestamos", prestamos);
            req.getRequestDispatcher("views/prestamos/listarPrestamos.jsp").forward(req, resp);
        } catch (SQLException e) {
            System.out.println("Error al listar préstamos: " + e.getMessage());
            req.getRequestDispatcher("views/error.jsp").forward(req, resp);
        }
    }

    @Override
    public void destroy() {
        try {
            prestamosDao.cerrarConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}    

