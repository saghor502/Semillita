//
//  JWT.swift
//  SemillitaTests
//
//  Created by Abdiel Alejandro Ramírez Barrón on 10/10/22.
//

import Foundation


/// Variable global utilizada por los servicios
struct JWT {
    
    /// Cuenta con un token de refresh
    static var refresh: String = ""
    
    /// El token de acceso utiizado por los servicios
    static var token: String = ""
    
    /// Contador de veces que se ha hecho un refresh
    static var counter: Int = 0
}
