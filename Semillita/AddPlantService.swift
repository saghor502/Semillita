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
    public typealias AddPlantClosure = (String?) -> Void
    
    func addPlant(planta: AddPlanta, finalizar: @escaping AddPlantClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/", method: .post, parameters: planta, encoder: JSONParameterEncoder())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/html"])
            .responseString { (res) in
                finalizar("Planta Agregada")
            }
        }
    }
