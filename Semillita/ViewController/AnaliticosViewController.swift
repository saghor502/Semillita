//
//  AnaliticosViewController.swift
//  Semillita
//
//  Created by Fernando Alonso Realivázquez Durán on 22/09/22.
//

import Foundation
import UIKit
import Alamofire

class AnaliticosViewController: UIViewController {
    
    weak var analiticsViewcontroller :  TablaAnaliticosViewController?

    let detallesAnaliticosServicio = AnaliticosService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detallesAnaliticosServicio.leerAnaliticos(){
            (plantaRecibida) in
            self.analiticsViewcontroller?.plantas = plantaRecibida!
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadAnaliticos", let second = segue.destination as? TablaAnaliticosViewController {
            self.analiticsViewcontroller = second
        }
    }


}
