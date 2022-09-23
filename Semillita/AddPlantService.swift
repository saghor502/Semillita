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
    public typealias AddPlantClosure = (AddPlanta?) -> Void
    
    func addPlant(planta: AddPlanta, finalizar: @escaping AddPlantClosure) {
        let params: Parameters = [
            "especie": planta.especie,
            "fertilizante": planta.fertilizante,
            "iluminacion": planta.iluminacion,
            "nombre_cientifico": planta.nombre_cientifico,
            "nombre_tradicional": planta.nombre_tradicional,
            "origen": planta.origen,
            "riego": planta.riego,
            "temporada": planta.temporada,
            "usos": [1, 2]
        ]
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/", method: .post, parameters: params)
            //.validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: AddPlanta.self) { respuesta in
            switch respuesta.result {
                case .success:
                    print(respuesta)
                    finalizar(respuesta.value)
                case let .failure(error):
                    print(error)
                    finalizar(nil)
            }
        }
    }
}
