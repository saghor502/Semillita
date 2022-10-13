//
//  BuscarQRViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Foundation
import UIKit
import Alamofire

class BuscarQRViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var buscarPlanta: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    let detallesPlantaServicio = PlantaService()
    var plant: Planta? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        self.buscarPlanta.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
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
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    }
