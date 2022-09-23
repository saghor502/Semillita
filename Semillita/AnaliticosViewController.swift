//
//  AnaliticosViewController.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 22/09/22.
//

import Foundation
import UIKit
import Alamofire

class AnaliticosViewController: UIViewController {

    let detallesAnaliticosServicio = AnaliticosService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detallesAnaliticosServicio.leerAnaliticos(){
            (plantaRecibida) in
            print(plantaRecibida!.nombre_tradicional)
        }
    }


}
