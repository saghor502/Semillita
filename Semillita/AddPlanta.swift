//
//  AddPlanta.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 22/09/22.
//

import Foundation


/// Clase que representa una planta para añadir
class AddPlanta: Codable {
    let id: Int?
    let especie: String
    let fertilizante: String
    let iluminacion: String
    let nombre_cientifico: String
    let nombre_tradicional: String
    let origen: String
    let riego:String
    let temporada:String
    let usos:[String]
    let descripcion:String
    
    
    /// Inicializador de objeto de tipo AddPlanta
    /// - Parameters:
    ///   - especie: especie de la planta
    ///   - estatus: estatus de la planta
    ///   - fertilizante: fertilizante de la planta
    ///   - iluminacion: iluminacion de la planta
    ///   - nombre_cientifico: nombre_cientifico de la planta
    ///   - nombre_tradicional: nombre_tradicional de la planta
    ///   - origen: origen de la planta
    ///   - riego: riego de la planta
    ///   - temporada: temporada de la planta
    ///   - usos: lisa de usos de la planta
    ///   - desc: descripcion de la planta
    init(especie: String, fertilizante: String, iluminacion: String, nombre_cientifico: String, nombre_tradicional: String, origen: String, riego: String, temporada: String, usos: [String], desc: String) {
        self.id = nil
        self.especie = especie
        self.fertilizante = fertilizante
        self.iluminacion = iluminacion
        self.nombre_cientifico = nombre_cientifico
        self.nombre_tradicional = nombre_tradicional
        self.origen = origen
        self.riego = riego
        self.temporada = temporada
        self.usos = usos
        self.descripcion = desc
    }
}
