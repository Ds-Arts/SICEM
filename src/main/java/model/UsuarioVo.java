package model;

public class UsuarioVo {
    private int id;
    private String nombre;
    private String apellido;
    private String email;
    private int numIdentificacion;
    private String contrasena;
    private String usuario;
    private String activo;

    public UsuarioVo() {

    }

    public UsuarioVo(int id, String nombre, String apellido, String email, int numIdentificacion, String contrasena,
            String usuario, String activo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.numIdentificacion = numIdentificacion;
        this.contrasena = contrasena;
        this.usuario = usuario;
        this.activo = activo;
    }

    public UsuarioVo(String nombre2, String nombre3, String apellido2, String email2, Integer numIdentificacion2,
            String usuario2, String activo2) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNumIdentificacion() {
        return numIdentificacion;
    }

    public void setNumIdentificacion(int numIdentificacion) {
        this.numIdentificacion = numIdentificacion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

}
