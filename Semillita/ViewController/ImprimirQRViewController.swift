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
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var qrImage: UIImageView!
    
    var plant: Planta? = nil
    var image_string: String = ""
    let imprimirQRService = ImprimirQRService()
    let enviarQRService = EnviarQRService()
    let imagefunctions = ImageFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        nombre_tradicional.text = plant?.nombre_tradicional
        
        let new_image:UIImage = imagefunctions.convert(base64: (plant?.Pimagenes![0].dato)!)
        imagen.image = new_image
        
        imprimirQRService.imprimirQR(planta_id: String(plant!.id)) {
            (imagenRecibida) in
            guard imagenRecibida != "Planta no encontrada"
            else {
                self.errorLabel.text = "No se pudo generar el QR"
                return
            }
            print(imagenRecibida)
            self.qrImage.image = self.imagefunctions.convert(base64: imagenRecibida)
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
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
