package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UsuarioDao;
import model.UsuarioVo;

public class LoginServlet extends HttpServlet {

    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        super.init();
        // Inicializar el objeto UsuarioDao
        usuarioDao = new UsuarioDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        try {
            // Verificar si el usuario y la contraseña son válidos en la base de datos
            UsuarioVo usuarioValidado = usuarioDao.verificarUsuario(usuario, contrasena);

            if (usuarioValidado != null) {
                // Si el usuario y la contraseña son válidos, crear una sesión y almacenar el usuario en ella
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuarioValidado);

                // Redirigir al usuario a la página de éxito
                response.sendRedirect(request.getContextPath() + "/login2.jsp");
            } else {
                // Si el usuario y la contraseña no son válidos, redirigir al usuario a la página de inicio de sesión con un mensaje de error
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=1");
            }
        } catch (SQLException e) {
            // Manejar el error de SQL
            e.printStackTrace();
            response.getWriter().println("Error al verificar el usuario");
        }
    }
}
