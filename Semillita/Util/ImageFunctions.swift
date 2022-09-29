//
//  ImageFunctions.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 25/09/22.
//

import Foundation
import UIKit

class ImageFunctions {
    func convert(base64:String) -> UIImage {
        let imageData = Data(base64Encoded: base64.replacingOccurrences(of: "\"", with: ""))
        let image = UIImage(data: imageData!)
        return image!
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
}
