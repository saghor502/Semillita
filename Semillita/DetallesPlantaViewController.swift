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

    // let detallesPlantaServicio = PlantaService()
    let addPlantService = AddPlantService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        detallesPlantaServicio.leerPlanta(plantaId:21){
            (plantaRecibida) in
            print(plantaRecibida!.Pimagenes[0].tipo)
        }
        */
        let new_plant = AddPlanta(especie: "Prueba", fertilizante: "Fertilizante prueba", iluminacion: "Iluminacion prueba", nombre_cientifico: "Planta mamastrosa", nombre_tradicional: "Plantototototota", origen: "Peru", riego: "3 veces al dia", temporada: "Invierno", usos: ["1","2"]
        )
        addPlantService.addPlant(planta: new_plant) {
            (plantaRecibida) in
            //print(plantaRecibida!.nombre_cientifico)
        
        }
    }
}
