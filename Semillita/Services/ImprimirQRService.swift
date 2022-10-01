//
//  ImprimirQRService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para obtener QR
class ImprimirQRService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para obtener QR
    public typealias ImprimirQRClosure = (String) -> Void
    
    /// Función para obtener QR
    /// - Parameters:
    ///   - planta_id: id de planta para qr
    ///   - finalizar: Nada
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
                        if res.response?.statusCode == 401 && JWT.counter < 1 {
                            self.refreshFunction.refresh()
                            JWT.counter += 1
                            self.imprimirQR(planta_id: planta_id, finalizar: finalizar)
                        } else {
                            print(error)
                            finalizar("Planta no encontrada")
                        }
            }
        }
    }
}
