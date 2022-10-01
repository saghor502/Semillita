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
    
    @IBOutlet weak var errorLabel: UILabel!
    weak var analiticsViewcontroller :  TablaAnaliticosViewController?

    let detallesAnaliticosServicio = AnaliticosService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
        detallesAnaliticosServicio.leerAnaliticos(){
            (plantaRecibida) in
            guard plantaRecibida != nil else {
                // Show Error
                self.errorLabel.text = "Hubo un error al cargar los analíticos"
                return
            }
            self.analiticsViewcontroller?.resultado = plantaRecibida!
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadAnaliticos", let second = segue.destination as? TablaAnaliticosViewController {
            self.analiticsViewcontroller = second
        }
    }


}
