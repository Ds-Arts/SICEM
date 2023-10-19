package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ElementosDao;
import model.ElementosVo;
import model.UsuarioDao;
import model.UsuarioVo;

public class Usuario extends HttpServlet {

    UsuarioDao usuarioDao = new UsuarioDao();
    UsuarioVo usuVo = new UsuarioVo();
    ElementosDao elementoDao = new ElementosDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        System.out.println("\nDoGet del controlador de usuario.\n");

        if (action != null) {

            switch (action) {
                // elementos que solo me redirigen a una pagina no necesitan una funcion propia
                // como estos dos primeros
                case "dash":
                    System.out.println("Se ha direccionado al dashboard de administrador.");
                    request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
                    break;

                case "login":
                    System.out.println("Se ha direccionado al login de usuarios.");
                    request.getRequestDispatcher("views/inicioSesion.jsp").forward(request, response);
                    break;

                case "lll":
                    System.out.println("Se ha direccionado al perfil de usuario.");
                    request.getRequestDispatcher("views/profile.jsp").forward(request, response);
                    break;

                case "search":
                    System.out.println("Se ha redireccionado al metodo 'buscarUsuariosPorNombre'");
                    buscarUsuariosPorNombre(request, response);
                    break;

                case "searchById": // Nueva acción para buscar por ID
                    System.out.println("Se ha redireccionado al metodo 'buscarUsuarioPorId'");
                    buscarUsuarioPorId(request, response);
                    break;

                case "detalle":
                    System.out.println("Se ha redireccionado al metodo 'mostrarDetalleUsuario'");
                    mostrarDetalleUsuario(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        System.out.println("DoPost del controlador de usuario.");

        if (action != null) {

            switch (action) {
                case "register":
                    System.out.println("Se ha enviado al metodo 'registrarUsuario'");
                    registrarUsuario(request, response);
                    break;

                case "activate":
                    System.out.println("Se ha enviado al metodo 'activarUsuario'");
                    activarUsuario(request, response);
                    break;

                case "deactivate":
                    System.out.println("Se ha enviado al metodo 'desactivarUsuario'");
                    desactivarUsuario(request, response);
                    break;

                case "login":
                    System.out.println("Se ha enviado al metodo 'iniciar'");
                    iniciar(request, response);
                    break;

                case "updateProfile":
                    actualizarPerfilUsuario(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }

    // METODOS DOGET
    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<UsuarioVo> usuarios = usuarioDao.listarUsuarios();
            request.setAttribute("usuarios", usuarios);

            // Si hay un usuario encontrado en la búsqueda, lo agregamos al atributo para
            // mostrarlo en el JSP
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

    private void mostrarDetalleUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a mostrar detalles
        int idUsuarioDetalle = Integer.parseInt(request.getParameter("idUsuarioDetalle"));

        try {
            // Obtener los detalles del usuario
            UsuarioVo usuarioEncontrado = usuarioDao.buscarUsuarioPorId(idUsuarioDetalle);
            request.setAttribute("usuarioEncontrado", usuarioEncontrado);

            // Obtener la lista de elementos asociados al usuario
            List<ElementosVo> elementos = elementoDao.getElementosByUsuarioId(idUsuarioDetalle);

            request.setAttribute("elementos", elementos);

            // Redireccionar a la página de detalles del usuario
            request.getRequestDispatcher("views/admin/detallesUsuario.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener los detalles del usuario y sus elementos asociados");
        }
    }

    private void buscarUsuariosPorNombre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el término de búsqueda ingresado por el usuario
        String searchTerm = request.getParameter("searchTerm");

        try {
            List<UsuarioVo> usuarios = usuarioDao.buscarUsuariosPorNombre(searchTerm);
            request.setAttribute("usuarios", usuarios);

            // Si hay un usuario encontrado, lo agregamos al atributo para mostrarlo en el
            // JSP
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

    // METODOS DOPOST
    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de registro
        if (request.getParameter("nombre") != null) {
            usuVo.setNombre(request.getParameter("nombre"));
        }
        if (request.getParameter("apellido") != null) {
            usuVo.setApellido(request.getParameter("apellido"));
        }
        if (request.getParameter("email") != null) {
            usuVo.setEmail(request.getParameter("email"));
        }
        if (request.getParameter("numIdentificacion") != null) {
            usuVo.setNumIdentificacion(Integer.parseInt(request.getParameter("numIdentificacion")));
        }
        if (request.getParameter("contrasena") != null) {
            usuVo.setContrasena(request.getParameter("contrasena"));
        }
        if (request.getParameter("rol_fk") != null) {
            usuVo.setRol_fk(request.getParameter("rol_fk"));
        }
        if (request.getParameter("activo") != null) {
            usuVo.setActivo(request.getParameter("activo"));
        }
        try {
            // Registrar el nuevo usuario en la base de datos
            usuarioDao.registrarUsuario(usuVo);
            // Redireccionar a la página de éxito después del registro
            request.getRequestDispatcher("views/registroUsuario.jsp").forward(request, response);
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

    private void actualizarPerfilUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos actualizados del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        try {
            // Actualizar el perfil del usuario en la base de datos
            UsuarioVo usuarioActualizado = new UsuarioVo();
            usuarioActualizado.setId(idUsuario);
            usuarioActualizado.setNombre(nombre);
            usuarioActualizado.setApellido(apellido);
            usuarioActualizado.setEmail(email);

            // Llamar al método de actualización en el DAO
            int exito = usuarioDao.actualizarPerfil(usuarioActualizado);

            if (exito > 0) {
                // Actualiza la variable usuarioSesion con los datos actualizados
                usuVo.setNombre(nombre);
                usuVo.setApellido(apellido);
                usuVo.setEmail(email);

                // Vuelve a almacenar el usuario actualizado en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuarioSesion", usuVo);

                // Redireccionar a la página de perfil actualizada
                request.getRequestDispatcher("views/profile.jsp").forward(request, response);
            } else {
                // Manejar el error de actualización, por ejemplo, redirigir a una página de
                // error
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar el error de base de datos
            response.sendRedirect("error.jsp");
        }
    }

    public void iniciar(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Entro al inicio");

        // Obtener los parámetros del formulario
        String numIdentificacionStr = request.getParameter("numIdentificacion");
        String contrasena = request.getParameter("contrasena");

        try {
            if (numIdentificacionStr != null && !numIdentificacionStr.isEmpty()) {
                // Convertir el valor de numIdentificacionStr a un entero
                Integer numIdentificacion = Integer.parseInt(numIdentificacionStr);

                // Obtén el usuario de la base de datos según su número de identificación
                usuVo = usuarioDao.obtenerUsuarioPorNumeroIdentificacion(numIdentificacion);

                if (usuVo != null && usuVo.getContrasena().equals(contrasena)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuarioSesion", usuVo);

                    // Redirige al usuario a la página de dashboard
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=dash");
                } else {
                    request.getRequestDispatcher("views/inicioSesion.jsp").forward(request, response);
                }
            } else {
                // El valor de numIdentificacionStr es nulo o vacío, maneja este caso según tus
                // necesidades
            }
        } catch (NumberFormatException e) {
            // Manejar la excepción de conversión aquí, si es necesario
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error en la modificación: " + e.getMessage());
        }
    }

}
