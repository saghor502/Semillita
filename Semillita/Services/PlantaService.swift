//
//  leerPlantaService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//


import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para leer plantas por nombre o id
class PlantaService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para leer planta por id
    public typealias LeerPlantaClosure = (Planta?) -> Void
    /// Definición de closure para leer planta por nombre
    public typealias ReadPlantClosure = (Planta?) -> Void
    
    /// Función utilizaada para leer planta por id
    /// - Parameters:
    ///   - plantaId: id de la planta a buscar
    ///   - finalizar: nada
    func leerPlanta(plantaId: Int, finalizar: @escaping LeerPlantaClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/plantas/"+String(plantaId) + "/", method: .get, encoding: JSONEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/plantas/"+String(plantaId)+"/", method: .get, encoding: JSONEncoding.default, headers: headers)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseDecodable(of: Planta.self) { respuesta in
        switch respuesta.result {
            case .success:
                print(respuesta.value?.id)
                finalizar(respuesta.value)
            case let .failure(error):
                if respuesta.response?.statusCode == 401 && JWT.counter < 1 {
                    self.refreshFunction.refresh()
                    JWT.counter += 1
                    self.leerPlanta(plantaId: plantaId, finalizar: finalizar)
                } else {
                    print(error)
                    finalizar(nil)
                }
                
        }
        }
    }
    
    /// Función utilizada para buscar una planta por nombre
    /// - Parameters:
    ///   - nombre: nombre de la planta a buscar
    ///   - finalizar: nada
    func readPlant(nombre: String, finalizar: @escaping ReadPlantClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/planta/", method: .get, parameters: ["nombre_tradicional": nombre], encoding: URLEncoding(destination: .queryString), headers: headers)
        //AF.request("http://localhost:8080/api/planta/", method: .get, parameters: ["nombre_tradicional": nombre], encoding: URLEncoding(destination: .queryString), headers: headers)
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
                        self.readPlant(nombre: nombre, finalizar: finalizar)
                    } else {
                        print(error)
                        finalizar(nil)
                    }
                    
            }
        }
    }
}
