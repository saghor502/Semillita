//
//  EditarViewController.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 29/09/22.
//

import Foundation
import UIKit
import Alamofire

class EditarViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    var plant: Planta? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nombre_tradicional: UITextField!
    @IBOutlet weak var nombre_cientifico: UITextField!
    @IBOutlet weak var origen: UITextField!
    @IBOutlet weak var temporada: UITextField!
    @IBOutlet weak var riego: UITextField!
    @IBOutlet weak var fertilizante: UITextField!
    @IBOutlet weak var iluminacion: UITextField!
    @IBOutlet weak var especie: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    let addPlantService = EditService()
    let addImageService = AddImageService()
    let usosService = UsosService()
    var imagePicker = UIImagePickerController()
    let imageFunctions = ImageFunctions()
    var selectedUsos: [String]? = []
    var allUsos: listaUsos? = nil
    var height: Int = 855
    var segments: [UISegmentedControl:Int]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        self.segments = [:]
        self.errorLabel.text = ""
        self.nombre_tradicional.text = self.plant?.nombre_tradicional
        self.nombre_cientifico.text = self.plant?.nombre_cientifico
        self.origen.text = self.plant?.origen
        self.temporada.text = self.plant?.temporada
        self.riego.text = self.plant?.riego
        self.fertilizante.text = self.plant?.fertilizante
        self.iluminacion.text = self.plant?.iluminacion
        self.especie.text = self.plant?.especie
        self.descripcion.text = self.plant?.descripcion

        usosService.getUsos() {
            (response) in
            self.allUsos = response
            for uso in response!.results {
                // Add label
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                label.font = UIFont.preferredFont(forTextStyle: .footnote)
                label.textColor = .black
                label.textAlignment = .left
                label.center = CGPoint(x: 35, y: self.height)
                label.textAlignment = .center
                label.text = uso.nombre
                self.scrollView.addSubview(label)
                // Add segmentedControl
                let segmentItems = ["No", "Si"]
                let control = UISegmentedControl(items: segmentItems)
                control.frame = CGRect(x: 0, y: 0, width: (self.scrollView.frame.width - 300), height: 20)
                control.center = CGPoint(x: (Int(self.scrollView.frame.width) - 40), y: self.height)
                if self.plant!.usos.contains(where: {$0 == uso.nombre}) {
                    control.selectedSegmentIndex = 1
                } else {
                    control.selectedSegmentIndex = 0
                }
                self.scrollView.addSubview(control)
                self.segments![control] = uso.id
                // Increase height to lower next items
                self.height += 20
            }
            print(self.segments!)
        }
        self.nombre_tradicional.delegate = self
        self.nombre_cientifico.delegate = self
        self.origen.delegate = self
        self.especie.delegate = self
        self.temporada.delegate = self
        self.riego.delegate = self
        self.fertilizante.delegate = self
        self.iluminacion.delegate = self
        self.descripcion.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    @IBAction func createPlant(_ sender: UIButton) {
        sender.isEnabled = false
        self.errorLabel.text = ""
        for (segment, id) in self.segments! {
            if segment.selectedSegmentIndex == 1 {
                selectedUsos!.append(String(id))
            }
        }
        

        let new_plant = EditarPlanta(
            id: self.plant?.id,
            especie: self.especie.text!,
            fertilizante: self.fertilizante.text!,
            iluminacion: self.iluminacion.text!,
            nombre_cientifico: self.nombre_cientifico.text!,
            nombre_tradicional: self.nombre_tradicional.text!,
            origen: self.origen.text!,
            riego: self.riego.text!,
            temporada: self.temporada.text!,
            usos: self.selectedUsos!,
            desc: self.descripcion.text!
        )
        addPlantService.addPlant(planta: new_plant) { (plantaRecibida) in
            guard plantaRecibida != nil else {
                self.errorLabel.text = "Hubo un error al editar la planta"
                return
            }
            // Get image and upload it
            let imageObject = AddImage(
                dato: (self.image.image?.jpegData(compressionQuality: 0.75))!,
                tipo: "image/jpeg",
                planta_id: String((self.plant?.id)!))
            self.addImageService.addImage(imagen: imageObject) { (res) in
                guard res != nil else {
                    self.errorLabel.text = "Hubo un error al añadir la imagen"
                    return
                }
                // Despues de crear la imagen
                print("Imagen Creada")
                self.performSegue(withIdentifier: "Edit_To_Catalogo", sender: self)
            }
        }
        sender.isEnabled = true
    }
    @IBAction func uploadImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.image.image = image
            }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
