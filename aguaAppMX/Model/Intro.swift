//
//  Intro.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//
import SwiftUI

// MARK: Intro Model And Sample Intro's
struct Intro: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var text : String
}

var intros: [Intro] = [
    .init(imageName: "reto2", title: "Agua desperdiciada", text: "En promedio, en México se desperdician alrededor de 38 mil litros de agua por segundo, lo que equivale a cerca de 3.3 billones de litros de agua al año."),
    .init(imageName: "reto3", title: "¿Cómo ahorrar agua?", text: "Descubre desafíos y noticias sobre la conservación del agua en AguApp MX. Reta a tus amigos a unirse a la lucha por un uso más responsable de este recurso vital."),
    .init(imageName: "reto4", title: "¡Crea hábitos!", text: "Pequeñas acciones hacen una gran diferencia. Con AguApp MX, puedes establecer nuevos hábitos para cuidar el agua de una manera fácil y divertida."),
]

// MARK: Font String's
let sansBold = "WorkSans-Bold"
let sansSemiBold = "WorkSans-SemiBold"
let sansRegular = "WorkSans-Regular"
