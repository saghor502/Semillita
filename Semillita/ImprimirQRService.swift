//
//  ImprimirQRService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class ImprimirQRService {
    public typealias ImprimirQRClosure = (String?) -> Void
    
    func imprimirQR(planta_id: Int, finalizar: @escaping ImprimirQRClosure) {
        //AF.request("https://tc2007b-semillita.herokuapp.com/api/qr/", method: .get, parameters: planta_id, encoder: JSONParameterEncoder())
        let params: [String: Int] = [
            "planta_id": planta_id
        ]
        AF.request("https://tc2007b-semillita.herokuapp.com/api/qr/", method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString { (res) in
                switch res.result {
                    case .success:
                        finalizar(res.value)
                    case let .failure(error):
                        print(error)
                        finalizar("Planta no encontrada")
            }
        }
    }
}
