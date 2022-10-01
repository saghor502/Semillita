//
//  listaPlantas.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import Foundation

/// Clase que representa una lista de plantas
public class listaPlantas: Codable{
    public let count: Int
    public let results: [Planta]
    
    /// Inicializador de clase listaPlantas
    /// - Parameter results: una lista de objetos tipo Planta
    public init(results: [Planta]){
        self.results = results
        self.count = results.count
        }
}
