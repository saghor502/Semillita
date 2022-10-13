//
//  PlantaTableViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 25/09/22.
//

import Foundation
import UIKit

class PlantaTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var nombre_tradicional: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre_cientifico: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    @IBOutlet weak var origen: UILabel!
    @IBOutlet weak var riego: UILabel!
    @IBOutlet weak var fertilizante: UILabel!
    @IBOutlet weak var iluminacion: UILabel!
    @IBOutlet weak var usos: UILabel!
    @IBOutlet weak var temporada: UILabel!
    
    let imageUtil = ImageFunctions()
    let deletePlantService = DeletePlantService()
    weak var viewController: UIViewController!
    
    var plant:Planta? = nil {
        didSet {
            nombre_tradicional.text = plant?.nombre_tradicional
            nombre_cientifico.text = "Nombre Científico: " + plant!.nombre_cientifico
            if (plant?.Pimagenes!.count)! > 0 {
                imagen.image = imageUtil.convert(base64: (plant?.Pimagenes![0].dato)!)
            } else {
                imagen.image = UIImage()
            }
            
            descripcion.text = plant?.descripcion
            origen.text = plant?.origen
            riego.text = "● Riego:  " + plant!.riego
            fertilizante.text = "● Fertilizante: " + plant!.fertilizante
            iluminacion.text = "● Iluminacion:  " + plant!.iluminacion
            temporada.text = "● Temporada:  " + plant!.temporada
            for uso in plant!.usos {
                usos.text = usos.text! + "● " + uso + "\n"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func editPlanta(_ sender: Any) {
        self.viewController.performSegue(withIdentifier: "Detail_To_Edit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail_To_Edit",
           let secondViewController = segue.destination as? EditarViewController {
            secondViewController.plant = self.plant
        }
    }
    
    
    @IBAction func deletePlant(_ sender: UIButton) {
        deletePlantService.deletePlant(planta: self.plant!) { (res) in
            print(res!)
            self.viewController.performSegue(withIdentifier: "Detail_To_Catalogo", sender: self)
        }
    }
}
