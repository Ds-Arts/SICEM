package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PrestamosDao {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    private int r;

    public PrestamosDao() {
        con = Conexion.conectar(); // Obtener la conexión desde tu clase de conexión
    }

    public int registrar(PrestamosVo prestamo) throws SQLException {
        sql = "INSERT INTO propiedad(usuario_fk, elemento_fk, fecha_transpaso, tipo, fecha_inicio, fecha_fin) " +
              "VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, prestamo.getUsuarioFk());
            ps.setInt(2, prestamo.getElementoFk());
    
            // Validar y manejar la fecha de transpaso
            if (prestamo.getFechaTranspaso() != null) {
                ps.setDate(3, java.sql.Date.valueOf(prestamo.getFechaTranspaso()));
            } else {
                ps.setNull(3, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            }
    
            ps.setBoolean(4, prestamo.isTipo());
    
            // Validar y manejar la fecha de inicio
            if (prestamo.getFechaInicio() != null) {
                ps.setDate(5, java.sql.Date.valueOf(prestamo.getFechaInicio()));
            } else {
                ps.setNull(5, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            }
    
            // Validar y manejar la fecha de fin
            if (prestamo.getFechaFin() != null) {
                ps.setDate(6, java.sql.Date.valueOf(prestamo.getFechaFin()));
            } else {
                ps.setNull(6, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            }
    
            r = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
    

    public List<PrestamosVo> listarPrestamos() throws SQLException {
        List<PrestamosVo> prestamos = new ArrayList<>();
        sql = "SELECT usuario_fk, elemento_fk, fecha_transpaso, tipo, fecha_inicio, fecha_fin FROM propiedad";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int usuarioFk = rs.getInt("usuario_fk");
                int elementoFk = rs.getInt("elemento_fk");
                LocalDate fechaTranspaso = rs.getDate("fecha_transpaso").toLocalDate();
                boolean tipo = rs.getBoolean("tipo");
                LocalDate fechaInicio = rs.getDate("fecha_inicio").toLocalDate();
                LocalDate fechaFin = rs.getDate("fecha_fin").toLocalDate();

                PrestamosVo prestamo = new PrestamosVo(usuarioFk, elementoFk, fechaTranspaso, tipo, fechaInicio, fechaFin);
                prestamos.add(prestamo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return prestamos;
    }
 


    
    // Otros métodos DAO según tus necesidades

    public void cerrarConexion() throws SQLException {
        con.close();
    }
}
