//
//  RefreshToken.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 30/09/22.
//

import Foundation
import Alamofire

class RefreshToken {
    func refresh() {
        AF.request("https://tc2007b-semillita.herokuapp.com/api/token/refresh/", method: .post, parameters: ["refresh": JWT.refresh], encoder: JSONParameterEncoder())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: Token.self) { (res) in
                JWT.token = (res.value?.access)!
            }
    }
}
