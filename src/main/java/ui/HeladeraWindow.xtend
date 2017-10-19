package ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import viewModel.HeladeraModel
import org.uqbar.arena.widgets.tables.Table
import domain.Alimento
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class HeladeraWindow extends SimpleWindow<HeladeraModel> {

	new(WindowOwner parent) {
		super(parent, new HeladeraModel)
		title = "Heladera v0.1"
		taskDescription = "Busqueda"

		modelObject.search
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new VerticalLayout()
		]

		val gridProcesos = new Table<Alimento>(firstPanel, typeof(Alimento)) => [
			numberVisibleRows = 10
			items <=> "alimentos"
			value <=> "alimentoSeleccionado"
		]

		new Column<Alimento>(gridProcesos) => [
			title = "Alimento"
			bindContentsToProperty("nombre")
			fixedSize = 150
		]

		new Column<Alimento>(gridProcesos) => [
			title = "Cantidad"
			bindContentsToProperty("cantidad")
			fixedSize = 250
		]
		
		new Column<Alimento>(gridProcesos) => [
			title = "Unidad"
			bindContentsToProperty("unidad")
			fixedSize = 250
		]		
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick([|this.close()])
		]
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick([|this.close()])
		]
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
