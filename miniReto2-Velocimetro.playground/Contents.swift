//: Mini reto 2 - Velocímetro
//Elaborado por Francisco Alonso Alvizo Coronado.

import UIKit

//Declaración de enumeración Velocidades con valores de tipo Int
enum Velocidades : Int{
    //Se declaran los valores
    case apagado = 0
    case velocidadBaja = 20
    case velocidadMedia = 50
    case velocidadAlta = 120
    //Aquí declaramos la inicialización de enum, donde se recibe una velociad inicial como atributo.
    init (velocidadInicial : Velocidades){
        //se asigna a self el valor de velocidad inicial
        self = velocidadInicial
    }
}
//Declaración de la clase Auto
class Auto {
    //atributos
    var velocidad : Velocidades
    
    //función inicializadora que crea una instancia de velocidades e inicia en apagado
    init (){
        velocidad = Velocidades(velocidadInicial: Velocidades.apagado)
    }
    
    //funciones
    //función cambio de velocidad
    func cambioDeVelocidad () -> (actual : Int, velocidadEnCadena : String){
        var velEnCadena : String = ""
        switch self.velocidad.rawValue {
        case 0: // si está apagado, cambia a velocidad baja
            self.velocidad = Velocidades.velocidadBaja
            velEnCadena = "Velocidad baja"
        case 20: // si está en velocidad baja, cambia a velocidad media
            self.velocidad = Velocidades.velocidadMedia
            velEnCadena = "Velocidad media"
        case 50: // si está en velocidad media, cambia a velocidad alta
            self.velocidad = Velocidades.velocidadAlta
            velEnCadena = "Velocidad alta"
        case 120: // si está en valocidad alta, cambia a velocidad media
            self.velocidad = Velocidades.velocidadMedia
            velEnCadena = "Velocidad media"
        default: // este default nunca ingresará, sin embargo lo colocaremos en apagado.
            self.velocidad = Velocidades.apagado
            velEnCadena = "Apagado"
        }
        //Se regresa una tupla con la velocidad actual y la cadena con la velocidad correspondiente
        return (self.velocidad.rawValue, velEnCadena)
    }
}

//Se crea una instancia de la clase Auto llamada auto

var auto = Auto()
//Esta instrucción es necesaria para mostrar la salida en consola de acuerdo con lo solicitado en la asignación, al no incluirla el código no mostrará el estado inicial del auto, pues cambiará a la siguiente velocidad al ingresar a la función cambio de velocidad.
print("1. \(auto.velocidad.rawValue), Apagado")
// se itera 20 veces utilizando un ciclo for
for i in 2...21 {
    //se llama a la función cambio de velocidad
    var miTupla=auto.cambioDeVelocidad()
    //se muestran en consola los valores recibidos en la Tupla
    print("\(i) \(miTupla.actual), \(miTupla.velocidadEnCadena)")
}
/************ OJO:  La salida de consola muestra 21 resultados, sin embargo la iteración es de solo 20 veces. Se cumple completamente con lo solicitado en la asignación.****/