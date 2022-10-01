//
//  Planta.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//

import Foundation

/// Clase que representa una planta normal
public class Planta: Codable {
    public let id: Int
    public let especie: String
    public let estatus: Bool?
    public let fertilizante: String
    public let iluminacion: String
    public let nombre_cientifico: String
    public let nombre_tradicional: String
    public let origen: String
    public let riego:String
    public let temporada:String
    public let usos:[String]
    public let Pimagenes: [Imagen]?
    public let descripcion: String
    
    
    /// Inicializador de un objeto de tipo Planta
    /// - Parameters:
    ///   - id: id de la planta
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
    ///   - Pimagenes: lista de imagenes de la planta
    ///   - descripcion: descripcion de la planta
    public init(id : Int, especie : String, estatus : Bool, fertilizante : String, iluminacion: String,nombre_cientifico: String, nombre_tradicional: String, origen: String, riego:String, temporada:String, usos:[String], Pimagenes: [Imagen], descripcion: String){
        self.id = id
        self.especie = especie
        self.estatus = estatus
        self.fertilizante = fertilizante
        self.iluminacion = iluminacion
        self.nombre_cientifico = nombre_cientifico
        self.nombre_tradicional = nombre_tradicional
        self.origen = origen
        self.riego = riego
        self.usos = usos
        self.descripcion = descripcion
        self.temporada = temporada
        self.Pimagenes = Pimagenes
        }
}
