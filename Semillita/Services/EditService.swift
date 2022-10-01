//
//  EditService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 29/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para editar una planta
class EditService {
    // Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para editar una planta
    public typealias EditPlantClosure = (Planta?) -> Void
    
    /// Función utilizada para editar una planta
    /// - Parameters:
    ///   - planta: objeto de tipo planta a editar
    ///   - finalizar: nada
    func addPlant(planta: EditarPlanta, finalizar: @escaping EditPlantClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/" + String(planta.id!)+"/", method: .put, parameters: planta, encoder: JSONParameterEncoder(), headers: headers)
        //AF.request("http://localhost:8080/api/plantas/" + String(planta.id!)+"/", method: .put, parameters: planta, encoder: JSONParameterEncoder(), headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: Planta.self) { respuesta in
            switch respuesta.result {
                case .success:
                    finalizar(respuesta.value)
                case let .failure(error):
                    if respuesta.response?.statusCode == 401 && JWT.counter < 1 {
                        self.refreshFunction.refresh()
                        JWT.counter += 1
                        self.addPlant(planta: planta, finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar(nil)
                    }
            }
            }
    }
}
