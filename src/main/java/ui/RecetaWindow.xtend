package ui

import domain.Receta
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import viewModel.RecetaModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.NotNullObservable

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
			text = "Ingrese un alimento :"
			
		]
	
		new TextBox(firstPanel) => [
			width = 120
			value <=> "ingrediente"
		]
	
		new Button(firstPanel) => [
			caption = "Buscar"
			width = 120
			onClick([|modelObject.search])
//			setAsDefault
//			disableOnError
		]
		new Button(firstPanel) => [
			caption = "Limpiar"
			width = 120
			onClick([|modelObject.clear1])
		]		

		
		val secondPanel = new Panel(mainPanel)  => [
			layout = new HorizontalLayout()
	    ]	
	
		
		val gridProcesos = new Table<Receta>(secondPanel, typeof(Receta)) => [
			numberVisibleRows = 10
			items <=> "recetas"
			value <=> "recetaSeleccionada"
		]

//		new Column<Receta>(gridProcesos) => [
//			title = "Nombre"
//			bindContentsToProperty("nombre")
//			fixedSize = 150
//		]

		new Column<Receta>(gridProcesos) => [
			title = "Descripcion"
			bindContentsToProperty("descripcion")
			fixedSize = 240
		]

//		new Column<Receta>(gridProcesos) => [
//			title = "Ingredientes"
//			bindContentsToProperty("ingredientes")
//			fixedSize = 100
//		]


	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Volver a la Pantalla de Inicio"
			onClick([|this.close])
		]

//		new Button(actionsPanel) => [
//			caption = "Aceptar"
//			onClick([|this.accept])
//			setAsDefault
//		]
		
		new Button(actionsPanel) => [
			var elementSelected = new NotNullObservable("recetaSeleccionada")
			caption = "Detalles de la receta"
			onClick([|this.abrirDialogYrealizarQuery()])
			bindEnabled(elementSelected)
		]
		
		

	}
	
	def abrirDialogYrealizarQuery() {
		modelObject.buscarIngredientes()
		this.openDialog(new RecetaDetallaWindow(this,modelObject.recetaSeleccionada))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}
}

