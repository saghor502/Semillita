//
//  Imagen.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//

import Foundation

/// Clase que representa una imagen normal
public class Imagen: Codable{
    public let dato: String
    public let tipo: String
    public var planta_id: Int
    
    
    /// Inicializador de un objeto de tipo Imagen
    /// - Parameters:
    ///   - dato: imagen en base64
    ///   - tipo: tipo de imagen
    ///   - planta_id: id de la planta a la que pertenece
    public init(dato: String, tipo: String, planta_id: Int){
        self.dato = dato
        self.tipo = tipo
        self.planta_id = planta_id
        }
}
