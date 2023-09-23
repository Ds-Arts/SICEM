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
        sql = "INSERT INTO propiedad(cuentadante_fk, elemento_fk, fecha_transpaso, tipo, fecha_inicio, fecha_fin,prestatario_fk) " +
              "VALUES (?, ?, ?, ?, ?, ?,?)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, prestamo.getCuentadantefk());
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
            ps.setInt(7, prestamo.getCuentadantefk());
            r = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
    

    public List<PrestamosVo> listarPrestamos() throws SQLException {
        List<PrestamosVo> prestamos = new ArrayList<>();
        sql = "SELECT cuentadante_fk, elemento_fk, fecha_transpaso, tipo, fecha_inicio, fecha_fin,prestatario_fk FROM propiedad";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int cuentadantefk = rs.getInt("cuentadante_fk");
                int elementoFk = rs.getInt("elemento_fk");
                LocalDate fechaTranspaso = rs.getDate("fecha_transpaso").toLocalDate();
                boolean tipo = rs.getBoolean("tipo");
                LocalDate fechaInicio = rs.getDate("fecha_inicio").toLocalDate();
                LocalDate fechaFin = rs.getDate("fecha_fin").toLocalDate();
                int prestatario_fk = rs.getInt("prestatario_fk");
                PrestamosVo prestamo = new PrestamosVo(cuentadantefk, elementoFk, fechaTranspaso, tipo, fechaInicio, fechaFin,prestatario_fk);
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
