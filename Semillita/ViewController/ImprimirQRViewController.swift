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
    
    var plant: Planta?
    let imprimirQRService = ImprimirQRService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nombre_tradicional.text = plant?.nombre_tradicional
        nombre_cientifico.text = plant?.nombre_cientifico
        
        let imagefunctions = ImageFunctions()
        let new_image:UIImage = imagefunctions.convert(base64: (plant?.Pimagenes![0].dato)!)
        imagen.image = new_image
        imprimirQRService.imprimirQR(planta_id: String(plant!.id)) {
            (plantaRecibida) in
            print(plantaRecibida)
        }
    }
    init() {
        plant = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
