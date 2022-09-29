//
//  EnviarQRService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 28/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire
class EnviarQRService {
    let imageFunctions = ImageFunctions()
    public typealias EnviarQRClosure = (String?) -> Void
    
    func enviarQR(image: String, nombre_tradicional: String, finalizar: @escaping EnviarQRClosure) {

        AF.upload(multipartFormData: {
            (form) in
            form.append(self.imageFunctions.convert(base64: image).pngData()!, withName: "dato", fileName: "plant-image.jpeg", mimeType: "image/png");
            form.append(nombre_tradicional.data(using: .utf8)!,  withName: "nombre_tradicional")
        },
        // to: "http://localhost:8080/api/imagenes/")
        to: "https://tc2007b-semillita.herokuapp.com/api/qr/")
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseString() { res in
            finalizar("QR enviado")
        }
            
    }
}