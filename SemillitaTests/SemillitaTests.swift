//
//  SemillitaTests.swift
//  SemillitaTests
//
//  Created by Ángel Saghir Rodríguez Fernández on 06/09/22.
//

import XCTest
@testable import Semillita

class SemillitaTests: XCTestCase {
    let planta = PlantaService()
    let catalogo = Catalogo()
    let analiticos = AnaliticosService()
    let add = AddPlantService()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testObtenerPlanta() throws {
        //Given
        let idPlanta = 75
       
        //When
        planta.leerPlanta(plantaId:idPlanta){
            (plantaRecibida) in
        
            //Then
            XCTAssertEqual(plantaRecibida!.nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.nombre_cientifico, "Planta mamastrosa")
            XCTAssertEqual(plantaRecibida!.especie, "Prueba")
            XCTAssertEqual(plantaRecibida!.origen, "Peru")
            XCTAssertEqual(plantaRecibida!.temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.estatus, true)
            XCTAssertEqual(plantaRecibida!.descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.fertilizante, "Fertilizante prueba")
            XCTAssertEqual(plantaRecibida!.riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.iluminacion, "Iluminacion prueba")
            XCTAssertEqual(plantaRecibida!.usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.usos[1], "Alimento")
            
        }
        
    }
    
    func testObtenerCatalogo() throws {
        //Given

        //When
        catalogo.leerCata(){
            (plantaRecibida) in
        
            //Then
            XCTAssertEqual(plantaRecibida!.results[0].id, 74)
            XCTAssertEqual(plantaRecibida!.results[0].nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.results[0].nombre_cientifico, "Planta mamastrosa")
            XCTAssertEqual(plantaRecibida!.results[0].especie, "Prueba")
            XCTAssertEqual(plantaRecibida!.results[0].origen, "Peru")
            XCTAssertEqual(plantaRecibida!.results[0].temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.results[0].estatus, true)
            XCTAssertEqual(plantaRecibida!.results[0].descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.results[0].fertilizante, "Fertilizante prueba")
            XCTAssertEqual(plantaRecibida!.results[0].riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.results[0].iluminacion, "Iluminacion prueba")
            XCTAssertEqual(plantaRecibida!.results[0].usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.results[0].usos[1], "Alimento")
            XCTAssertEqual(plantaRecibida!.results[1].id, 75)
            XCTAssertEqual(plantaRecibida!.results[1].nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.results[1].nombre_cientifico, "Planta mamastrosa")
            XCTAssertEqual(plantaRecibida!.results[1].especie, "Prueba")
            XCTAssertEqual(plantaRecibida!.results[1].origen, "Peru")
            XCTAssertEqual(plantaRecibida!.results[1].temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.results[1].estatus, true)
            XCTAssertEqual(plantaRecibida!.results[1].descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.results[1].fertilizante, "Fertilizante prueba")
            XCTAssertEqual(plantaRecibida!.results[1].riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.results[1].iluminacion, "Iluminacion prueba")
            XCTAssertEqual(plantaRecibida!.results[1].usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.results[1].usos[1], "Alimento")
            
        }
        
    }
    
    
    func testObtenerAnaliticos() throws {
        //Given
       
        //When
        analiticos.leerAnaliticos(){
            (plantaRecibida) in
        
            //Then
            XCTAssertEqual(plantaRecibida![0].id, 74)
            
        }
    
    }
    
}
