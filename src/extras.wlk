import wollok.game.*
import pepita.*
object muro1 { 

    var property position = game.at(12, 8)

    method image() = "muro.png"

    method puedeSerAtravesado() = false
}

object muro2 { 

    var property position = game.at(16, 5)

    method image() = "muro.png"

    method puedeSerAtravesado() = false

}

object nido {

    var property position = game.at(20, 4)

    method image() = "nido.png"

}