package ui

import domain.Alimento
import domain.Categoria
import domain.Receta
import java.util.HashMap
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import viewModel.HeladeraModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import domain.Sector

class HeladeraWindow extends SimpleWindow<HeladeraModel> {

	new(WindowOwner parent) {
		super(parent, new HeladeraModel)
		title = "Heladera v0.1"
		taskDescription = "Pantalla Inicial"

		modelObject.search
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

//		new Label(firstPanel) => [
//			text = "Ingrese un alimento"
//		]
//
//		new TextBox(firstPanel) => [
//			width = 100
//			value <=> "example.nombre"
//		]
//
//		new Label(firstPanel) => [
//			text = "Ingrese una cantidad"
//		]
//
//		new NumericField(firstPanel) => [
//			width = 100
//			value <=> "example.cantidad"
//			
//		]
//		
//		new Button(firstPanel) => [
//			caption = "Buscar"
//			onClick([|modelObject.search])
//			setAsDefault
//			disableOnError
//		]
//
//		new Button(firstPanel) => [
//			caption = "Limpiar"
//			onClick([|modelObject.clear])
//		]		

		val secondPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		val gridPanel = new Panel(secondPanel)
		
//		val gridProcesos = new Table<Alimento>(gridPanel, typeof(Alimento)) => [
//			numberVisibleRows = 10
//			items <=> "alimentos"
//			value <=> "alimentoSeleccionado"
//		]
//
//		new Column<Alimento>(gridProcesos) => [
//			title = "Alimento"
//			bindContentsToProperty("nombre")
//			fixedSize = 150
//		]
//
//		new Column<Alimento>(gridProcesos) => [
//			title = "Cantidad"
//			bindContentsToProperty("cantidad")
//			fixedSize = 120
//		]
//
//		new Column<Alimento>(gridProcesos) => [
//			title = "Unidad"
//			bindContentsToProperty("unidad.descripcion")
//			fixedSize = 100
//		]
//		
		val buttonPanel = new Panel(secondPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Button(buttonPanel) => [
			caption = "Agregar Alimento"
			onClick([|this.openDialog(new AlimentoWindow(this, new Alimento("", Double.NaN, null, new Categoria("Nula"), new Sector("Nula"), Double.NaN)))])
		]
		
		new Button(buttonPanel) => [
			caption = "Recetas"
			onClick([|this.openDialog(new RecetaWindow(this, new Receta("", "", new HashMap<Alimento, Double>)))])
		]
	}

	override protected addActions(Panel actionsPanel) {
//		new Button(actionsPanel) => [
//			caption = "Aceptar"
//			onClick([|this.close()])
//		]
//		new Button(actionsPanel) => [
//			caption = "Cancelar"
//			onClick([|this.close()])
//		]
	}
	
	def editarReceta(Receta unaReceta){
//		this.openDialog(new EditarAlimento(this, unAlimento))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
