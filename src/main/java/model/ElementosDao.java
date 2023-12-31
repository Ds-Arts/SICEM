package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ElementosDao {
    /* Atributos para realizar operaciones sobre la BD */

    Connection con; // objeto de conexión
    PreparedStatement ps; // preparar sentencias
    ResultSet rs; // almacenar consutas
    String sql = null;
    int r; // cantidad de filas que devuelve una sentencia

    
    public int registrar(ElementosVo elementos) throws SQLException {
        // Verificar si ya existe un elemento con el mismo número de placa
        if (existeElementoConPlaca(elementos.getNumeroPlaca())) {
            System.out.println("El número de placa ya fue registrado");
            return 0; // Retornar 0 para indicar que no se pudo registrar el elemento
        }

        // Si no existe un elemento con el mismo número de placa, proceder con el
        // registro
        sql = "INSERT INTO Elementos(NombreElemento,N_placa,cantidad,Costo,TipoElemento,FechaIngresoElemento,categoriaElemento,NumAula,Descripcion,EstadoElemento,usuario_fk) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = Conexion.conectar(); // abrir conexión
            ps = con.prepareStatement(sql); // preparar sentencia
            ps.setString(1, elementos.getNombre());
            ps.setInt(2, elementos.getNumeroPlaca());
            ps.setInt(3, elementos.getCantidad());
            ps.setInt(4, elementos.getCosto());
            ps.setString(5, elementos.getTipo());
            ps.setDate(6, Date.valueOf(elementos.getFechaIngreso()));
            ps.setInt(7, elementos.getCategoria());
            ps.setInt(8, elementos.getNumeroAula());
            ps.setString(9, elementos.getDescripcion());
            ps.setString(10, elementos.getEstado());
            ps.setInt(11, elementos.getUsu());
            System.out.println(ps);
            r = ps.executeUpdate(); // Ejecutar sentencia
            ps.close(); // cerrar sentencia
            System.out.println("Se registró el rol correctamente");
        } catch (Exception e) {
            System.out.println("Error en el registro " + e.getMessage().toString());
        } finally {
            con.close(); // cerrando conexión
        }
        return r;
    }

    // Método para verificar si ya existe un elemento con el mismo número de placa
    private boolean existeElementoConPlaca(int numeroPlaca) throws SQLException {
        sql = "SELECT COUNT(*) FROM Elementos WHERE N_placa = ?";
        try {
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroPlaca);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Si count es mayor que 0, significa que ya existe un elemento con ese número
                                  // de placa
            }
        } catch (Exception e) {
            System.out.println("Error en la consulta: " + e.getMessage());
        } finally {
            con.close();
        }

        return false; // Si ocurre algún error, retornar false por defecto

    }

    public List<ElementosVo> listar() throws SQLException {
        List<ElementosVo> Elementos = new ArrayList<>();
        sql = "SELECT * FROM Elementos";

        try {
            System.out.println("Se estan consultando elementos...");
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ElementosVo l = new ElementosVo();
                // Escribir en el setter cada valor encontrado
                l.setNombre(rs.getString("NombreElemento"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setCosto(rs.getInt("Costo"));
                l.setNumeroPlaca(rs.getInt("N_placa"));
                l.setTipo(rs.getString("TipoElemento"));
                l.setFechaIngreso(rs.getDate("FechaIngresoElemento").toLocalDate());
                l.setCategoria(rs.getInt("categoriaElemento"));
                l.setNumeroAula(rs.getInt("NumAula"));
                l.setDescripcion(rs.getString("Descripcion"));
                l.setEstado(rs.getString("EstadoElemento"));
                l.setUsu(rs.getInt("usuario_fk"));
                l.setCate(rs.getInt(("categoriaElemento")));
                Elementos.add(l);
                Elementos.size();
            }
            ps.close();
            System.out.println("Consulta de elementos finalizada.");
            System.out.println("Filas consultadas: " + Elementos.size());
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return Elementos;
    }

    public List<ElementosVo> buscarPorNumeroPlaca(String placa) throws SQLException {
        List<ElementosVo> elementos = new ArrayList<>();
        sql = "SELECT * FROM Elementos WHERE N_placa = ?";
        try {
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, placa);
            rs = ps.executeQuery();

            while (rs.next()) {
                ElementosVo l = new ElementosVo();
                l.setNombre(rs.getString("NombreElemento"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setCosto(rs.getInt("Costo"));
                l.setNumeroPlaca(rs.getInt("N_placa"));
                l.setTipo(rs.getString("TipoElemento"));
                l.setFechaIngreso(rs.getDate("FechaIngresoElemento").toLocalDate());
                l.setCategoria(rs.getInt("categoriaElemento"));
                l.setNumeroAula(rs.getInt("NumAula"));
                l.setDescripcion(rs.getString("Descripcion"));
                l.setEstado(rs.getString("EstadoElemento"));
                l.setUsu(rs.getInt("usuario_fk"));

                elementos.add(l);
            }
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en la consulta: " + e.getMessage());
        } finally {
            con.close();
        }

        return elementos;
    }

    public List<ElementosVo> buscarPorTipo(String tipo) throws SQLException {
        List<ElementosVo> elementos = new ArrayList<>();
        sql = "SELECT * FROM Elementos WHERE TipoElemento = ?"; // Verifica que "TipoElemento" sea el nombre correcto de
                                                                // la columna
        try {
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipo);
            rs = ps.executeQuery();

            while (rs.next()) {
                ElementosVo l = new ElementosVo();
                l.setNombre(rs.getString("NombreElemento"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setCosto(rs.getInt("Costo"));
                l.setNumeroPlaca(rs.getInt("N_placa"));
                l.setTipo(rs.getString("TipoElemento"));
                l.setFechaIngreso(rs.getDate("FechaIngresoElemento").toLocalDate());
                l.setCategoria(rs.getInt("categoriaElemento"));
                l.setNumeroAula(rs.getInt("NumAula"));
                l.setDescripcion(rs.getString("Descripcion"));
                l.setEstado(rs.getString("EstadoElemento"));
                l.setUsu(rs.getInt("usuario_fk"));

                elementos.add(l);
            }
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en la consulta: " + e.getMessage());
        } finally {
            con.close();
        }

        return elementos;
    }
    public List<ElementosVo> getElementosByUsuarioId(int idUsuario) throws SQLException {
    List<ElementosVo> elementos = new ArrayList<>();
    sql = "SELECT * FROM Elementos WHERE usuario_fk = ?";
    try {
        con = Conexion.conectar();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario);
        rs = ps.executeQuery();

        while (rs.next()) {
            ElementosVo l = new ElementosVo();
            l.setNombre(rs.getString("NombreElemento"));
            l.setCantidad(rs.getInt("cantidad"));
            l.setCosto(rs.getInt("Costo"));
            l.setNumeroPlaca(rs.getInt("N_placa"));
            l.setTipo(rs.getString("TipoElemento"));
            l.setFechaIngreso(rs.getDate("FechaIngresoElemento").toLocalDate());
            l.setCategoria(rs.getInt("categoriaElemento"));
            l.setNumeroAula(rs.getInt("NumAula"));
            l.setDescripcion(rs.getString("Descripcion"));
            l.setEstado(rs.getString("EstadoElemento"));
            l.setUsu(rs.getInt("usuario_fk"));

            elementos.add(l);
        }
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en la consulta: " + e.getMessage());
        } finally {
            con.close();
        }

        return elementos;
    }
    
    // Contador de elementos
    public List<ElementosVo> contadorElementos() throws SQLException {

        // Creamos una lista/arreglo basada en ELementosVo 
        List<ElementosVo> Elementos = new ArrayList<>();

        // Asignamos una consulta que muestre cuantos elementos hay en la base de datos.
        sql = "SELECT count(*) as contado FROM Elementos";

        // Inicializamos la comsulta.
        try {
            System.out.println("Se estan contando elementos...");
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ElementosVo l = new ElementosVo();
                l.setCantidad(rs.getInt("contado"));
                Elementos.add(l);
                Elementos.size();
            }
            ps.close();
            System.out.println("Cuenta de elementos finalizada.");
            System.out.println("Comprueba la vista correspondiente para comprobar el correcto funcionamiento de la consulta.");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return Elementos;
    }


}
