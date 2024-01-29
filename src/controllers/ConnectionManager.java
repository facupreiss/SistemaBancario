package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class ConnectionManager<T> {

	private static ConnectionManager<?> instance;

	private Connection con;

	private ConnectionManager() {
		crearConexion();
	}

	private void crearConexion() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String puerto = "3306";
			String base = "tpfinal";
			String url = "jdbc:mysql://localhost:" + puerto + "/" + base;
			String usuario = "root";
			String contrasena = "";
			con = DriverManager.getConnection(url, usuario, contrasena);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public Integer insertOrUpdate(String consulta, BaseMapper<T> mapper, T objeto) {
		Integer resultado = 0;
		try {
			// Preparar la declaración SQL utilizando la consulta proporcionada
			PreparedStatement prepareStatement = this.con.prepareStatement(consulta);
			 // Validar y establecer los parámetros en la declaración SQL utilizando el mapper
			prepareStatement = mapper.validarParametros(prepareStatement, objeto);
			 // Ejecutar la actualización y guardo  la cantidad de filas afectadas 
			resultado = prepareStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultado;
	}

	public ResultSet selectParametrizado(String consulta, BaseMapper<T> mapper, T objeto) {

		ResultSet resultSet = null;
		try {
			PreparedStatement prepareStatement = this.con.prepareStatement(consulta);
			prepareStatement = mapper.validarParametros(prepareStatement, objeto);
			//Guardar los datos obtenidos de mi consulta en un ResultSet
			resultSet = prepareStatement.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultSet;
	}

	public List<T> select(String consulta, BaseMapper<T> mapper) {
		List<T> resultado = null;
		try {
			Statement statement = this.con.createStatement();
			ResultSet result = statement.executeQuery(consulta);
			// Utilizar el mapper para convertir el ResultSet a una lista de objetos
			resultado = mapper.toList(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultado;
	}

	//Patron de diseño Singleton para obtener una unica instancia de ConnectionManager
	public static <T> ConnectionManager<T> getInstance() {
		if (instance == null) {
			instance = new ConnectionManager<>();
		}
		return (ConnectionManager<T>) instance;
	}

}
