//
//  AddImageService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 26/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire
class AddImageService {
    public typealias AddImageClosure = (Imagen?) -> Void
    
    func addImage(imagen: AddImage, finalizar: @escaping AddImageClosure) {
        AF.upload(multipartFormData: {
            (form) in
            form.append(imagen.dato, withName: "dato", fileName: "plant-image.jpeg", mimeType: imagen.tipo);
            form.append(imagen.tipo.data(using: .utf8)!, withName: "tipo");
            form.append(imagen.planta_id.data(using: .utf8)!,  withName: "planta_id")
        },
        // to: "http://localhost:8080/api/imagenes/")
        to: "https://tc2007b-semillita.herokuapp.com/api/imagenes/")
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseDecodable(of: Imagen.self)
        { (respuesta) in
        switch respuesta.result {
            case .success:
                print(respuesta.value!)
                finalizar(respuesta.value)
            case let .failure(error):
                print(error)
                finalizar(nil)
        }
        }
    }
}
