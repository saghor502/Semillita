//
//  UsosService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 27/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class UsosService {
    let refreshFunction = RefreshToken()
    public typealias LeerUsosClosure = (listaUsos?) -> Void
    
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
                    if respuesta.response?.statusCode == 401 {
                        self.refreshFunction.refresh()
                        self.getUsos(finalizar: finalizar)
                    }
                    print(error)
                    finalizar(nil)
            }
        }
    }
}
