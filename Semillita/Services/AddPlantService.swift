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
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/", method: .post, parameters: planta, encoder: JSONParameterEncoder(), headers: headers)
        //AF.request("http://localhost:8080/api/plantas/", method: .post, parameters: planta, encoder: JSONParameterEncoder(), headers: headers)
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
