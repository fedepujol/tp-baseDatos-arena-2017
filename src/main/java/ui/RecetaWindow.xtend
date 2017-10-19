package ui

import domain.Receta
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
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
		val firstPanel = new Panel(mainPanel)

		val gridProcesos = new Table<Receta>(firstPanel, typeof(Receta)) => [
			numberVisibleRows = 10
			items <=> "recetas"
			value <=> "recetaSeleccionada"
		]

		new Column<Receta>(gridProcesos) => [
			title = "Nombre"
			bindContentsToProperty("nombre")
			fixedSize = 150
		]

		new Column<Receta>(gridProcesos) => [
			title = "Descripcion"
			bindContentsToProperty("descripcion")
			fixedSize = 120
		]

		new Column<Receta>(gridProcesos) => [
			title = "Ingredientes"
			bindContentsToProperty("ingredientes.values")
			fixedSize = 100
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
