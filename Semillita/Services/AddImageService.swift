//
//  AddImageService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para agregar imagenes
class AddImageService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Definición de closure para agregar imagenes
    public typealias AddImageClosure = (Imagen?) -> Void
    
    
    /// Función para agregar imágenes
    /// - Parameters:
    ///   - imagen: objeto de tipo AddImage para agregar
    ///   - finalizar: Nada
    func addImage(imagen: AddImage, finalizar: @escaping AddImageClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.upload(multipartFormData: {
            (form) in
            form.append(imagen.dato, withName: "dato", fileName: "plant-image.jpeg", mimeType: imagen.tipo);
            form.append(imagen.tipo.data(using: .utf8)!, withName: "tipo");
            form.append(imagen.planta_id.data(using: .utf8)!,  withName: "planta_id")
        }, to: "https://tc2007b-semillita.herokuapp.com/api/imagenes/",
        //to: "http://localhost:8080/api/imagenes/",
        usingThreshold: UInt64.init(),
        method: .post,
        headers: headers)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseDecodable(of: Imagen.self)
        { (respuesta) in
        switch respuesta.result {
            case .success:
                print(respuesta.value!)
                finalizar(respuesta.value)
            case let .failure(error):
                if respuesta.response?.statusCode == 401 && JWT.counter < 1 {
                    self.refreshFunction.refresh()
                    JWT.counter += 1
                    self.addImage(imagen: imagen, finalizar: finalizar)
                } else {
                    print(error)
                    finalizar(nil)
                }
        }
        }
    }
}
