//
//  Imagen.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//

import Foundation

public class Imagen: Codable{
    public let dato: String
    public let tipo: String
    
    public init(dato: String, tipo: String){
        self.dato = dato
        self.tipo = tipo
        }
}
