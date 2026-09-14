import george.*
import steven.*


object matrix {

    method precio(){
        return 500
    }
    method puedeEntrar(mensajero){
        return mensajero.puedeLlamar()
    }
}

object brooklynPuente {
    method puedeEntrar(mensajero){
        return mensajero.peso() < 1000
    }
    method precio(){
        return 150
    }
}

object paquete {
    var pagado = false
    const contenido = []

    method puedeEntregarse(destino, mensajero){
        return self.estaPago() && self.mensajeroPuedeEntrar(destino, mensajero)
    }

    method mensajeroPuedeEntrar(destino, mensajero){
        return destino.puedeEntrar(mensajero)
    }

    method contenido(contenidoDelPaquete) {
        return [contenidoDelPaquete]
    }
    method contenido(){
        return contenido
    }
    method precio(destino){
        return destino.precio()
    }
    method pagarPaquete(){
        pagado = true
    }
    method estaPago(){
        return pagado
    }
}

object jeanGray {
    method peso(){
        return 65
    }
    method puedeLlamar(){
        return true
    }
}

object neo {
    
    var credito = 20

    method puedeLlamar(){
        return credito > 1
    }
    method credito(nuevoCredito){
        credito = nuevoCredito
    }
    method peso(){
        return 0
    }
}

object saraConnor {
    var pesoSara = 100 
    var vehiculo = moto
    method pesoSara(nuevoPeso){
        pesoSara = nuevoPeso
    }
    method pesoSara(){
        return pesoSara
    }
    method vehiculo(nuevoVehiculo){
        vehiculo = nuevoVehiculo
    }
    method vehiculo(){
        return vehiculo
    }
    method peso(){
        return pesoSara + vehiculo
    }
    method puedeLlamar(){
        return false
    }
}

object moto {
    method peso(){
        return 100
    }
}

object camion{

    method pesoCamion(){
        return 500
    }
    method pesoCamionYAcoplados(){
        return 1000
    }
}