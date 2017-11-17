package ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import viewModel.RecetaModel
import domain.Receta
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import domain.Ingrediente
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class RecetaDetallaWindow extends Dialog<RecetaModel> {

	new(WindowOwner owner, Receta unaReceta) {
		super(owner, new RecetaModel(unaReceta))
		modelObject.recetaSeleccionada = unaReceta
		modelObject.buscarIngredientes()
	}

	override createContents(Panel mainPanel) {
		taskDescription = "Detalle Receta"

		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Label(firstPanel) => [
			text = "Nombre de la receta seleccionada : "
		]
	
		new Label(firstPanel) => [
			//text = "Nombre de la receta"
			value <=> "recetaSeleccionada.descripcion"
		]
		
		new Label(firstPanel) => [
			text = "Ingredientes : "
		]
		
		val secondPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		
		val gridProcesos = new Table<Ingrediente>(secondPanel, typeof(Ingrediente)) => [
			numberVisibleRows = 10
			items <=> "ingredientes"
			
			
		]
		
		new Column<Ingrediente>(gridProcesos) => [
			title = "Ingredientes"
			bindContentsToProperty("descripcion")
			fixedSize = 240
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Volver a la Seleccion de Receta"
			onClick([|this.close])
		]
		
		}
	
}