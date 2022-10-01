//
//  EnviarQRService.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 28/09/22.
//

import Foundation
import Alamofire

// https://github.com/Alamofire/Alamofire

/// Clase utilizada para enviar QRs
class EnviarQRService {
    /// Objeto de tipo RefreshToken
    let refreshFunction = RefreshToken()
    /// Objeto de tipo ImageFunctions
    let imageFunctions = ImageFunctions()
    /// Definición de closure para enviar QRs
    public typealias EnviarQRClosure = (String?) -> Void
    
    
    /// Función para enviar QR
    /// - Parameters:
    ///   - image: imagen del qr a enviar en base64
    ///   - nombre_tradicional: nombre_tradicional de la planta
    ///   - finalizar: Nada
    func enviarQR(image: String, nombre_tradicional: String, finalizar: @escaping EnviarQRClosure) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+JWT.token+"")])
        AF.upload(multipartFormData: {
            (form) in
            form.append(self.imageFunctions.convert(base64: image).pngData()!, withName: "dato", fileName: "plant-image.jpeg", mimeType: "image/png");
            form.append(nombre_tradicional.data(using: .utf8)!,  withName: "nombre_tradicional")
        }, to: "https://tc2007b-semillita.herokuapp.com/api/qr/",
        // to: "http://localhost:8080/api/qr/",
        usingThreshold: UInt64.init(),
        method: .post,
        headers: headers)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseString() { res in
            switch res.result {
            case .success:
                finalizar("QR Enviado")
            case let .failure(error):
                if res.response?.statusCode == 401 && JWT.counter < 1 {
                    self.refreshFunction.refresh()
                    JWT.counter += 1
                    self.enviarQR(image: image, nombre_tradicional: nombre_tradicional, finalizar: finalizar)
                } else {
                    print(error)
                    finalizar("QR No Enviado")
                }
            }
        }
            
    }
}
