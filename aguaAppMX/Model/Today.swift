//
//  Today.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

// MARK: Data Model and Sample Data
struct Today: Identifiable{
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artwork: String
    var url: String
    var noticia: String
}

var todayItems: [Today] = [
    
    Today(appName: "Gobierno de México", appDescription: "29 de marzo del 2023", appLogo: "LogoGM", bannerTitle: "¿Sabes cuánta agua consumes?", platformTitle: "CONAGUA", artwork: "Noticia4", url: "https://www.gob.mx/conanp/articulos/sabes-cuanta-agua-consumes", noticia: "El agua es uno de los recursos vitales para la vida, pues todas las actividades que desarrollamos están relacionadas con este vital líquido.\n\nRecordemos que el planeta Tierra está compuesto 70% por agua, y que sólo el 30% es tierra firme. En lo que al cuerpo humano se refiere, está compuesto 60% de agua, lo que le permite tener un correcto funcionamiento. De acuerdo a la Organización Mundial de la Salud (OMS), una persona requiere de 100 litros de agua al día (5 o 6 cubetas grandes) para satisfacer sus necesidades, tanto de consumo como de higiene.\n\nEn la construcción de una cultura de uso responsable del agua, seguramente habrás escuchado recomendaciones como: cierra la llave de la regadera mientras te enjabonas, utiliza cubeta para lavar el coche o un vaso para lavarte los dientes. Sin embargo, ¿sabías que el mayor consumo de este líquido lo realizamos de manera indirecta? Es decir, cada que adquirimos un producto o hacemos uso de un servicio estamos consumiendo agua sin darnos cuenta."),

    Today(appName: "Publimetro", appDescription: "1 de marzo del 2023", appLogo: "LogoPubli", bannerTitle: "Empeorará por falta de infraestructura", platformTitle: "Desabasto de agua", artwork: "Noticia1", url: "https://www.publimetro.com.mx/noticias/2023/03/02/estado-de-mexico-partido-verde-pide-inversion-para-garantizar-abasto-de-agua/", noticia: "Además de las altas temperaturas, la deforestación y cambio de usos de suelo contribuyen a la crisis del agua en la entidad. \n\nEn el Estado de México no se puede aplazar más la inversión en proyectos que garanticen el abasto y calidad del agua, ya que la falta del líquido no es un problema del futuro, sino una preocupante realidad, así lo afirmó José Alberto Couttolenc, presidente del Partido Verde en esa entidad. \n\nDijo que es urgente que el gobierno estatal invierta en proyectos a favor de la sustentabilidad del agua, por lo que es necesario establecer sistemas de almacenamiento comunitarios, como tanques o cisternas, plantas potabilizadoras, sistemas de captación de agua de lluvia y reparación de fugas."),
    
    Today(appName: "El Financiero", appDescription: "12 de febrero del 2023", appLogo: "LogoEF", bannerTitle: "''Este año será muy difícil'' por el agua, advierte Sheinbaum", platformTitle: "¿Sequía en CDMX?", artwork: "Noticia2",url: "https://www.elfinanciero.com.mx/cdmx/2023/02/12/sheinbaum-corte-de-agua-sequia-en-cdmx-2023-sistema-cutzamala/", noticia: "Claudia Sheinbaum, jefa de gobierno de la Ciudad de México, anticipó que la situación con el suministro del agua para este año será “difícil” para la capital del país, esto en una semana en la que se cortó el abastecimiento por trabajos de mantenimiento en ramales del oriente y norte. \n\n“Va a ser muy difícil, porque llevamos ya cuatro años de sequía en la Ciudad”, dijo Sheinbaum durante su gira por alcaldías este sábado 11 de febrero, además de asegurar que, a pesar de eso, “el acceso al agua es un derecho”. \n\nLa mandataria aseguró que actualmente la capital del país recibe menos agua procedente del Estado de México y Michoacán a través del Sistema Cutzamala; sin embargo, su gestión ha realizado “muchas inversiones”, y aseguró que si no se hubieran realizado, la capital estaría en “terribles circunstancias”."),
    
    Today(appName: "W Radio", appDescription: "3 de febrero del 2023", appLogo: "LogoWR", bannerTitle: "Alertan nueva crisis por escasez de agua en el norte", platformTitle: "Otra vez en Nuevo León", artwork: "Noticia3",url: "https://wradio.com.mx/radio/2023/02/03/nacional/1675456811_872377.html", noticia: "El presidente de la Comisión de Recursos Hidráulicos, Agua Potable y Saneamiento de la Cámara de Diputados, Rubén Muñoz Álvarez, alertó que el país registra una considerable escasez de agua en sus presas.\n\nEstos depósitos del líquido se encuentran, en promedio, a un 56 por ciento de su capacidad, incluso, estimó que en la próxima temporada de estiaje, en el periodo primavera- verano, podrìa presentarse no solo desabasto de agua para las labores de riego agrícola y actividades industriales sino para el consumo bàsico de la poblaciòn sobre todo en la zona norte de la Repùblica.\n\nPor lo que, el diputado de Morena demandó a las autoridades de todos los niveles de gobierno tomar las medidas preventivas correspondientes para atender esta grave situación.\n\n“Las presas del país tienen hoy un embalse del 56 por ciento, lo que nos indica que se puede venir ahora en el verano, en el tiempo de los estiajes, un problema de abasto para el sector agrícola y para el consumo humano. El llamado que estamos haciendo como Comisión es sumar el esfuerzo de los tres niveles de gobierno, para poner las medidas preventivas y reducir la demanda. Si no hay una reducción en la demanda de agua se va a venir una crisis en el norte de México empezando nuevamente por Nuevo León''."),
]

