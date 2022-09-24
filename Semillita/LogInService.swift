//
//  LogInService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 23/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class LogInService {
    public typealias LogInClosure = (String?) -> Void
    
    func logIn(username: String, password: String, finalizar: @escaping LogInClosure) {
        let params: [String: String] = [
            "username": username,
            "password": password
        ]
        AF.request("https://tc2007b-semillita.herokuapp.com/api/users/", method: .post, parameters: params, encoder: JSONParameterEncoder())
        //AF.request("http://localhost:8080/api/users/", method: .post, parameters: [username, password], encoder: JSONParameterEncoder())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString { (res) in
                switch res.result {
                    case .success:
                        finalizar("Usuario autenticado")
                    case .failure:
                        finalizar("Usuario no autenticado")
            }
        }
    }
}
