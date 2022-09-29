//
//  ImprimirQRService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire
class ImprimirQRService {
    public typealias ImprimirQRClosure = (String) -> Void
    
    func imprimirQR(planta_id: String, finalizar: @escaping ImprimirQRClosure) {
        let params: [String: String] = [
            "planta_id": planta_id
        ]
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/qr/", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/qr/", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString { (res) in
                switch res.result {
                    case .success:
                        finalizar(res.value!)
                    case let .failure(error):
                        print(error)
                        finalizar("Planta no encontrada")
            }
        }
    }
}
