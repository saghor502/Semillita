//
//  CellCatalogo.swift
//  Semillita
//
//  Created by Abdiel Alejandro Ramírez Barrón on 29/09/22.
//

import Foundation

class CellCatalogo{
    
    let CataServicio = Catalogo()
    
    func obtenerPlantas(indice : Int){
        CataServicio.leerCata(){
            (plantaRecibida) in
            print("Si se ve esto funciono:")
            print(plantaRecibida!.results[indice].nombre_tradicional)
            
        }
    }
}
 
