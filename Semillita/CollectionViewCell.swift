//
//  CollectionViewCell.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 28/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagenPlanta: UIImageView!
    @IBOutlet private weak var countryLabel: UILabel!
    let imageUtil = ImageFunctions()
    
    func configure(with countryName: String){
        countryLabel.text = countryName
    }
    
    func imagen(with imagenP: String){
        imagenPlanta.image = imageUtil.convert(base64: (imagenP))
    }
}
