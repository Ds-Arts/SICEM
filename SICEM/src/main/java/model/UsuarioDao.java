package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    private int r;

    public int registrarUsuario(UsuarioVo nuevoUsuario) throws SQLException {
        sql = "INSERT INTO usuarios(nombre, usuario, contrasena, activo) VALUES (?, ?, ?, ?)";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, nuevoUsuario.getNombre());
            ps.setString(2, nuevoUsuario.getUsuario());
            ps.setString(3, nuevoUsuario.getContrasena());
            ps.setBoolean(4, nuevoUsuario.isActivo()); // Establecer el estado de activación
            r = ps.executeUpdate();
            System.out.println("Se registró el usuario correctamente");

            // Crear cuenta para el nuevo usuario
            int idUsuario = obtenerUltimoIdUsuario(); // Obtener el ID del usuario recién registrado
            crearCuenta(idUsuario); // Crear una cuenta asociada al usuario
        } catch (Exception e) {
            System.out.println("Error en el registro: " + e.getMessage());
        }
        return r;
    }

    public int actualizarEstadoUsuario(int idUsuario, boolean activo) throws SQLException {
        sql = "UPDATE usuarios SET activo = ? WHERE id = ?";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setBoolean(1, activo);
            ps.setInt(2, idUsuario);
            r = ps.executeUpdate();
            if (r > 0) {
                System.out.println("Se actualizó el estado del usuario correctamente");
            } else {
                System.out.println("No se encontró ningún usuario con el ID proporcionado");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado del usuario: " + e.getMessage());
        }
        return r;
    }

    public boolean obtenerEstadoUsuario(int idUsuario) throws SQLException {
        boolean activo = false;
        sql = "SELECT activo FROM usuarios WHERE id = ?";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    activo = rs.getBoolean("activo");
                }
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el estado del usuario: " + e.getMessage());
        }
        return activo;
    }

  public List<UsuarioVo> obtenerUsuarios() throws SQLException {
        List<UsuarioVo> usuarios = new ArrayList<>();
        sql = "select concat(nombre,' ',apellido) as  nombre from usuarios ;";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsuarioVo usuario = new UsuarioVo();
                usuario.setNombre(rs.getString("nombre"));
                System.out.println(rs.getString("nombre"));
                usuarios.add(usuario);
            }
            System.out.println("Consulta exitosa");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada: " + e.getMessage());
        }
        return usuarios;
    }




    public List<UsuarioVo> listarUsuarios() throws SQLException {
        List<UsuarioVo> usuarios = new ArrayList<>();
        sql = "SELECT * FROM usuarios ORDER BY nombre ASC";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsuarioVo usuario = new UsuarioVo();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setActivo(rs.getBoolean("activo"));
                usuarios.add(usuario);
            }
            System.out.println("Consulta exitosa");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada: " + e.getMessage());
        }
        return usuarios;
    }

     public List<UsuarioVo> listarCuentadantes() throws SQLException {
        List<UsuarioVo> usuarios = new ArrayList<>();
        sql = "SELECT * FROM usuarios   where  ORDER BY nombre ASC";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsuarioVo usuario = new UsuarioVo();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setActivo(rs.getBoolean("activo"));
                usuarios.add(usuario);
            }
            System.out.println("Consulta exitosa");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada: " + e.getMessage());
        }
        return usuarios;
    }

    public UsuarioVo verificarUsuario(String usuario, String contrasena) throws SQLException {
        UsuarioVo usuarioValidado = null;
        sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuarioValidado = new UsuarioVo();
                    usuarioValidado.setId(rs.getInt("id"));
                    usuarioValidado.setNombre(rs.getString("nombre"));
                    usuarioValidado.setUsuario(rs.getString("usuario"));
                    usuarioValidado.setContrasena(rs.getString("contrasena"));
                    usuarioValidado.setActivo(rs.getBoolean("activo"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error al verificar el usuario: " + e.getMessage());
        }
        return usuarioValidado;
    }

    private int obtenerUltimoIdUsuario() throws SQLException {
        int idUsuario = 0;
        sql = "SELECT MAX(id) AS last_id FROM usuarios";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                idUsuario = rs.getInt("last_id");
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el último ID de usuario: " + e.getMessage());
        }
        return idUsuario;
    }

    public List<UsuarioVo> buscarUsuariosPorNombre(String nombre) throws SQLException {
        List<UsuarioVo> usuarios = new ArrayList<>();
        sql = "SELECT * FROM usuarios WHERE nombre LIKE ? ORDER BY nombre ASC";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, "%" + nombre + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    UsuarioVo usuario = new UsuarioVo();
                    usuario.setId(rs.getInt("id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setActivo(rs.getBoolean("activo"));
                    usuarios.add(usuario);
                }
                System.out.println("Consulta exitosa");
            }
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada: " + e.getMessage());
        }
        return usuarios;
    }

    public UsuarioVo buscarUsuarioPorId(int idUsuario) throws SQLException {
        UsuarioVo usuarioEncontrado = null;
        sql = "SELECT * FROM usuarios WHERE id = ?";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuarioEncontrado = new UsuarioVo();
                    usuarioEncontrado.setId(rs.getInt("id"));
                    usuarioEncontrado.setNombre(rs.getString("nombre"));
                    usuarioEncontrado.setUsuario(rs.getString("usuario"));
                    usuarioEncontrado.setContrasena(rs.getString("contrasena"));
                    usuarioEncontrado.setActivo(rs.getBoolean("activo"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el usuario por ID: " + e.getMessage());
        }
        return usuarioEncontrado;
    }

    private void crearCuenta(int idUsuario) throws SQLException {
        sql = "INSERT INTO cuentas(id_usuario, valor) VALUES (?, ?)";
        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            ps.setDouble(2, 0.0); // Saldo inicial de la cuenta
            ps.executeUpdate();
            System.out.println("Se creó la cuenta para el usuario con ID: " + idUsuario);
        } catch (Exception e) {
            System.out.println("Error al crear la cuenta: " + e.getMessage());
        }
    }
}
