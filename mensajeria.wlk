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
        return destino.precio() + 50
    }
    method pagarPaquete(){
        pagado = true
    }
    method estaPago(){
        return pagado
    }
    method noEstaPago(){
        pagado = false
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
        return pesoSara + vehiculo.peso()
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

    var acoplados = false

    method ponerAcoplados(){
        acoplados = true
    }

    method pesoCamion(){
        return 500
    }
    method pesoCamionYAcoplados(){
        return 1000
    }
    method peso(){
        return if (acoplados){self.pesoCamionYAcoplados()} else {self.pesoCamion()}
    }
}

object empleados {


    const empleados = [mensajeria.jeanGray, mensajeria.saraConnor, mensajeria.neo]

    method empleados(){
        return empleados
    }

    method agregarEmpleadoAMensajeria(empleado){
        empleados.add(empleado)
    }

    method despedirEmpleado(empleado){
        empleados.remove(empleado)
    }

    method DespedirATodos(){
        empleados.clear()
    }


    method laMensajeriaEsGrande(mensajeria){
        return mensajeria.size() > 2
    }


    method elPaquetePuedeSerEntregadoPorElPrimero(destino, listaEmpleados){
        paquete.puedeEntregarse(destino, listaEmpleados.first())
    }

    method pesoDeUltimoMensajero(listaEmpleados){
        self.ultimoEmpleado(listaEmpleados).peso()
    }
    method ultimoEmpleado(listaEmpleados){
        return listaEmpleados.last()
    }


}


object empleado{
    const peso = 70

    method peso(){
        return peso
    }

    method puedeLlamar(){
        return true
    }
}



object paquetito {


    method precio(destino){
        return 0
    }
    method precio(){
        return 0
    }
    method estaPago(){
        return true
    }

    method puedeEntregarse(destino, mensajero){
        return true
    }
}

object paquetonViajero {

    var property destinos = #{}

    const totalAPagar = self.precio()

    var pagadoHastaAhora = 0


    method agregarDestino(destino){
        destinos.add(destino)
    }
    method pagadoHastaAhora(){
        return pagadoHastaAhora
    }

    method pagar(monto){
        pagadoHastaAhora =+ monto
    }

    method totalAPagar(){
        return totalAPagar
    }
    method precio(){
        return 100 * destinos.size()
    }

    method estaPago(){
        return pagadoHastaAhora == totalAPagar
    }

    method mensajeroPuedeIrATodosLosDestinos(mensajero){
        return destinos.all{destino => destino.puedeEntrar(mensajero)}
        
    }

    method puedeEntregarse(mensajero){
        return self.estaPago() && self.mensajeroPuedeIrATodosLosDestinos(mensajero)
    }
}



object empresaMensajeria {

    var pesoMensajeria = 0
    const paquetesEnviados = #{}
    const paquetesPendientes = #{}
    var facturacion = 0
    const destinos = #{}
    var pagadoHastaAhora = 0


    method paquetesEnviados(){ 
        return paquetesEnviados
    }

    method mensajerosQuePuedenLlevarPaquete(mensajeros, paquete, destino){
        return mensajeros.filter{ mensajero => paquete.puedeEntregarse(destino, mensajero) }
    }

    method paquetesPendientes(){
        return paquetesPendientes
    }

    method facturacion(){
        return facturacion
    }

    method destinos(){
        return destinos
    }


    method pagadoHastaAhora(){
        return pagadoHastaAhora
    }



    method mensajeriaPeso(mensajeros){
        pesoMensajeria = mensajeros.average{ mensajero => mensajero.peso() }
    }
    method pesoMensajeria(){
        return pesoMensajeria
    }



    method mensajeriaTieneSobrePeso(){
        return self.pesoMensajeria() > 500
    }

    method pagar(monto){
        pagadoHastaAhora += monto
    }
    method totalAPagar(){
        return self.precio()
    }
    method precio(){
        return 100 * destinos.size()
    }
    method estaPago(){
        return pagadoHastaAhora == self.totalAPagar()
    }

    method posibleMensajero(mensajeros, paquete, destino){
        return mensajeros.find{ mensajero => paquete.puedeEntregarse(destino, mensajero) }
    }

    method enviarPaquete(paqueteAEnviar, mensajeros, destino){
        if (mensajeros.any{ mensajero => paqueteAEnviar.puedeEntregarse(destino, mensajero) }){
            paquetesEnviados.add(paqueteAEnviar)
            paquetesPendientes.remove(paqueteAEnviar)
            facturacion += paqueteAEnviar.precio(destino)
        } else {
            paquetesPendientes.add(paqueteAEnviar)
        }
    }

    method enviarPaquetes(paquetes, mensajeros, destino){
        paquetes.forEach{ paquete => self.enviarPaquete(paquete, mensajeros, destino) }
    }

    method preciosDePaquetes(paquetes){
        return paquetes.map{ paquete => paquete.precio() }
    }

    method paqueteMasCaro(precios){
        return precios.max()
    }
}





