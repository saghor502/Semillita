//
//  CatalagoTodasViewController.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 28/09/22.
//

import Foundation
import UIKit

class CatalagoTodasViewController: UIViewController {
    
    private let swiftBetaCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftBetaCollectionView.backgroundColor = .blue
        view.addSubview(swiftBetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftBetaCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftBetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftBetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftBetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
