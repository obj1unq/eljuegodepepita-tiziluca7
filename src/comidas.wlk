import wollok.game.*
import pepita.*

object manzana {

	const base = 5
	var madurez = 2
	var property position = game.at(4, 6)

	method energiaQueOtorga() {
		return base * madurez
	}
	
	method madurar() {
		madurez = madurez + 1
	}
	method image() = "manzana.png"
}

object alpiste {

	var property position = game.at(6, 3)

	method energiaQueOtorga() {
		return 20
	}
	method image() = "alpiste.png"
}