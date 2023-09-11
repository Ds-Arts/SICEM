package controller;

import model.UsuarioDao;
import model.UsuarioVo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Usuario extends HttpServlet {

    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        super.init();
        usuarioDao = new UsuarioDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                //elementos que solo me redirigen a una pagina no necesitan una funcion propia como estos dos primeros
                case "registrarU":
                request.getRequestDispatcher("views/registroUsuario.jsp").forward(request, response);
                    break;
                case "login": 
                    request.getRequestDispatcher("views/inicioSesion.jsp").forward(request, response);
                    break;
                case"list_Cuentadantes":

                break;
                //aunque me redirijan a una vista diferente estos tienen propios metodos creados en el Dao y veo por lo cual necesitan funciones
                case "list":
                    listarUsuarios(request, response);
                    break;
                case "search":
                    buscarUsuariosPorNombre(request, response);
                    break;
                case "searchById": // Nueva acción para buscar por ID
                    buscarUsuarioPorId(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        } else {
            listarUsuarios(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "register":
                    registrarUsuario(request, response);
                    break;
                case "activate":
                    activarUsuario(request, response);
                    break;
                case "deactivate":
                    desactivarUsuario(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }


    
    //METODOS DOGET
    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
            request.setAttribute("usuarios", usuarios);

            // Si hay un usuario encontrado en la búsqueda, lo agregamos al atributo para mostrarlo en el JSP
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm != null && !searchTerm.isEmpty()) {
                List<UsuarioVo> usuariosEncontrados = usuarioDao.buscarUsuariosPorNombre(searchTerm);
                if (!usuariosEncontrados.isEmpty()) {
                    request.setAttribute("usuarioEncontrado", usuariosEncontrados.get(0));
                }
            }

            request.getRequestDispatcher("views/listarUsuario.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener la lista de usuarios");
        }
    }

    private void buscarUsuariosPorNombre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el término de búsqueda ingresado por el usuario
        String searchTerm = request.getParameter("searchTerm");

        try {
            List<UsuarioVo> usuarios = usuarioDao.buscarUsuariosPorNombre(searchTerm);
            request.setAttribute("usuarios", usuarios);

            // Si hay un usuario encontrado, lo agregamos al atributo para mostrarlo en el JSP
            UsuarioVo usuarioEncontrado = null;
            if (!usuarios.isEmpty()) {
                usuarioEncontrado = usuarios.get(0);
            }
            request.setAttribute("usuarioEncontrado", usuarioEncontrado);

            request.getRequestDispatcher("listarUsu.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener la lista de usuarios");
        }
    }

    private void buscarUsuarioPorId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a buscar
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        try {
            // Realizar la búsqueda del usuario por ID
            UsuarioVo usuarioEncontrado = usuarioDao.buscarUsuarioPorId(idUsuario);
            request.setAttribute("usuarioEncontrado", usuarioEncontrado);

            // Redireccionar a la página de lista de usuarios con el usuario encontrado
            listarUsuarios(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener el usuario por ID");
        }
    }

    //METODOS DOPOST
    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de registro
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Crear un objeto UsuarioVo con los datos del nuevo usuario
        UsuarioVo nuevoUsuario = new UsuarioVo(nombre, usuario, contrasena);

        try {
            // Registrar el nuevo usuario en la base de datos
            usuarioDao.registrarUsuario(nuevoUsuario);
            // Redireccionar a la página de éxito después del registro
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al registrar el usuario");
        }
    }

    private void activarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a activar
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        try {
            // Actualizar el estado del usuario a activo en la base de datos
            usuarioDao.actualizarEstadoUsuario(idUsuario, true);
            // Redireccionar a la página de lista de usuarios después de la activación
            response.sendRedirect(request.getContextPath() + "/Usuario?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al activar el usuario");
        }
    }

    private void desactivarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a desactivar
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        try {
            // Actualizar el estado del usuario a inactivo en la base de datos
            usuarioDao.actualizarEstadoUsuario(idUsuario, false);
            // Redireccionar a la página de lista de usuarios después de la desactivación
            response.sendRedirect(request.getContextPath() + "/Usuario?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al desactivar el usuario");
        }
    }


}
