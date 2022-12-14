//
//  PlantasCollectionViewController.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 28/09/22.
//

import UIKit

class PlantasCollectionViewController: UICollectionViewController {
    
    let CataServicio = Catalogo()
    
    var plantasP: listaPlantas? = nil
    
    var planta: Planta? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CataServicio.leerCata(){
            (plantaRecibida) in
            self.plantasP = plantaRecibida
            self.collectionView.reloadData()
            print("se supone que ya se cargo")
            print(self.plantasP!.results[0].nombre_cientifico)
        }
        
        

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantasP?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPlanta", for: indexPath) as? CollectionViewCell{
            
                countryCell.configure(with: plantasP!.results[indexPath.row].nombre_tradicional)
            print(plantasP!.results[indexPath.row].id)
            print(plantasP!.results[indexPath.row].especie)
            print(plantasP!.results[indexPath.row].fertilizante)
            print(plantasP!.results[indexPath.row].iluminacion)
            print(plantasP!.results[indexPath.row].nombre_tradicional)
            print(plantasP!.results[indexPath.row].nombre_cientifico)
            print(plantasP!.results[indexPath.row].origen)
            print(plantasP!.results[indexPath.row].riego)
            print(plantasP!.results[indexPath.row].usos)
            print(plantasP!.results[indexPath.row].descripcion)
            print(plantasP!.results[indexPath.row].temporada)

            
            if plantasP!.results[indexPath.row].Pimagenes!.count < 1 {
                countryCell.imagen(with: "")
            } else {
                countryCell.imagen(with: plantasP!.results[indexPath.row].Pimagenes![0].dato)
            }
            
            
            
            cell = countryCell
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.plantasP?.results[indexPath.row].id ?? "0")
        self.planta = plantasP?.results[indexPath.row]
        print("este mero")
        print(self.planta!.nombre_tradicional)
        self.performSegue(withIdentifier:"CatToDetail" , sender: self )
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("porfavor muestra este mensaje")
        print(planta?.nombre_tradicional)
        //print(self.planta?.nombre_tradicional)
        if segue.identifier == "CatToDetail",
           let secondViewController = segue.destination as? DetallesPlantaViewController {
            //print(self.planta?.nombre_tradicional)
            secondViewController.plant = self.planta
        }
    }
    
}
