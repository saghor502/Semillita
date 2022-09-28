//
//  UsosService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 27/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class UsosService {
    public typealias LeerUsosClosure = (listaUsos?) -> Void
    
    func getUsos(finalizar: @escaping LeerUsosClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/usos/", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: listaUsos.self) { respuesta in
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
