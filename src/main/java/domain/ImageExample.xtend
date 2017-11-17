package domain

import org.uqbar.commons.model.annotations.Observable

@Observable
class ImageExample {
	String imagePath = "heladera.jpg"
	def getImagePath() {
       "heladera.jpg"
   }
}