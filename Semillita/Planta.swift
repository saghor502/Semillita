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
    let descripcion: String
}
