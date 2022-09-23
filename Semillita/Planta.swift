//
//  Planta.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//

import Foundation

class Planta: Codable {
    let id: Int?
    let especie: String
    let estatus: Bool?
    let fertilizante: String
    let iluminacion: String
    let nombre_cientifico: String
    let nombre_tradicional: String
    let origen: String
    let riego:String
    let temporada:String
    let usos:[String]
    let Pimagenes: [Imagen]?
    
    init(id: Int?, especie: String, estatus: Bool?, fertilizante: String, iluminacion: String, nombre_cientifico: String, nombre_tradicional: String, origen: String, riego: String, temporada: String, usos: [String], pimagenes: [Imagen]?) {
        self.id = id
        self.especie = especie
        self.estatus = estatus
        self.fertilizante = fertilizante
        self.iluminacion = iluminacion
        self.nombre_cientifico = nombre_cientifico
        self.nombre_tradicional = nombre_tradicional
        self.origen = origen
        self.riego = riego
        self.temporada = temporada
        self.usos = usos
        self.Pimagenes = pimagenes
    }
}
