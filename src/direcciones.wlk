import pepita.*
import wollok.game.*


object arriba {
  
  method nuevaPosicion(posicionActual){
    
    return if ( posicionActual.y() < (game.height() - 1)){
				posicionActual.up(1) 
    } else {
        self.error("no hay camino")
    }
  }
}

object abajo {
  
  method nuevaPosicion(posicionActual){
    
    return if ( posicionActual.y() >= 1){
				posicionActual.down(1)
    } else {
        self.error("no hay camino")
    }
  }
}

object derecha {

  method nuevaPosicion(posicionActual){

    return if (posicionActual.x() < (game.width() - 1) ){
				posicionActual.right(1) 
    } else {
        self.error("no hay camino")
    }   
  }
}

object izquierda {

  method nuevaPosicion(posicionActual){

    return if ( posicionActual.x() >= 1){
					posicionActual.left(1)
    } else {
        self.error("no hay camino")
    }
  }
}
