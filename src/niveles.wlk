import pepita.*
import direcciones.*
import comidas.*
import extras.*
object nivel1 {

  method init(){

     game.clear()
        pepita.init()

        // controles
        keyboard.up().onPressDo    { pepita.mover(arriba) }
        keyboard.down().onPressDo  { pepita.mover(abajo) }
        keyboard.left().onPressDo  { pepita.mover(izquierda) }
        keyboard.right().onPressDo { pepita.mover(derecha) }

        // reiniciar con X
        keyboard.x().onPressDo { self.init() }

        // colisiones
        game.onCollideDo(silvestre, { alguien => alguien.perder() })
        game.onCollideDo(nido,      { alguien => alguien.ganar() })
        game.onCollideDo(pepita,    { algo => pepita.comer(algo)})

        // gravedad
        game.onTick(800, "gravedad", { pepita.caer() })
        game.onTick(3000, "comidaRandom", {comida.reaparecer()})

        // visuales
        game.addVisual(pepita)
        game.addVisual(silvestre)
        game.addVisual(muro1)
        game.addVisual(muro2)
        game.addVisual(nido)
  }
}