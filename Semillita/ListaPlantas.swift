//
//  listaPlantas.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import Foundation

public class listaPlantas: Codable{
    public let results: [Planta]
    
    public init(results: [Planta]){
        self.results = results
        }
}
