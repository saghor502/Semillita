//
//  LogInViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 23/09/22.
//

import Foundation
import UIKit
import Alamofire

class LogInViewController: UIViewController {
    
    let logInServicio = LogInService()
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInUser(_ sender: UIButton) {

        logInServicio.logIn(username: username.text!, password: password.text!) { (result) in
            guard result == "Usuario autenticado" else { self.error.text = "Usuario o contraseña incorrectos"; return }
            self.performSegue(withIdentifier: "Login_To_Catalogo", sender: self)
            }
        }
    }
