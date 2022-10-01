//
//  ImprimirQRViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 24/09/22.
//

import Foundation
import UIKit
import Alamofire

class ImprimirQRViewController: UIViewController {

    @IBOutlet weak var nombre_tradicional: UILabel!
    @IBOutlet weak var nombre_cientifico: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var plant: Planta? = nil
    var image_string: String = ""
    let imprimirQRService = ImprimirQRService()
    let enviarQRService = EnviarQRService()
    let imagefunctions = ImageFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        nombre_tradicional.text = plant?.nombre_tradicional
        nombre_cientifico.text = plant?.nombre_cientifico
        
        let new_image:UIImage = imagefunctions.convert(base64: (plant?.Pimagenes![0].dato)!)
        imagen.image = new_image
        imprimirQRService.imprimirQR(planta_id: String(plant!.id)) {
            (imagenRecibida) in
            guard imagenRecibida != "Planta no encontrada" else {
                self.errorLabel.text = "No se pudo generar el QR"
                return
            }
            self.image_string = imagenRecibida
        }
    }
    
    @IBAction func enviarQR(_ sender: UIButton) {
        self.enviarQRService.enviarQR(image: self.image_string, nombre_tradicional: self.plant!.nombre_tradicional) { response in
            guard response != "QR No Enviado" else {
                self.errorLabel.text = "No se pudo enviar el QR"
                return
            }
            // Perform segue
            self.performSegue(withIdentifier: "ImprimirQR_To_BuscarQR", sender: self)
        }
    }
}
