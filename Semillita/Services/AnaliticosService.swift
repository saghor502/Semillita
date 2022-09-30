//
//  AnaliticosService.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 22/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class AnaliticosService {
    let refreshFunction = RefreshToken()
    public typealias LeerAnaliticosClosure = (AnaliticosObject?) -> Void
    
    func leerAnaliticos(finalizar: @escaping LeerAnaliticosClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/analiticos/" , method: .get, encoding: JSONEncoding.default, headers: headers)
        //AF.request("http://localhost:8080/api/analiticos/" , method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: AnaliticosObject.self) { respuesta in
            switch respuesta.result {
                case .success:
                    finalizar(respuesta.value)
                case let .failure(error):
                    if respuesta.response?.statusCode == 401 {
                        self.refreshFunction.refresh()
                        self.leerAnaliticos(finalizar: finalizar)
                    }
                    print(error)
                    finalizar(nil)
            }
        }
    }
}
