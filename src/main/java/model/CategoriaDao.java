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
            con = Conexion.conectar(); // abrir conexión
            ps = con.prepareStatement(sql); // preparar sentencia

            ps.setString(1, categoria.getNombreCategoria());
            ps.setString(2, categoria.getDescripcionCategoria());

            System.out.println("Se registró el rol correctamente");
            System.out.println(ps);
            ps.executeUpdate(); // Ejecutar sentencia
            ps.close(); // cerrar sentencia
            System.out.println("Se registró el rol correctamente");
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
        sql = "SELECT nombreCategoria FROM Categoria";

        try {
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                CategoriaVo categoria = new CategoriaVo();
                categoria.setNombreCategoria(rs.getString("nombreCategoria"));
                categorias.add(categoria);
                System.out.println(sql);
                System.out.println(r);
                System.out.println("Se consulto categoria");
                System.out.println(categorias.size());
            }
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutado " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return categorias;
    }
}
