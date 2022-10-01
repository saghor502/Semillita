//
//  UsosService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 27/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para leer todos los usos
class UsosService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para leer usos
    public typealias LeerUsosClosure = (listaUsos?) -> Void
    
    /// Función para leer usos
    /// - Parameter finalizar: Nada
    func getUsos(finalizar: @escaping LeerUsosClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/usos/", method: .get, encoding: JSONEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/usos/", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: listaUsos.self) { respuesta in
            switch respuesta.result {
                case .success:
                    finalizar(respuesta.value)
                case let .failure(error):
                    if respuesta.response?.statusCode == 401 && JWT.counter < 1 {
                        self.refreshFunction.refresh()
                        JWT.counter += 1
                        self.getUsos(finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar(nil)
                    }
                    
            }
        }
    }
}
