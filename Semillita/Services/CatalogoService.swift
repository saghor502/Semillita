//
//  CatalogoService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utlizada para leer todas las plantas
class Catalogo {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para leer todas las plantas
    public typealias LeerCataClosure = (listaPlantas?) -> Void
    
    /// Función utilizada para leer todas las plantas
    /// - Parameter finalizar: nada
    func leerCata(finalizar: @escaping LeerCataClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        // AF.request("http://localhost:8080/api/plantas/", method: .get, encoding: JSONEncoding.default, headers: headers)
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: listaPlantas.self) { respuesta in
            switch respuesta.result {
                case .success:
                    finalizar(respuesta.value)
                case let .failure(error):
                    if respuesta.response?.statusCode == 401 && JWT.counter < 1 {
                        self.refreshFunction.refresh()
                        JWT.counter += 1
                        self.leerCata(finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar(nil)
                    }
            }
        }
    }
}
