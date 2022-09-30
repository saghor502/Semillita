//
//  EditarPlanta.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 29/09/22.
//

import Foundation

class EditarPlanta: Codable {
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
    
    init(id:Int?, especie: String, fertilizante: String, iluminacion: String, nombre_cientifico: String, nombre_tradicional: String, origen: String, riego: String, temporada: String, usos: [String], desc: String) {
        self.id = id
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

