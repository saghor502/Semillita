//
//  leerPlantaService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//


import Alamofire

// https://github.com/Alamofire/Alamofire
class PlantaService {
    public typealias LeerPlantaClosure = (Planta?) -> Void
    public typealias ReadPlantClosure = (Planta?) -> Void
    
    func leerPlanta(plantaId: Int, finalizar: @escaping LeerPlantaClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/"+String(plantaId), method: .get)
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
    
    func readPlant(nombre: String, finalizar: @escaping ReadPlantClosure) {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/planta/"+nombre, method: .get)
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
