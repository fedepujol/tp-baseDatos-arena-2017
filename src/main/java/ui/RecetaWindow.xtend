package ui

import domain.Ingrediente
import domain.Receta
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import viewModel.RecetaModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class RecetaWindow extends Dialog<RecetaModel> {

	new(WindowOwner owner, Receta unaReceta) {
		super(owner, new RecetaModel(unaReceta))
	}

	override createContents(Panel mainPanel) {
		taskDescription = "Recetas cargadas en el sistema"

		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(firstPanel) => [
			text = "Ingrese un alimento"
		]

		new TextBox(firstPanel) => [
			width = 100
		// value <=> "example.nombre"
		]

		new Button(firstPanel) => [
			caption = "Buscar"
			// onClick([|modelObject.search])
			setAsDefault
			disableOnError
		]

		new Button(firstPanel) => [
			caption = "Limpiar"
		// onClick([|modelObject.clear])
		]
		
		new Label(firstPanel).text = "Nombre Receta"
		
		new Selector<Receta>(firstPanel) => [
			width = 100
			value <=> "recetaSeleccionada"
			val itemProperty = bindItemsToProperty("recetas")
			itemProperty.adapter = new PropertyAdapter(typeof(Receta), "nombre")
			
		]
		
		new Label(firstPanel).text = "Descripcion"
		
		new TextBox(firstPanel) => [
			width = 110
			value <=> "recetaSeleccionada.descripcion"
		]

		new Label(firstPanel).text = "Ingredientes"
		
		new List<Ingrediente>(firstPanel) => [
			width = 100
			val itemProperty = bindItemsToProperty("recetaSeleccionada.ingredientes")
			itemProperty.adapter = new PropertyAdapter(typeof(Ingrediente), "descripcionEntera")
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
