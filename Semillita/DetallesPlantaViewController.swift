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
    
    @IBOutlet weak var container: UIView!
    let detallesPlantaServicio = PlantaService()
    var planta: Planta? = nil
    
    func getLabelsInView(view: UIView) -> [UILabel] {
        var results = [UILabel]()
        for subview in view.subviews as [UIView] {
            if let labelView = subview as? UILabel {
                results += [labelView]
            } else {
                results += getLabelsInView(view: subview)
            }
        }
        return results
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // let table = container.subviews as [UITableView]
        // let cell = table[0].cellForRow(at: IndexPath(index: 0))
        // let cell = table[0].dequeueReusableCell(withIdentifier: "planta_cell", for: IndexPath(index: 0)) as UITableViewCell
        // print(cell)
        /*
        let labels = getLabelsInView(view: table[0])
        for label in labels {
            print(label.text)
        }
         */
        detallesPlantaServicio.leerPlanta(plantaId:75){
            (plantaRecibida) in
            /*
            print(plantaRecibida!.nombre_tradicional)
            print(plantaRecibida!.nombre_cientifico)
            print(plantaRecibida!.origen)
            print(plantaRecibida!.fertilizante)
            print(plantaRecibida!.riego)
            print(plantaRecibida!.iluminacion)
            print(plantaRecibida!.usos)
            print(plantaRecibida!.descripcion)
            */
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        detallesPlantaServicio.leerPlanta(plantaId:75){
            (plantaRecibida) in
            self.planta = plantaRecibida!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
}
}
