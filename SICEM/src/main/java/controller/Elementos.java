package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoriaDao;

// Asegúrate de tener la librería Gson para trabajar con JSON

import model.ElementosDao;
import model.ElementosVo;

public class Elementos extends HttpServlet {
    ElementosVo e = new ElementosVo();
    ElementosDao l = new ElementosDao();
    Categoria c= new Categoria();
    CategoriaDao cd = new CategoriaDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Entró al Doget");
        String a = req.getParameter("accion");
        switch (a) {
            //elementos que solo me redirigen a una pagina no necesitan una funcion propia como estos dos primeros
            case "registrar":
                req.getRequestDispatcher("views/registrarElementos.jsp").forward(req, resp);
                break;
            case "entrahome":
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                break;
            case "c_categoria":    
            // se invoca un metodo de el el servlet de categotia el cual tiene el dispacher para el formulario 
              c.c_categoria(req, resp);
                break;
            //aunque me redirijan a una vista diferente estos tienen propios metodos creados en el Dao y veo por lo cual necesitan funciones
            case "listar":
                listar(req, resp);
                System.out.println("entro listar");
                break;
            case "buscar_elementos":
                buscarElementos(req, resp);
                break;
            case "buscar_tipo":
                buscarTipos(req, resp);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Entró al DoPost");
        String a = req.getParameter("accion");
        
        switch (a) {
            case "add":
                add(req, resp);
                System.out.println("accion boton");
                break;

          case "data_prestamo":
          String np = req.getParameter("n_placa_prestamo"); 
          req.setAttribute("n_placa_prestamo",np); 
          System.out.println(req.getParameter("n_placa_prestamo")); 
          req.getRequestDispatcher("views/prestamo.jsp").forward(req, resp);
          break; 

          case "prestamo":  
            LocalDate fecha_inicio = LocalDate.parse(req.getParameter("Fecha_inicio"));
            LocalDate fechafin = LocalDate.parse(req.getParameter("Fecha_fin"));
             System.out.println(fecha_inicio);
             System.out.println(fechafin);
          break;

        }    

  
    }


    //METODOS DOGET
    private void buscarElementos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String placa = req.getParameter("placa");
        try {
            List<ElementosVo> elementos = l.buscarPorNumeroPlaca(placa);
            req.setAttribute("elementos", elementos);
            req.getRequestDispatcher("views/Listar.jsp").forward(req, resp);
        } catch (SQLException e) {
            System.out.println("Error al buscar elementos por número de placa: " + e.getMessage());
        }
    }

    private void buscarTipos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("TipoElemento");
        System.out.println("Valor de tipo recibido: " + tipo); // Agrega esta línea para verificar el valor recibido
        try {
        List<ElementosVo> elementos = l.buscarPorTipo(tipo);
        req.setAttribute("elementos", elementos);
        req.getRequestDispatcher("views/ListarElementos.jsp").forward(req, resp);
    } catch (SQLException e) {
        System.out.println("Error al buscar elementos por tipo: " + e.getMessage());
    }
    }


    private void listar(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<ElementosVo> elemento = l.listar();
            req.setAttribute("elementos", elemento);
            req.getRequestDispatcher("views/ListarElementos.jsp").forward(req, resp);
            System.out.println("Datos listados correctamente");
            System.out.println(req.getAttribute("elementos"));
        } catch (Exception e) {
            System.out.println("Hay problemas al listar los datos " + e.getMessage().toString());
        }
    }

    
    //METODOS DOPOST

    private void add(HttpServletRequest req, HttpServletResponse resp) {
        if (req.getParameter("NombreElemento") != null) {
            e.setNombre(req.getParameter("NombreElemento"));
        }
        if (req.getParameter("N_placa") != null) {
            e.setNumeroPlaca(Integer.parseInt(req.getParameter("N_placa")));
        }
        if (req.getParameter("cantidad") != null) {
            e.setCantidad(Integer.parseInt(req.getParameter("cantidad")));
        }
        if (req.getParameter("Costo") != null) {
            e.setCosto(Integer.parseInt(req.getParameter("Costo")));
        }
        if (req.getParameter("TipoElemento") != null) {
            // Asumiendo que el parámetro TipoElemento es un texto ("Consumo" o "Desechable")
            e.setTipo(req.getParameter("TipoElemento"));
        }
        if (req.getParameter("FechaIngresoElemento") != null) {
            // Convertir la fecha ingreso del formulario a LocalDate
            LocalDate fechaIngreso = LocalDate.parse(req.getParameter("FechaIngresoElemento"));
            e.setFechaIngreso(fechaIngreso);
        }
        if (req.getParameter("categoriaElemento") != null) {
            e.setCategoria(req.getParameter("categoriaElemento"));
        }
        if (req.getParameter("NumAula") != null) {
            e.setNumeroAula(Integer.parseInt(req.getParameter("NumAula")));
        }
        if (req.getParameter("Descripcion") != null) {
            e.setDescripcion(req.getParameter("Descripcion"));
        }
        if (req.getParameter("EstadoElemento") != null) {
            e.setEstado(req.getParameter("EstadoElemento"));
        }

        try {
            int result = l.registrar(e);
            if (result == 1) {
                System.out.println("Registro insertado correctamente");
                req.getRequestDispatcher("views/registrarElementos.jsp").forward(req, resp);
            } else if (result == 0) {
                System.out.println("El número de placa ya fue registrado");
                req.setAttribute("error", "El número de placa ya fue registrado");
                req.getRequestDispatcher("views/registrar.jsp").forward(req, resp);
            }
        } catch (SQLException ex) {
            System.out.println("Error en la inserción del registro " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error en la inserción del registro " + ex.getMessage());
        }
    }
    

}
