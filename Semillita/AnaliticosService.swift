//
//  AnaliticosService.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 22/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class AnaliticosService {
    public typealias LeerAnaliticosClosure = ([Planta]?) -> Void
    
    func leerAnaliticos(finalizar: @escaping LeerAnaliticosClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/analiticos/" , method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: [Planta].self) { respuesta in
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
