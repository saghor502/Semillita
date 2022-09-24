//
//  ImprimirQRViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Foundation
import UIKit
import Alamofire

class ImprimirQRViewController: UIViewController {

    let imprimirQRService = ImprimirQRService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imprimirQRService.imprimirQR(planta_id: 75) {
            (plantaRecibida) in
            print(plantaRecibida)
        }
    }
}
