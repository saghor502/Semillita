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

    @IBOutlet weak var scrollView: UIScrollView!
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
    @IBOutlet weak var errorLabel: UILabel!
    let addPlantService = AddPlantService()
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
        self.errorLabel.text = ""
        // Do any additional setup after loading the view.
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
                control.frame = CGRect(x: 0, y: 0, width: (self.scrollView.frame.width - 400), height: 20)
                control.center = CGPoint(x: (Int(self.scrollView.frame.width) - 30), y: self.height)
                control.selectedSegmentIndex = 0
                self.scrollView.addSubview(control)
                self.segments![control] = uso.id
                // Increase height to lower next items
                self.height += 20
            }
            print(self.segments!)
        }
    }
    
    @IBAction func createPlant(_ sender: UIButton) {
        for (segment, id) in self.segments! {
            if segment.selectedSegmentIndex == 1 {
                selectedUsos!.append(String(id))
            }
        }
        

        let new_plant = AddPlanta(
            especie: especie.text!,
            fertilizante: fertilizante.text!,
            iluminacion: iluminacion.text!,
            nombre_cientifico: nombre_cientifico.text!,
            nombre_tradicional: nombre_tradicional.text!,
            origen: origen.text!,
            riego: riego.text!,
            temporada: temporada.text!,
            usos: self.selectedUsos!,
            desc: descripcion.text!
        )
        addPlantService.addPlant(planta: new_plant) { (plantaRecibida) in
            guard plantaRecibida != nil else {
                self.errorLabel.text = "No se pudo agregar la planta"
                return
            }
            // Get image and upload it
            let imageObject = AddImage(
                dato: (self.image.image?.jpegData(compressionQuality: 0.75))!,
                tipo: "image/jpeg",
                planta_id: String((plantaRecibida?.id)!))
            self.addImageService.addImage(imagen: imageObject) { (res) in
                guard res != nil else {
                    // Error
                    self.errorLabel.text = "No se pudo agregar la planta"
                    return
                }
                // Despues de crear la imagen
                print("Imagen Creada")
                self.performSegue(withIdentifier: "Add_To_Catalogo", sender: self)
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
