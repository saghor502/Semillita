//
//  AddPlantService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 22/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire
class AddPlantService {
    public typealias AddPlantClosure = (Planta?) -> Void
    
    func addPlant(planta: AddPlanta, finalizar: @escaping AddPlantClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/", method: .post, parameters: planta, encoder: JSONParameterEncoder())
        //AF.request("http://localhost:8080/api/plantas/", method: .post, parameters: planta, encoder: JSONParameterEncoder())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: Planta.self) { respuesta in
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
