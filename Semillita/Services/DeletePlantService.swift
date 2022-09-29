//
//  DeletePlantService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire
class DeletePlantService {
    public typealias DeletePlantClosure = (String?) -> Void
    
    func deletePlant(planta: Planta, finalizar: @escaping DeletePlantClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/" + String(planta.id), method: .delete, encoding: JSONEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/plantas/" + String(planta.id) + "/", method: .delete, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/html"])
            .responseString { (res) in
                finalizar("Planta Desactivada")
            }
        }
    }
