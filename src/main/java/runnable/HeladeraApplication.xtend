package runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import ui.HeladeraWindow

class HeladeraApplication extends Application{
	
	new(HeladeraBootstrap bootstrap){
		super(bootstrap)
	}
	
	static def void main(String[] args) {
		new HeladeraApplication(new HeladeraBootstrap).start()
	}	
	
	override protected Window<?> createMainWindow() {
		return new HeladeraWindow(this)
	}
	
}