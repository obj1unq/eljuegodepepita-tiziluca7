import src.randomizer.*
import wollok.game.*
import pepita.*

object manzana {

	const base = 5
	var madurez = 2
	var property position = null

	method energiaQueOtorga() {
		return base * madurez
	}
	
	method madurar() {
		madurez = madurez + 1
	}
	method image() = "manzana.png"

	method reposicionar(){
	var x = 0.randomUpTo(game.width() - 1)
    var y = 0.randomUpTo(game.height() - 1)
    position = game.at(x, y)
	game.addVisual(self)
	}
}


object alpiste {

	var property position = null
	method energiaQueOtorga() {
		return 20
	}
	method image() = "alpiste.png"

	method reposicionar(){

	var x = 0.randomUpTo(game.width() - 1)
    var y = 0.randomUpTo(game.height() - 1)
    position = game.at(x, y)
	game.addVisual(self)
	}
	}


object alpiste2 {

	var property position = null

	method energiaQueOtorga() {
		return 20
	}
	method image() = "alpiste.png"

	method reposicionar(){

	var x = 0.randomUpTo(game.width() - 1)
    var y = 0.randomUpTo(game.height() - 1)
    position = game.at(x, y)
	game.addVisual(self)

}
}

object comida {

	const comidas = []

	method reaparecer(){
		if (comidas.size() < 3){
			manzana.reposicionar()
			alpiste.reposicionar()
			alpiste2.reposicionar()
		}
	}
}