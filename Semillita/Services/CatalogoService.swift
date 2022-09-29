//
//  CatalogoService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class Catalogo {
    public typealias LeerCataClosure = (listaPlantas?) -> Void
    
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
                    print(error)
                    finalizar(nil)
            }
        }
    }
}
