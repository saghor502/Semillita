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
    @IBOutlet weak var errorLabel: UILabel!
    let detallesPlantaServicio = PlantaService()
    var plant: Planta? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        }
    
    @IBAction func buscarQR(_ sender: UIButton) {
        self.errorLabel.text = ""
        if buscarPlanta.text != "" {
            detallesPlantaServicio.readPlant(nombre: buscarPlanta.text!) {
            (plantaRecibida) in
            guard plantaRecibida != nil else {
                self.errorLabel.text = "No existe ninguna planta con ese nombre";
                print("No se armo");
                return }
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
