package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class UnidadMedida {
	int id
	String descripcion

	new(String unaDescripcion) {
		descripcion = unaDescripcion
	}

	def esValida() {
		descripcion !== "" || descripcion.length > 1
	}
}
