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
import org.mindrot.jbcrypt.BCrypt;

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
                case "index":
                    System.out.println("Se ha direccionado a una vista de testing.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "testing":
                    System.out.println("Se ha direccionado a una vista de testing.");

                    request.getRequestDispatcher("views/admin/dashboard(rediseñado).jsp").forward(request, response);
                    break;
                case "dash":
                    System.out.println("Se ha direccionado al dashboard de administrador.");
                    request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
                    break;
                case "list":
                    System.out.println("Se ha direccionado al login de usuarios.");
                    request.getRequestDispatcher("views/user/listarUsuario.jsp").forward(request, response);
                    break;
                

                case "login":
                    System.out.println("Se ha direccionado al login de usuarios.");
                    request.getRequestDispatcher("views/inicioSesion.jsp").forward(request, response);
                    break;
                case "prof":
                    System.out.println("Se ha direccionado al perfil de usuario.");
                    request.getRequestDispatcher("views/user/Edit_usu.jsp").forward(request, response);
                    break;
                case "lll":
                    System.out.println("Se ha direccionado al perfil de usuario.");
                    request.getRequestDispatcher("views/user/profile.jsp").forward(request, response);
                    break;

                case "search":
                    System.out.println("Se ha redireccionado al metodo 'buscarUsuariosPorNombre'");
                    System.out.println(request.getParameter("nombre"));
                    String nombre = request.getParameter("nombre");
                    request.setAttribute("nombre", nombre);
                    String numeros = "1";
                    request.setAttribute("numerodecaso", numeros);
                    request.getRequestDispatcher("views/admin/components/tables/tabla-registrosUsuarios.jsp")
                            .forward(request, response);
                    break;

                case "searchById": // Nueva acción para buscar por ID
                    System.out.println("Se ha redireccionado al metodo 'buscarUsuarioPorId'");
                    System.out.println(request.getParameter("numidusuario"));
                    String numero = "2";
                    request.setAttribute("numerodecaso", numero);
                    request.getRequestDispatcher("views/admin/components/tables/tabla-registrosUsuarios.jsp")
                            .forward(request, response);
                    request.setAttribute("numidusuario", request.getParameter("numidusuario"));

                    /* buscarUsuariosPornumIdentificacion(request, response); */
                    /* buscarUsuarioPorId(request, response); */
                    break;

                case "detalle":
                    System.out.println("Se ha redireccionado al metodo 'mostrarDetalleUsuario'");
                    mostrarDetalleUsuario(request, response);
                    break;
                case "profile":
                    System.out.println("Se ha direccionado al perfil del ususario.");
                    request.getRequestDispatcher("views/user/profile.jsp").forward(request, response);
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

                case "logout":
                    cerrarSesion(request, response);
                    break;
                case "busquedaxnombre":
                    System.out.print(request.getParameter("busquedaxnombre") + "este es el parametro por id");
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
            request.getRequestDispatcher("Usuario?action=test").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener la lista de usuarios");
        }
    }

    private void actualizarPerfilUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera el usuario de la sesión
        model.UsuarioVo usuarioSesion = (model.UsuarioVo) request.getSession().getAttribute("usuarioSesion");

        // Verifica que el usuario esté autenticado
        if (usuarioSesion != null) {
            // Obtiene los datos del formulario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String contrasena = request.getParameter("contrasena"); // Nueva contraseña

            // Verifica que los campos requeridos no estén vacíos
            if (nombre != null && !nombre.isEmpty() && apellido != null && !apellido.isEmpty() && email != null
                    && !email.isEmpty()) {
                try {
                    // Crea un objeto UsuarioVo con los datos actualizados
                    model.UsuarioVo usuarioActualizado = new model.UsuarioVo();
                    usuarioActualizado.setId(usuarioSesion.getId());
                    usuarioActualizado.setNombre(nombre);
                    usuarioActualizado.setApellido(apellido);
                    usuarioActualizado.setEmail(email);

                    // Si se proporcionó una nueva contraseña, actualízala
                    if (contrasena != null && !contrasena.isEmpty()) {
                        usuarioActualizado.setContrasena(contrasena);
                    }

                    // Llama al método de actualización en el DAO
                    int exito = usuarioDao.actualizarPerfil(usuarioActualizado);

                    if (exito > 0) {
                        // Actualiza la variable usuarioSesion con los datos actualizados
                        usuarioSesion.setNombre(nombre);
                        usuarioSesion.setApellido(apellido);
                        usuarioSesion.setEmail(email);

                        // Vuelve a almacenar el usuario actualizado en la sesión
                        request.getSession().setAttribute("usuarioSesion", usuarioSesion);

                        // Redirecciona a la página de perfil actualizada
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=testing");
                        /*
                         * request.getRequestDispatcher("Usuario?action=lll").forward(request,
                         * response);
                         */
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
            } else {
                // Manejar campos obligatorios vacíos, por ejemplo, redirigir a una página de
                // error
                response.sendRedirect("error.jsp");
            }
        } else {
            // El usuario no está autenticado, redirige a la página de inicio de sesión
            response.sendRedirect("login.jsp");
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
    request.getRequestDispatcher("views/user/detalleUsuario.jsp").forward(request, response);
    } catch (SQLException e) {
    e.printStackTrace();
    response.getWriter().println("Error al obtener los detalles del usuario y sus elementos asociados");
    }
    }

    private void buscarUsuariosPorNombre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        try {
            List<UsuarioVo> usuarios = usuarioDao.buscarUsuariosPorNombre(nombre);
            request.setAttribute("nombre", nombre);
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("Usuario?action=testing").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener la lista de usuarios");

        }
    }

    private void buscarUsuariosPornumIdentificacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a buscar
        int idUsuario = 1;
        try {
            // Realizar la búsqueda del usuario por ID
            UsuarioVo usuarioEncontrado = usuarioDao.buscarUsuarioPorId(idUsuario);
            request.setAttribute("usuarioEncontrado", usuarioEncontrado);

            request.setAttribute("numidentificacionusuario", request.getParameter("numidusuario"));
            System.out.println(request.getParameter("numidusuario") + "se esta enviando el parametro");
            String numidentificacionusuario = request.getParameter("numidusuario");
            System.out.println(request.getAttribute(numidentificacionusuario));
            System.out.println(numidentificacionusuario + "esta vacio");
            request.getRequestDispatcher("Usuario?action=testing").forward(request, response);
            // Redireccionar a la página de lista de usuarios con el usuario encontrado
            /* listarUsuarios(request, response); */
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
            response.sendRedirect(request.getContextPath() + "/Usuario?action=testing");
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al registrar el usuario");
            response.sendRedirect(request.getContextPath() + "/Usuario?action=testing");
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
            response.sendRedirect(request.getContextPath() + "Usuario?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al desactivar el usuario");
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

                    if (usuVo.getRol_fk().equals("Administrador")) {
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=testing");
                    } else if (usuVo.getRol_fk().equals("Cuentadante") || usuVo.getRol_fk().equals("Instructor")) {

                        request.getRequestDispatcher("views/user/dashboard.jsp").forward(request, response);
                    }

                } else {
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=login");
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

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de editar
        if (request.getParameter("id") != null) {
            usuVo.setId(Integer.parseInt(request.getParameter("id")));
        }
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
            usuarioDao.editar_Usuario(usuVo);
            // Redireccionar a la página de éxito después del registro
            request.getRequestDispatcher("Usuario?action=testing").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error si ocurre una excepción SQL
            response.getWriter().println("Error al registrar el usuario");
        }
    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalida la sesión actual
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Redirige a la página de inicio de sesión o a la página principal
        response.sendRedirect(request.getContextPath() + "/Usuario?action=login");
    }

}
