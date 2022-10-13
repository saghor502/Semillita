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
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        
        swiftBetaCollectionView.backgroundColor = .blue
        view.addSubview(swiftBetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftBetaCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftBetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftBetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftBetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
