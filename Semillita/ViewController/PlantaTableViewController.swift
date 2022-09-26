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
    @IBOutlet weak var usos: UILabel!
    @IBOutlet weak var cuidados: UILabel!
    let imageUtil = ImageFunctions()
    let deletePlantService = DeletePlantService()
    
    var plant:Planta? = nil {
        didSet {
            nombre_tradicional.text = plant?.nombre_tradicional
            nombre_cientifico.text = "Nombre Científico: " + plant!.nombre_cientifico
            // imagen.image = imageUtil.convert(base64: (plant?.Pimagenes![0].dato)!)
            descripcion.text = plant?.descripcion
            origen.text = plant?.origen
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deletePlant(_ sender: UIButton) {
        deletePlantService.deletePlant(planta: self.plant!) { (res) in
            print(res)
            // self.performSegue(withIdentifier: "Detail_To_Catalogo", sender: self)
        }
    }
}