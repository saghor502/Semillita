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
    
    let detallesPlantaServicio = PlantaService()
    weak var viewController: PlantaTableViewController?
    var plant: Planta? = nil
    let enviarQRService = EnviarQRService()
    let imageFunctions = ImageFunctions()
    let imprimirQRService = ImprimirQRService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        detallesPlantaServicio.leerPlanta(plantaId:126){
            (plantaRecibida) in
            self.plant = plantaRecibida!
            self.viewController?.plant = plantaRecibida!
        }
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
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    @IBAction func imprimirQR(_ sender: UIButton) {

        self.imprimirQRService.imprimirQR(planta_id: String(plant!.id)) {
            (imagenRecibida) in
                let img_string = imagenRecibida
                self.enviarQRService.enviarQR(image: img_string, nombre_tradicional: self.plant!.nombre_tradicional) {  response in
                print(response)
                self.performSegue(withIdentifier: "Detail_To_BuscarQR", sender: self)
        }
        
    }
}
}
