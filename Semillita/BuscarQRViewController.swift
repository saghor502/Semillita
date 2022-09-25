//
//  BuscarQRViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Foundation
import UIKit
import Alamofire

class BuscarQRViewController: UIViewController {
    
    @IBOutlet weak var buscarPlanta: UITextField!
    let detallesPlantaServicio = PlantaService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
    
    @IBAction func buscarQR(_ sender: UIButton) {
        if buscarPlanta != nil {
        detallesPlantaServicio.leerPlanta(plantaId: Int(buscarPlanta.text!)!){
            (plantaRecibida) in
            guard plantaRecibida != nil else { print("No se armo"); return }
                self.performSegue(withIdentifier: "BuscarQR_To_ImprimirQR", sender: self)
            }
        }
    }
}
