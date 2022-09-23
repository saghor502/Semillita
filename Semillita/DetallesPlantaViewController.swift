//
//  DetallesPlantaController.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 22/09/22.
//

import Foundation
import UIKit
import Alamofire

class DetallesPlantaViewController: UIViewController {

    let detallesPlantaServicio = PlantaService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detallesPlantaServicio.leerPlanta(plantaId:21){
            (plantaRecibida) in
            print(plantaRecibida!.Pimagenes[0].tipo)
        }
    }


}

