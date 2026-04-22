object rolando {
    var capacidadMochila = 2 
    const artefactosEnMochila = #{}
    const artefactosVistos = []
    var poder = 5
// const pelearBatalla = {}
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
    method poderTotal(){
        return poder + self.poderesDeArtefactosEnMochila() 
    }
    method poderesDeArtefactosEnMochila() {
        return artefactosEnMochila.sum({artefacto => artefacto.poder(self)})
    }

    method batalla(){
        artefactosEnMochila.forEach({artefacto => artefacto.fueUtilizado() })
        poder = poder + 1
    }
    method poder(){
        return poder
    }
    method poder(_poder){
        poder = _poder
    }
}


object espadaDelDestino {
    var utilizado = false
    method poder(persona){
        if(utilizado){
            return persona.poder() * 0.5
        }
         return persona.poder() 
    }

    method fueUtilizado(){
        utilizado = true
    }
}

object libroDeHechizos {
    const hechizosDisponibles = [bendición, invisibilidad,invocacion]

    // method poder(persona){
    //     if(self.puedoUtilizarHechizo(bendición)){
    //        return  4
    //        hechizosDisponibles.remove(bendición)
    //     }
    //     else if (self.puedoUtilizarHechizo(invisibilidad)) {
    //         return persona.poder() 
    //         hechizosDisponibles.remove(invisibilidad)
    //     }
    //     else (self.puedoUtilizarHechizo(invocacion)){
    //         return castillo.masPoderoso()
    //         hechizosDisponibles.remove(invocacion)
    //     }
        
    // }
    method puedoUtilizarHechizo(hechizo){
        return hechizosDisponibles.contains(hechizo)
    }
}
object bendición{
}

object invisibilidad {
}

object invocacion {
}

object collarDivino {
    var vecesUtilizado = 0 
    method poder(persona) {  
        if (persona.poder() < 6) {
             return 3
        }
        return 3 + self.vecesUtilizado()
    }
    method vecesUtilizado(){
        return vecesUtilizado
    }
    method fueUtilizado(){

    vecesUtilizado = vecesUtilizado + 1 
        
    }

}

object armaduraDeAceroValyrio {
    method poder(persona){
        return 6
    }
    method fueUtilizado(){

    }
}

object castillo {
    const artefactosEnCastillo = #{}
    method dejarObjetosEn(mochila){
        artefactosEnCastillo.addAll(mochila)
    }
    method artefactosEnCastillo(){
            return artefactosEnCastillo
    } 
    method masPoderoso(){
        return self.artefactosEnCastillo().max({artefacto => artefacto.poder(self)})
    }
}