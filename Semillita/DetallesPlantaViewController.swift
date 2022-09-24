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
        detallesPlantaServicio.leerPlanta(plantaId:75){
            (plantaRecibida) in
            print(plantaRecibida!.nombre_tradicional)
            print(plantaRecibida!.nombre_cientifico)
            print(plantaRecibida!.origen)
            print(plantaRecibida!.fertilizante)
            print(plantaRecibida!.riego)
            print(plantaRecibida!.iluminacion)
            print(plantaRecibida!.usos)
            print(plantaRecibida!.descripcion)
            
        }   
    }
}
