import pepita.*
import wollok.game.*

object izquierda {

  method nuevaPosicion(posicionActual){

    return if ( posicionActual.x() >= 1){
					posicionActual.left(1)
    } else {
        posicionActual
    }
  }
}

object derecha {

  method nuevaPosicion(posicionActual){

    return if (posicionActual.x() < (game.width() - 1) ){
				posicionActual.right(1) 
    } else {
        posicionActual
    }   
  }
}

object abajo {
  
  method nuevaPosicion(posicionActual){
    
    return if ( posicionActual.y() >= 1){
				posicionActual.down(1)
    } else {
        posicionActual
    }
  }
}

object arriba {
  
  method nuevaPosicion(posicionActual){
    
    return if ( posicionActual.x() < (game.height() - 1)){
				posicionActual.up(1) 
    } else {
        posicionActual
    }
  }
}
