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
    
    @IBOutlet weak var errorLabel: UILabel!
    let detallesPlantaServicio = PlantaService()
    weak var viewController: PlantaTableViewController?
    var plant: Planta? = nil
    let enviarQRService = EnviarQRService()
    let imageFunctions = ImageFunctions()
    let imprimirQRService = ImprimirQRService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        self.viewController?.plant = plant
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadPlanta",
           let secondViewController = segue.destination as? PlantaTableViewController {
            self.viewController = secondViewController
            secondViewController.viewController = self
        }
        if segue.identifier == "Detail_To_ImprimirQR",
           let secondViewController = segue.destination as? ImprimirQRViewController {
            secondViewController.plant = self.plant!
        }
        if segue.identifier == "Detail_To_Edit",
           let secondViewController = segue.destination as? EditarViewController {
            //print(self.planta?.nombre_tradicional)
            secondViewController.plant = self.plant
        }
    }
    
    @IBAction func imprimirQR(_ sender: UIButton) {
        self.errorLabel.text = ""
        self.imprimirQRService.imprimirQR(planta_id: String(plant!.id)) {
            (imagenRecibida) in
            guard imagenRecibida != "Planta no encontrada" else {
                self.errorLabel.text = "Hubo un error al crear el QR"
                return
            }
                let img_string = imagenRecibida
                self.enviarQRService.enviarQR(image: img_string, nombre_tradicional: self.plant!.nombre_tradicional) {  response in
                    guard response != nil else {
                        self.errorLabel.text = "Hubo un error al mandar el QR"
                        return
                    }
                print(response!)
                self.performSegue(withIdentifier: "Detail_To_BuscarQR", sender: self)
        }
        
    }
}
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
