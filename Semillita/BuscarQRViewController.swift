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
    var plant: Planta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
    init() {
        plant = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @IBAction func buscarQR(_ sender: UIButton) {
        if buscarPlanta != nil {
            detallesPlantaServicio.readPlant(nombre: buscarPlanta.text!) {
            (plantaRecibida) in
            guard plantaRecibida != nil else { print("No se armo"); return }
                self.plant = plantaRecibida
                self.performSegue(withIdentifier: "BuscarQR_To_ImprimirQR", sender: self)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BuscarQR_To_ImprimirQR",
           let secondViewController = segue.destination as? ImprimirQRViewController {
            secondViewController.plant = plant
            }
        }
    }
