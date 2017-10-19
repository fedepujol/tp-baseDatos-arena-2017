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
	
	new(String unNombre, double unaCantidad, UnidadMedida unaUnidad, Categoria unaCategoria){
		nombre = unNombre
		cantidad = unaCantidad
		unidad = unaUnidad
		categoria = unaCategoria
	}
	
	def esValido() {
		cantidad !== 0 && unidad !== null && nombre.length > 1
	}

}
