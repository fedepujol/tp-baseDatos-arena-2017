package ui

import domain.Alimento
import domain.Categoria
import domain.UnidadMedida
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import viewModel.AlimentoModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import domain.Sector

class AlimentoWindow extends Dialog<AlimentoModel> {

	new(WindowOwner owner, Alimento unAlimento) {
		super(owner, new AlimentoModel(unAlimento))
	}

	override createContents(Panel mainPanel) {
		taskDescription = "Ingrese los parametros"

		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(firstPanel).text = "Descripcion del Alimento:"
		new TextBox(firstPanel) => [
			width = 100
			value <=> "alimento.nombre"
		]

		new Label(firstPanel).text = "Categoria:"
		new Selector<Categoria>(firstPanel) => [
			width = 100
			value <=> "categoriaSeleccionada"
			val itemProperties = items <=> "categorias"
			itemProperties.adapter = new PropertyAdapter(typeof(Categoria), "nombre")
		]

		new Label(firstPanel).text = "Cantidad:"
		new NumericField(firstPanel) => [
			width = 100
			value <=> "alimento.cantidad"
		]
		
		new Label(firstPanel).text = "Limite minimo de Cantidad:"
		new NumericField(firstPanel) => [
			width = 100
			value <=> "alimento.cantidadMinima"
		]
		
		new Label(firstPanel).text = "Unidad"
		new Selector<UnidadMedida>(firstPanel) => [
			width = 100
			value <=> "unidadSeleccionada"
			val itemProperties = items <=> "unidades"
			itemProperties.adapter = new PropertyAdapter(typeof(UnidadMedida), "descripcion")
		]
		
		new Label(firstPanel).text = "Sector"
		new Selector<Sector>(firstPanel) => [
			width = 100
			value <=> "sectorSeleccionado"
			val itemProperties = items <=> "sectores"
			itemProperties.adapter = new PropertyAdapter(typeof(UnidadMedida), "descripcion")
		]

	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick([|this.close])
		]

		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick([|this.accept])
			setAsDefault
		]

	}

}
