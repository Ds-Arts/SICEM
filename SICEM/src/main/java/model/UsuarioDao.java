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
    static String sql = null;
    private int r;

    public int registrarUsuario(UsuarioVo nuevoUsuario) throws SQLException {
        sql = "INSERT INTO usuarios(nombre, apellido, email,numIdentificacion,contrasena,usuario, activo) VALUES (?, ? , ? , ? , ?, ?, ?)";
        try (Connection conexion = Conexion.conectar();
                PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, nuevoUsuario.getNombre());
            ps.setString(2, nuevoUsuario.getApellido());
            ps.setString(3, nuevoUsuario.getEmail());
            ps.setInt(4, nuevoUsuario.getNumIdentificacion());
            ps.setString(5, nuevoUsuario.getContrasena());
            ps.setString(6, nuevoUsuario.getUsuario());
            ps.setString(7, nuevoUsuario.getActivo()); // Establecer el estado de activación
            r = ps.executeUpdate();
            System.out.println("Se registró el usuario correctamente");

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
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNumIdentificacion(rs.getInt("numIdentificacion"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setActivo(rs.getString("activo"));
                usuarios.add(usuario);
            }
            System.out.println("Consulta exitosa");
        } catch (Exception e) {
            System.out.println("La consulta no pudo ser ejecutada: " + e.getMessage());
        }
        return usuarios;
    }

    public static UsuarioVo verificarUsuario(Integer numIdentificacion, String contrasena) throws SQLException {
        System.out.println("entro al inicio");
        UsuarioVo usuarioValidado = null;
        String sql = "SELECT * FROM usuarios WHERE numIdentificacion = ? AND contrasena = ?";
        try (Connection conexion = Conexion.conectar();
                PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, numIdentificacion);
            ps.setString(2, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuarioValidado = new UsuarioVo();
                    usuarioValidado.setNumIdentificacion(rs.getInt("numIdentificacion"));
                    usuarioValidado.setContrasena(rs.getString("contrasena"));
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
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setNumIdentificacion(rs.getInt("numIdentificacion"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setActivo(rs.getString("activo"));
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
                    usuarioEncontrado.setApellido(rs.getString("apellido"));
                    usuarioEncontrado.setEmail(rs.getString("email"));
                    usuarioEncontrado.setNumIdentificacion(rs.getInt("numIdentificacion"));
                    usuarioEncontrado.setUsuario(rs.getString("usuario"));
                    usuarioEncontrado.setActivo(rs.getString("activo"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el usuario por ID: " + e.getMessage());
        }
        return usuarioEncontrado;
    }
}
