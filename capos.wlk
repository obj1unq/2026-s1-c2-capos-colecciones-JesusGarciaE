object rolando {
    var capacidadMochila = 2 
    const artefactosEnMochila = #{}
    const artefactosVistos = []
    var poder = 5

    method encontrarArtefacto(_artefacto){
        if (self.verificarMochila()){
            artefactosEnMochila.add(_artefacto)
        }
    artefactosVistos.add(_artefacto)    
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
    
    method artefactosVistos() {
        return artefactosVistos
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
    method poderRolando(){
        return poder + poder.artefacto
    }
}


object espadaDelDestino {
    var esPrimerUso = true
    method poder(){
        if(esPrimerUso){
            return rolando.poder * 2
        }
        return rolando.poder * 1.5
    }
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