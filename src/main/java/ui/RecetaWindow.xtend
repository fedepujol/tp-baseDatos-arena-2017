package ui

import domain.Receta
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
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
		taskDescription = "Ingrese los parametros"

		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val firstPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Label(firstPanel).text = "Descripcion del Alimento:"
		new TextBox(firstPanel) =>[
			width = 100
			value <=> "alimento.nombre"
		]
		
		new Label(firstPanel).text = "Categoria:"
		
		new Label(firstPanel).text = "Cantidad:"
		new NumericField(firstPanel) => [
			width = 100
			value <=> "alimento.cantidad"
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
