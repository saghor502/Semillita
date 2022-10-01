//
//  CatalogoViewController.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import Foundation
import UIKit
import Alamofire

class CatalogoViewController: UIViewController {
    
    @IBOutlet weak var catalogoTodas: UICollectionView!
    
    
    //let CataServicio = Catalogo()
    var plant: Planta? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
