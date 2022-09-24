//
//  LogInViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 23/09/22.
//

import Foundation
import UIKit
import Alamofire

class LogInViewController: UIViewController {
    
    let logInServicio = LogInService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logInServicio.logIn(username: "equipo", password: "semillita1738"){
            (plantaRecibida) in
            print(plantaRecibida)
        }
    }
}
