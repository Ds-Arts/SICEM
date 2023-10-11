package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	// Declarar atributos para la conexión
	private static final String bbdd = "jdbc:mysql://localhost:3310/elementos1";
	private static final String usuario = "root";
	private static final String clave = "1234";
	private static Connection con;

	public static Connection conectar() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(bbdd, usuario, clave);
			System.out.println("si conecto");
		} catch (Exception e) {
			System.out.println("Error de conexión a la base de datos " + e.getMessage().toString());
		}
		return con;
	}

	public static void main(String[] args) {
		Conexion.conectar();

	}

}
