import wollok.game.*
import extras.*

object pepita {

	var energia = 100

	var property position = game.at(3,2)

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method atrapada() = position == silvestre.position()

	method image(){
		if (self.atrapada()){
			return "pepita-gris.png"
		} else {
			return "pepita.png"
		}
	}
	// method pepitaGris(){ image = "pepita-gris.png" }
}