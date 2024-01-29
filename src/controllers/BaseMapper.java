package controllers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public interface BaseMapper<T> {
	public T toEntity(ResultSet resultSet); //Convierte un ResultSet a objeto tipo T
	public List<T> toList(ResultSet resultSet); //De un array de resultados, los conviertes a objetos tipo T
	public PreparedStatement validarParametros(PreparedStatement prepareStatement, T parametro); // validación y configuración de los parámetros en el PreparedStatement
}
