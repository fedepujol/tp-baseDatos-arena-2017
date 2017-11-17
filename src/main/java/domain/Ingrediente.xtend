package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Ingrediente {
	//Alimento alimento
	//Double cantidad
	String descripcion

	//new(Alimento unAlimento, Double unaCantidad) {
	new(String unaDescripcion){
//		alimento = unAlimento
//		cantidad = unaCantidad
		descripcion = unaDescripcion
	}

//	def getDescripcionEntera() {
//		var result = new StringBuilder
//		result => [
//			append(alimento.nombre)
//			append(" - ")
//			append(cantidad.toString)
//			append(" ")
//			append(alimento.unidad.descripcion)
//		]
//		result.toString
//	}
//
//	override def String toString() {
//		descripcionEntera
//	}
//
//	def esValido() {
//		alimento !== null && cantidad > 0
//	}
}
