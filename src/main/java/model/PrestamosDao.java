package model;

import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PrestamosDao {

    Connection con; // objeto de conexión
    PreparedStatement ps; // preparar sentencias
    ResultSet rs; // almacenar consutas
    String sql = null;
    int r; // cantidad de filas que devuelve una sentencia

    public int registrar(PrestamosVo prestamo) throws SQLException {

        // Si no existe un elemento con el mismo número de placa, proceder con el
        // registro
        sql = "INSERT INTO Prestamos(elemento_fk,usuario_fk,fecha_inicio,fecha_fin) VALUES(?.?,?,?)";
        try {
            con = Conexion.conectar(); // abrir conexión
            ps = con.prepareStatement(sql); // preparar sentencia
            ps.setInt(1, prestamo.getUaurioFk());
            ps.setInt(2, prestamo.getElementoFk());
            ps.setDate(3, Date.valueOf(prestamo.getFecha_inicio()));
            ps.setDate(4, Date.valueOf(prestamo.getFecha_fin()));

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

}
