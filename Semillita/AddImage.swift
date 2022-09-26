//
//  AddImage.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation

public class AddImage: Codable{
    public let dato: Data
    public let tipo: String
    public var planta_id: String
    
    public init(dato: Data, tipo: String, planta_id: String){
        self.dato = dato
        self.tipo = tipo
        self.planta_id = planta_id
        }
}
