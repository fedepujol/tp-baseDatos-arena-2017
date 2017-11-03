package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@Observable
class Alimento {
	int id
	Double cantidad
	String nombre
	UnidadMedida unidad
	Categoria categoria
	Sector sector
	Double cantidadMinima

	new(String unNombre, Double unaCantidad, UnidadMedida unaUnidad, Categoria unaCategoria, Sector unSector,
		Double unaCantidadMinima) {
		nombre = unNombre
		cantidad = unaCantidad
		unidad = unaUnidad
		categoria = unaCategoria
		sector = unSector
		cantidadMinima = unaCantidadMinima
	}

	def validateAlimento() {
		if (nombre.length <= 1) {
			throw new UserException("El nombre del alimento debe tener una longitud mayor a 1")
		}
		if (categoria === null) {
			throw new UserException("La categoria no puede estar vacia")
		}
		if (cantidad === null) {
			throw new UserException("La cantidad tiene que ser mayor a 0")
		}
		if (cantidadMinima === null) {
			throw new UserException("La cantidad minima tiene que ser mayor a 0")
		}
		if (unidad === null) {
			throw new UserException("Debe elegir una unidad de medida")
		}
		if (sector === null) {
			throw new UserException("Debe elegir un sector")
		}
	}

	def esValido() {
		cantidad !== 0 && unidad !== null && nombre.length > 1
	}

}
