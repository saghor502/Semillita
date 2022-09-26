//
//  CatalogoViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 22/09/22.
//

import Foundation
import UIKit
import Alamofire

class PlantaNuevaViewController: UIViewController {

    let addPlantService = AddPlantService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let new_plant = AddPlanta(especie: "Prueba", fertilizante: "Fertilizante prueba", iluminacion: "Iluminacion prueba", nombre_cientifico: "Planta mamastrosa", nombre_tradicional: "Plantototototota", origen: "Peru", riego: "3 veces al dia", temporada: "Invierno", usos: ["1", "2"], desc: "hola"
        )
        addPlantService.addPlant(planta: new_plant) {
            (plantaRecibida) in
            print(plantaRecibida)
        }
    }
}
