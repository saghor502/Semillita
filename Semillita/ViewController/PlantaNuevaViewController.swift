//
//  CatalogoViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 22/09/22.
//

import Foundation
import UIKit
import Alamofire

class PlantaNuevaViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {

    @IBOutlet weak var nombre_tradicional: UITextField!
    @IBOutlet weak var nombre_cientifico: UITextField!
    @IBOutlet weak var origen: UITextField!
    @IBOutlet weak var especie: UITextField!
    @IBOutlet weak var temporada: UITextField!
    @IBOutlet weak var riego: UITextField!
    @IBOutlet weak var fertilizante: UITextField!
    @IBOutlet weak var iluminacion: UITextField!
    @IBOutlet weak var descripcion: UITextView!
    @IBOutlet weak var image: UIImageView!
    let addPlantService = AddPlantService()
    let addImageService = AddImageService()
    var imagePicker = UIImagePickerController()
    let imageFunctions = ImageFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createPlant(_ sender: UIButton) {
        let new_plant = AddPlanta(
            especie: especie.text!,
            fertilizante: fertilizante.text!,
            iluminacion: iluminacion.text!,
            nombre_cientifico: nombre_cientifico.text!,
            nombre_tradicional: nombre_tradicional.text!,
            origen: origen.text!,
            riego: riego.text!,
            temporada: temporada.text!,
            usos: ["1"],
            desc: descripcion.text!
        )
        addPlantService.addPlant(planta: new_plant) { (plantaRecibida) in
            // Get image and upload it
            let imageObject = AddImage(
                dato: (self.image.image?.jpegData(compressionQuality: 0.75))!,
                tipo: "image/jpeg",
                planta_id: String((plantaRecibida?.id)!))
            self.addImageService.addImage(imagen: imageObject) { (res) in
                // Despues de crear la imagen
                print("Imagen Creada")
            }
        }
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
}
