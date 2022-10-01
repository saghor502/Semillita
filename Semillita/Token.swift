//
//  Token.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 29/09/22.
//

import Foundation


/// Clase que representa un JWT
class Token: Codable {
    
    /// Cuenta con token de acceso y token para recibir uno nuevo
    let refresh: String?
    let access: String
}
