package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Alimento {
	int id
	double cantidad
	String nombre
	UnidadMedida unidad
	Categoria categoria
	Sector sector
	double cantidadMinima
	
	new(String unNombre, double unaCantidad, UnidadMedida unaUnidad, Categoria unaCategoria, Sector unSector, double unaCantidadMinima ){
		nombre = unNombre
		cantidad = unaCantidad
		unidad = unaUnidad
		categoria = unaCategoria
		sector = unSector
		cantidadMinima = unaCantidadMinima
	}
	
	def esValido() {
		cantidad !== 0 && unidad !== null && nombre.length > 1
	}

}