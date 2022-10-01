//
//  AnaliticosService.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 22/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para obtener analíticos
class AnaliticosService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para leer analiticos
    public typealias LeerAnaliticosClosure = (AnaliticosObject?) -> Void
    
    /// Función para leer analíticos
    /// - Parameter finalizar: Nada
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
                    if respuesta.response?.statusCode == 401 && JWT.counter < 1  {
                        self.refreshFunction.refresh()
                        JWT.counter += 1
                        self.leerAnaliticos(finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar(nil)
                    }
            }
        }
    }
}
