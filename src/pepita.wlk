import wollok.game.*
import direcciones.*
object pepita {

	var energia = 10000
	var property position = game.at(0, 0)
	var perseguidor = silvestre

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - (kms * 9)
	}

	method energia() {
		return energia
	}
	method sinEnergia() = energia <= 0

	method image() = "pepita-" + self.estado() + ".png"
	
	method estado(){  
		return if (self.atrapada()) "gris" else "libre"
	}
	method atrapada() = position == perseguidor.position()


	method mover(direccion) {

		var antiguaPosicion = self.position()

		if (! self.sinEnergia() && ! self.atrapada()){
			position = direccion.nuevaPosicion(self.position())
			self.volar(1)
		}
	}
}

object silvestre {
    
	const presa = pepita

    method image() = "silvestre.png"

    method position(){
        if (presa.position().x() < 3){
            return game.at(3, 0)
        } else {
            return game.at(presa.position().x(), 0)
        }
    }
	
}