import wollok.game.*

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
	method position() = position

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

object silvestre {
    
    var property position = game.at(3,0)

    method image() = "silvestre.png"

    method position(){
        if (pepita.position().x() < 3){
            return game.at(3, 0)
        } else {
            return game.at(pepita.position().x(), 0)
        }
    }
}