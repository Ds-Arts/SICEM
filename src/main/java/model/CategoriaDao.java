package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDao {

    Connection con; // objeto de conexión
    PreparedStatement ps; // preparar sentencias
    ResultSet rs; // almacenar consutas
    String sql = null;
    int r; // cantidad de filas que devuelve una sentencia

    // metodos con la estructuraa funcioanl
    public void crearCategoria(CategoriaVo categoria) throws SQLException {
        sql = "INSERT INTO Categoria (nombreCategoria,DescripcionCategoria) VALUES (?, ?)";
        try {
            System.out.println("Se estan registrando categorias...\n");
            con = Conexion.conectar(); // abrir conexión
            ps = con.prepareStatement(sql); // preparar sentencia

            ps.setString(1, categoria.getNombreCategoria());
            ps.setString(2, categoria.getDescripcionCategoria());
            System.out.println(ps  + "\n");
            ps.executeUpdate(); // Ejecutar sentencia
            ps.close(); // cerrar sentencia
            System.out.println("Registro de categoria finalizada.");
        } catch (Exception e) {
            System.out.println();
            System.out.println("Error en el regisro " + e.getMessage().toString());

        } finally {
            con.close();
        }
    }

    // metodo con las estructura funcional
    public List<CategoriaVo> obtenerCategorias() throws SQLException {
        List<CategoriaVo> categorias = new ArrayList<>();
        sql = "SELECT * FROM Categoria";

        try {
            System.out.println("Se esta consultando categorias...");
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);

            while (rs.next()) {
                CategoriaVo categoria = new CategoriaVo();
                categoria.setNombreCategoria(rs.getString("nombreCategoria"));
                categoria.setDescripcionCategoria(rs.getString("DescripcionCategoria"));
                categorias.add(categoria);

                //Este es un contador.
                categorias.size();
            }
            ps.close();

            //Testing zone...
            System.out.println("Consulta de categorias finalizada.");
            //Cuantas filas (registros) se tragieron desde la base de datos gracias a la consulta.
            System.out.println("Filas consultadas: " + categorias.size());

        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutado " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return categorias;
    }

    public List<CategoriaVo> contadorCategorias() throws SQLException {

        // Creamos una lista/arreglo basada en UsuarioVo
        List<CategoriaVo>  categorias = new ArrayList<>();

        // Asignamos una consulta que muestre cuantos usuarios hay en la base de datos.
        sql = "SELECT count(*) as contado FROM Categoria";

        // Inicializamos la comsulta.
        try {
            System.out.println("Se estan contando usuarios...");
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                CategoriaVo l = new CategoriaVo();
                l.setIdCategoria(rs.getInt("contado"));
                categorias.add(l);
                categorias.size();
            }
            ps.close();
            System.out.println("Cuenta de usuarios finalizada.");
            System.out.println("Comprueba la vista correspondiente para comprobar el correcto funcionamiento de la consulta.");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return categorias;
    }
}
