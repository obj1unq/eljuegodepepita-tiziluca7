import wollok.game.*
import direcciones.*
import extras.*
object pepita {

	var energia = 10000
	var property position = game.at(0, 0)
	var perseguidor = silvestre

	method init(){

		energia = 10000
		position = game.at(0,0)
	}

	method comer(comida) {
		try {
			self.obtener(comida)
		} catch e{
			// nada
		}
	}

	method obtener(comida){
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(game.uniqueCollider(self))
	}

	method volar(kms) {
		
		if (self.sinEnergia()) self.perder() else energia = energia - (kms * 9)
	}

	method energia() {
		return energia
	}

	method sinEnergia() = energia <= 9

	method text() = "\n\n\n" + "energia " + energia

	method textColor() = "F2F527E6"

	method image() = "pepita-" + self.estado() + ".png"
	
	method estado(){ return if (self.atrapada() || self.sinEnergia()) "gris" else "libre" }

	method atrapada() = self.position() == perseguidor.position()

	method estaGris() = (self.sinEnergia() || self.atrapada())

	method mover(direccion) {

    	var antiguaPosicion = self.position()
		var nuevaPosicion = direccion.nuevaPosicion(antiguaPosicion)

    	if (!self.estaGris() && self.puedeMoverA(nuevaPosicion)) {

			position = nuevaPosicion
			self.volar(1)
		}
	}
	
	method caer() {

		var nuevaPosicion = position.down(1)

    	if (self.position().y() >= 1 && self.puedeMoverA(nuevaPosicion)) {

        	position = nuevaPosicion
		}
	}

	method puedeMoverA(nuevaPosicion){

		var antiguaPosicion = self.position()
		position = nuevaPosicion
		var sePuedeMover = (game.colliders(self).any({ cualquierCosa => !self.esAtravesable(cualquierCosa) }))
		position = antiguaPosicion
		
		return !sePuedeMover
	}

	method esAtravesable(cualquierCosa){
		try {
			return cualquierCosa.puedeSerAtravesado()
		} catch e {
			return true
		}
	}

	method perder(){
		game.removeTickEvent("gravedad")
		game.say(self, "¡PERDÍ!")
		game.schedule(2000, { game.stop() })
	}
	method ganar(){
		game.removeTickEvent("gravedad")
		game.say(self, "¡GANÉ!")
		game.schedule(2000, {game.stop()})
	}
}

object silvestre {
    
	const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

	method x() {

        const xDePresa = presa.position().x()

		return if (xDePresa < 3) 3 else xDePresa
    }
}