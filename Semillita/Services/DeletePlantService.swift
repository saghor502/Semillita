//
//  DeletePlantService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para eliminar plantas
class DeletePlantService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para eliminar plantas
    public typealias DeletePlantClosure = (String?) -> Void
    
    /// Función para eliminar plantas
    /// - Parameters:
    ///   - planta: objeto de tipo Planta a eliminar
    ///   - finalizar: Nada
    func deletePlant(planta: Planta, finalizar: @escaping DeletePlantClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/" + String(planta.id), method: .delete, encoding: JSONEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/plantas/" + String(planta.id) + "/", method: .delete, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/html"])
            .responseString { (res) in
                switch res.result {
                case .success:
                    finalizar("Planta Desactivada")
                case let .failure(error):
                    if res.response?.statusCode == 401 && JWT.counter < 1 {
                        self.refreshFunction.refresh()
                        JWT.counter += 1
                        self.deletePlant(planta: planta, finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar("Error borrando planta")
                    }
                    
                }
            }
        }
    }
