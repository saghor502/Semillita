//
//  AddImage.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation


/// Clase que representa una imagen para añadir
public class AddImage: Codable{
    public let dato: Data
    public let tipo: String
    public var planta_id: String
    
    
    /// Inicializador de objeto de tipo AddImage
    /// - Parameters:
    ///   - dato: imagen en bytes
    ///   - tipo: tipo de imagen
    ///   - planta_id: id de la planta a la que pertenece
    public init(dato: Data, tipo: String, planta_id: String){
        self.dato = dato
        self.tipo = tipo
        self.planta_id = planta_id
        }
}
