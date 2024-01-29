package controllers;

import java.util.List;


public interface BaseController<T> {
	public abstract List<T> getAll(); //Representa la operación de obtener todos los registros de la entidad.
	public abstract T getById(int id); 
	public abstract int insert(T t);
	public abstract  T getByParam(T t, String consulta);
	public abstract int update(T t);
}
