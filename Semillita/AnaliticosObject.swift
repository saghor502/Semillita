//
//  AnaliticosObject.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 29/09/22.
//

import Foundation


/// Clase que representa los analiticos obtenidos
class AnaliticosObject: Codable {
    let popularPlants: [Planta]
    let graph: String
}
