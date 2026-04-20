object rolando {
    var capacidadMochila = 2 
    const artefactosEnMochila = #{}

    method encontrarArtefacto(_artefacto){
        if (self.verificarMochila()){
            artefactosEnMochila.add(_artefacto)
        }
    }
    method verificarMochila(){
        return artefactosEnMochila.size() < capacidadMochila
    }
    method capacidadMochila(_capacidadMochila){
        capacidadMochila = _capacidadMochila
    }
    method artefactosEnMochila(){
        return artefactosEnMochila
    }
    method dejarObjetosEnVivienda(vivienda){
        vivienda.dejarObjetosEn(artefactosEnMochila)
        artefactosEnMochila.clear()
    }
    method posesiones() {
        return artefactosEnMochila + castillo.artefactosEnCastillo()
    }
     method artefactoParticular(artefacto){
           return self.posesiones().contains(artefacto)
     }
}


object espadaDelDestino {
}

object libroDeHechizos {
}

object collarDivino {
}

object armaduraDeAceroValyrio {
}

object castillo {
    const artefactosEnCastillo = #{}
    method dejarObjetosEn(mochila){
        artefactosEnCastillo.addAll(mochila)
    }
    method artefactosEnCastillo(){
            return artefactosEnCastillo
    } 
}