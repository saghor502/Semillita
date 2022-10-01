//
//  leerPlantaService.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//


import Alamofire

// https://github.com/Alamofire/Alamofire
class PlantaService {
    let refreshFunction = RefreshToken()
    public typealias LeerPlantaClosure = (Planta?) -> Void
    public typealias ReadPlantClosure = (Planta?) -> Void
    
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
    }
    
    func readPlant(nombre: String, finalizar: @escaping ReadPlantClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.request("https://tc2007b-semillita.herokuapp.com/api/planta/"+nombre.replacingOccurrences(of: " ", with: "%20") + "/", method: .get, encoding: JSONEncoding.default, headers: headers)
        // AF.request("http://localhost:8080/api/planta/"+nombre.replacingOccurrences(of: " ", with: "%20")+"/", method: .get, encoding: JSONEncoding.default, headers: headers)
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
