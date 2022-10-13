//
//  TablaAnaliticosViewController.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 27/09/22.
//

import Foundation
import UIKit

class TablaAnaliticosViewController : UITableViewController {
    
    @IBOutlet var Table: UITableView!
    @IBOutlet weak var PlantaN1: UIImageView!
    @IBOutlet weak var PlantaN2: UIImageView!
    @IBOutlet weak var PlantaN3: UIImageView!
    @IBOutlet weak var LabelPlantaN1: UILabel!
    @IBOutlet weak var LabelPlantaN2: UILabel!
    @IBOutlet weak var LabelPlantaN3: UILabel!
    @IBOutlet weak var grafica: UIImageView!
    
    let analiticosService = AnaliticosService()
    
    let funcionImagen = ImageFunctions()
    
    var resultado: AnaliticosObject? = nil {
        didSet {
            
            self.LabelPlantaN1.text = resultado!.popularPlants[0].nombre_tradicional
            self.LabelPlantaN2.text = resultado!.popularPlants[1].nombre_tradicional
            self.LabelPlantaN3.text = resultado!.popularPlants[2].nombre_tradicional
           
            self.PlantaN1.image = funcionImagen.convert(base64: resultado!.popularPlants[0].Pimagenes![0].dato)
            self.PlantaN2.image = funcionImagen.convert(base64: resultado!.popularPlants[1].Pimagenes![0].dato)
            self.PlantaN3.image = funcionImagen.convert(base64: resultado!.popularPlants[2].Pimagenes![0].dato)
            self.grafica.image = funcionImagen.convert(base64: resultado!.graph)
        }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
