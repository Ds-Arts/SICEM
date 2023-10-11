package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoriaDao;
import model.CategoriaVo;

public class Categoria extends HttpServlet {
    CategoriaDao cd = new CategoriaDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoPost del controlador de Categoria.\n");
        String action = request.getParameter("action");

        switch (action) {
            case "en_categoria":
                crearCategoria(request, response);
                break;
            default:
                // Acción por defecto, puedes redirigir o mostrar una página de error
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoGet del controlador de Categoria.");
        String action = request.getParameter("action");

        switch (action) {
            // Noy hay a donde direccionar.
        }
    }

    private void crearCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombreCategoria = request.getParameter("n_categoria");
        String descripcionCategoria = request.getParameter("d_categoria");
        CategoriaVo categoria = new CategoriaVo();
        categoria.setNombreCategoria(nombreCategoria);
        categoria.setDescripcionCategoria(descripcionCategoria);
        try {
            cd.crearCategoria(categoria);
            request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores
        }
    }
}
