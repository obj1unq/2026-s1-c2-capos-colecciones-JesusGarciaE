object rolando {

    var capacidadMochila = 2 
    const artefactosEnMochila = #{}
    const artefactosVistos = []
    var poder = 5
    var enemigo = caterina
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
    
    method dejarObjetosEnMorada(morada){
        morada.dejarObjetosEn(artefactosEnMochila)
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
    method enemigo(){
        return enemigo
    }
    method enemigo(_enemigo){
        enemigo = _enemigo
    }
    method puedeVencerA(_enemigo){
        return self.poderTotal() > _enemigo.poder()
    }

    method poderoso(tierra){
        return tierra.puedeVencerATodos(self)
    }
    method tieneArtefactoFatal(){
        return self.posesiones().find({artefacto => artefacto.poder(self) > enemigo.poder()})
    }
    method obtenerArtefactoMasPoderoso(){
        return self.posesiones().max({artefacto => artefacto.poder(self)})
    }
    method puedeConquistarMorada(villano){
        return if (self.puedeVencerA(villano)){
            villano.morada()
        }
    }
}
object tierra {
    const villanos = [caterina, archibaldo, astra]
    method puedeVencerATodos(persona){
        return villanos.all({villano => persona.puedeVencerA(villano)})
    }
}

object caterina {
    method poder(){
        return 28
    }
    method morada(){
        return fortalezaDeAcero
    }
}

object archibaldo {
    method poder(){
        return 16
    }
        method morada(){
            return palacioDeMarmol
        }
}

object astra {
    method poder(){
        return 14
    }
    method morada(){
        return torreDeMarfil
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

     method poder(persona){
        
        return if (self.hechizosDisponibles().isEmpty()){
            0
        }
        else {
            self.hechizosDisponibles().first().poder(persona)
        }
        
    }
    

    method puedoUtilizarHechizo(hechizo){
        return hechizosDisponibles.contains(hechizo)
    }
   
    method hechizosDisponibles(){
        return hechizosDisponibles
    }
}
object bendición{
    method poder(persona){
        return 4
    }
    method fueUtilizado(){
        libroDeHechizos.hechizosDisponibles().remove(self)
    }
}

object invisibilidad {
    method poder(persona){
        return persona.poder()
    }
    method fueUtilizado(){        
        libroDeHechizos.hechizosDisponibles().remove(self)
    }
}

object invocacion {
    method poder(persona){
        return castillo.masPoderoso()
    }
    method fueUtilizado(){
        libroDeHechizos.hechizosDisponibles().remove(self)
    }
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

object fortalezaDeAcero {
}

object palacioDeMarmol {
}

object torreDeMarfil{
}