//
//  TablaAnaliticosViewController.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 27/09/22.
//

import Foundation
import UIKit
import Charts

class TablaAnaliticosViewController : UITableViewController {
    
    @IBOutlet var Table: UITableView!
    @IBOutlet weak var PlantaN1: UIImageView!
    @IBOutlet weak var PlantaN2: UIImageView!
    @IBOutlet weak var PlantaN3: UIImageView!
    @IBOutlet weak var LabelPlantaN1: UILabel!
    @IBOutlet weak var LabelPlantaN2: UILabel!
    @IBOutlet weak var LabelPlantaN3: UILabel!
    
    
    let analiticosService = AnaliticosService()
    
    let funcionImagen = ImageFunctions()
    
    var plantas: [Planta]? = nil {
        didSet {
            
            self.LabelPlantaN1.text = plantas![0].nombre_tradicional
            self.LabelPlantaN2.text = plantas![1].nombre_tradicional
            self.LabelPlantaN3.text = plantas![2].nombre_tradicional
           
            self.PlantaN1.image = funcionImagen.convert (base64: plantas![0].Pimagenes![0].dato)
            self.PlantaN2.image = funcionImagen.convert (base64: plantas![1].Pimagenes![0].dato)
            self.PlantaN3.image = funcionImagen.convert (base64: plantas![2].Pimagenes![0].dato)
        
        }
    }
    
}
