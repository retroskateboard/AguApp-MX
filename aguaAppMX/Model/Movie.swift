//
//  Movie.swift
//  AguaAppMX
//
//  Created by Eric Rojas Pech on 03/12/22.
//

import SwiftUI

// MARK: Movie Data Model and Sample Movie Data
struct Movie: Identifiable{
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
    var challengeDescription: String
}

var movies: [Movie] = [

    Movie(movieTitle: "!Un lavado responsable¡", artwork: "reto1", challengeDescription: "¡Utiliza máximo 3 cubetas de agua o menos, la próxima vez que laves tu patio o auto!"),
    Movie(movieTitle: "¡Baño rápido!", artwork: "reto2", challengeDescription: "¡No tardes mas de 10 minutos bañándote!"),
    Movie(movieTitle: "¡Baño fugaz!", artwork: "reto3", challengeDescription: "¡No tardes mas de 5 minutos bañándote!"),
    Movie(movieTitle: "¡Que no se escape!", artwork: "reto4", challengeDescription: "¡Pon una cubeta para el agua que se desperdicia mientras esperas que el agua caliente salga de la regadera!"),
    Movie(movieTitle: "¡Recicla el agua!", artwork: "reto5", challengeDescription: "¡Reutiliza el agua recolectada de la regadera para regar plantas o para la taza de baño!"),
]

// MARK: Dummy Text
var sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
