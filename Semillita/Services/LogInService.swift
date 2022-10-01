//
//  LogInService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 23/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utiizada para hacer login
class LogInService {
    /// Definición de closure para hacer login
    public typealias LogInClosure = (String?) -> Void
    
    /// Función utilizada para hacer login
    /// - Parameters:
    ///   - username: nombre de usuario a autenticar
    ///   - password: contraseña de usuario a autenticar
    ///   - finalizar: Nada
    func logIn(username: String, password: String, finalizar: @escaping LogInClosure) {
        let params: [String: String] = [
            "username": username,
            "password": password
        ]
        AF.request("https://tc2007b-semillita.herokuapp.com/api/token/", method: .post, parameters: params, encoder: JSONParameterEncoder())
        // AF.request("http://localhost:8080/api/token/", method: .post, parameters: params, encoder: JSONParameterEncoder())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: Token.self) { (res) in
                switch res.result {
                    case .success:
                        JWT.refresh = res.value!.refresh!
                        JWT.token = res.value!.access
                        JWT.counter = 0
                        finalizar("Usuario autenticado")
                    case .failure:
                        finalizar("Usuario no autenticado")
            }
        }
    }
}
