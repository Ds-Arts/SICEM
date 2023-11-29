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
        sql = "INSERT INTO propiedad(cuentadante_fk,prestatario_fk,elemento_fk, fecha_transpaso, tipo, fecha_inicio, fecha_fin) " +
              "VALUES (?, ?, ?, ?, ?, ?,?)";
   
        try {
            ps = con.prepareStatement(sql); 
            
            ps.setInt(1, prestamo.getCuentadantefk());
            ps.setInt(2, prestamo.getPrestatariofk()); 
            ps.setInt(3, prestamo.getElementoFk());
    
            // Validar y manejar la fecha de transpaso
            if (prestamo.getFechaTranspaso() != null) {
                ps.setDate(4, java.sql.Date.valueOf(prestamo.getFechaTranspaso()));
            } else {
                ps.setNull(4, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            }
    
            ps.setBoolean(5, prestamo.isTipo());
    
            // Validar y manejar la fecha de inicio
            if (prestamo.getFechaInicio() != null) {
                ps.setDate(6, java.sql.Date.valueOf(prestamo.getFechaInicio()));
            } else {
                ps.setNull(6, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            }
    
            // Validar y manejar la fecha de fin
            if (prestamo.getFechaFin() != null) {
                ps.setDate(7, java.sql.Date.valueOf(prestamo.getFechaFin()));
            } else {
                ps.setNull(7, Types.DATE); // Opcional: Establecer como nulo si la fecha es null
            } 
            
            System.out.println(ps);
            System.out.println(sql);
            System.out.println("AA");
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
                    int usu= rs.getInt("cuentadante_fk");
                    int us= rs.getInt("prestatario_fk");
                    int u= rs.getInt("prestatario_fk");
                    PrestamosVo prestamo = new PrestamosVo(cuentadantefk, elementoFk, fechaTranspaso, tipo, fechaInicio, fechaFin,prestatario_fk,usu,us, u);
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

    // Contador de elementos
    public List<PrestamosVo> contadorPrestamos() throws SQLException {

        // Creamos una lista/arreglo basada en ELementosVo 
        List<PrestamosVo> Prestamos = new ArrayList<>();

        // Asignamos una consulta que muestre cuantos elementos hay en la base de datos.
        sql = "SELECT count(*) as contado FROM propiedad";

        // Inicializamos la comsulta.
        try {
            System.out.println("Se estan contando prestamos...");
            con = Conexion.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                PrestamosVo prestamo = new PrestamosVo();
                prestamo.setUs(rs.getInt("contado"));
                Prestamos.add(prestamo);
                Prestamos.size();
            }
            ps.close();
            System.out.println("Cuenta de prestamos finalizada.");
            System.out.println("Comprueba la vista correspondiente para comprobar el correcto funcionamiento de la consulta.");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada " + e.getMessage().toString());
        } finally {
            con.close();
        }

        return Prestamos;
    }

    // Ultimos 4 prestamos
    public List<PrestamosVo> ultimosPrestamos() throws SQLException {
        List<PrestamosVo> prestamos = new ArrayList<>();
        sql = "SELECT cuentadante_fk as id_cuenta, (SELECT usuarios.nombre from usuarios where usuarios.id = propiedad.cuentadante_fk) as nom_cuenta, prestatario_fk as id_presta, (SELECT usuarios.nombre from usuarios where usuarios.id = propiedad.prestatario_fk) as nom_presta, elemento_fk as id_elemento, (SELECT elementos.NombreElemento from elementos where elementos.N_placa = propiedad.elemento_fk) as nom_elemento FROM propiedad inner join usuarios as usu1 on propiedad.cuentadante_fk = usu1.id inner join usuarios as usu2 on propiedad.cuentadante_fk = usu2.id inner join elementos on elementos.N_placa = propiedad.elemento_fk limit 5;";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                //Trae el id y luego el nombre
                int getCuentadantefk = rs.getInt("id_cuenta");
                String getNom_cuenta= rs.getString("nom_cuenta");

                int getPrestatariofk = rs.getInt("id_presta");
                String getNom_presta= rs.getString("nom_presta");

                int getElementoFk = rs.getInt("id_elemento");
                String getNom_elemento = rs.getString("nom_elemento");

                PrestamosVo prestamo = new PrestamosVo(
                    getCuentadantefk, getNom_cuenta, 
                    getPrestatariofk, getNom_presta,
                    getElementoFk, getNom_elemento
                );
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
