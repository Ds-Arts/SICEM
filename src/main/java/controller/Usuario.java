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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

                case "search":
                   System.out.println("Se ha redireccionado al metodo 'buscarUsuariosPorNombre'");
                   System.out.println(  request.getParameter("nombre"));   
                buscarUsuariosPorNombre(request, response); 
                    break;

                case "searchById": // Nueva acción para buscar por ID
                    System.out.println("Se ha redireccionado al metodo 'buscarUsuarioPorId'");
                    System.out.println(request.getParameter("numidusuario"));
                    buscarUsuariosPornumIdentificacion(request, response);
                    /*  buscarUsuarioPorId(request, response); */
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
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
    request.getRequestDispatcher("views/detalleUsuario.jsp").forward(request, response);
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
                   request.setAttribute("nombre",nombre);
                    request.setAttribute("usuarios", usuarios);
                    request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
                } catch (SQLException e) {
                    System.out.println("Error al buscar nombres " + e.getMessage());
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

            request.setAttribute("numidentificacionusuario",request.getParameter("numidusuario") );
            System.out.println(request.getParameter("numidusuario")+"se esta enviando el parametro");
            String numidentificacionusuario = request.getParameter("numidusuario");
            System.out.println(request.getAttribute(numidentificacionusuario));
            System.out.println(numidentificacionusuario + "esta vacio");
            request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
            // Redireccionar a la página de lista de usuarios con el usuario encontrado
         /*    listarUsuarios(request, response); */
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
            request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
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

    public void iniciar(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("entro al inicio");

        // Obtener los parámetros del formulario
        String numIdentificacionStr = request.getParameter("numIdentificacion");
        String contrasena = request.getParameter("contrasena");

        try {
            if (numIdentificacionStr != null && !numIdentificacionStr.isEmpty()) {
                // Convertir el valor de numIdentificacionStr a un entero
                Integer numIdentificacion = Integer.parseInt(numIdentificacionStr);

                // Luego, puedes continuar con la verificación del usuario
                usuVo = UsuarioDao.verificarUsuario(numIdentificacion, contrasena);

                if (usuVo != null) {
                    HttpSession iniciar = request.getSession();
                    iniciar.setAttribute("numIdentificacion", usuVo);
                    request.getRequestDispatcher("views/admin/dashboard.jsp").forward(request, response);
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
