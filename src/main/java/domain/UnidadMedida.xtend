package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
