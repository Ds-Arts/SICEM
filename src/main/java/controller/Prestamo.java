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
            req.getRequestDispatcher("views/paginaPredeterminada.jsp").forward(req, resp);
        }
    }

    private void registrarPrestamo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrestamosVo prestamo = new PrestamosVo();
    
        if (req.getParameter("usuarioFk") != null) {
            prestamo.setUsuarioFk(Integer.parseInt(req.getParameter("usuarioFk")));
        }
        if (req.getParameter("elementoFk") != null) {
            prestamo.setElementoFk(Integer.parseInt(req.getParameter("elementoFk")));
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
    
        if (req.getParameter("fechaInicio") != null) {
            LocalDate fechaInicio = LocalDate.parse(req.getParameter("fechaInicio"));
            prestamo.setFechaInicio(fechaInicio);
        }
        if (req.getParameter("fechaFin") != null) {
            LocalDate fechaFin = LocalDate.parse(req.getParameter("fechaFin"));
            prestamo.setFechaFin(fechaFin);
        }
    
        try {
            prestamosDao.registrar(prestamo);
            System.out.println("Registro de préstamo creado correctamente");
            req.getRequestDispatcher("views/prestamo.jsp").forward(req, resp);  
            

        } catch (SQLException e) {
            System.out.println("Error en la inserción del registro de préstamo: " + e.getMessage());
            req.getRequestDispatcher("views/error.jsp").forward(req, resp);
        }
    }
    
    

    private void listarPrestamos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<PrestamosVo> prestamos = prestamosDao.listarPrestamos();
            // Puedes almacenar la lista en el request para que esté disponible en el JSP
            req.setAttribute("prestamos", prestamos);
            req.getRequestDispatcher("views/listarPrestamos.jsp").forward(req, resp);
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

