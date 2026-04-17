import pepita.*

object silvestre {
    
    var property position = game.at(3,0)

    method image() = "silvestre.png"

    method position() = game.at(pepita.position().x(), 0)
}