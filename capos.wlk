object rolando {
    var capacidadMochila = 2 
    const artefactosEnMochila = #{}
    var estaEnVivienda = true

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
    method estaEnVivienda(_estaEnVivienda){
        estaEnVivienda = _estaEnVivienda
    }
    method dejarObjetosEnVivienda(vivienda){
        if (estaEnVivienda) {
            vivienda.dejarObjetosEn(artefactosEnMochila)
            artefactosEnMochila.clear()
        }
    }
    method posesiones() {
        return artefactosEnMochila + castillo.artefactosEnCastillo()
    }
    // method artefactoParticular(){
    //         self.posesiones().find(artefactosEnMochila->)
    // }
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