//
//  TipoClasesTest.swift
//  SemillitaTests
//
//  Created by Abdiel Alejandro Ramírez Barrón on 24/09/22.
//

import XCTest
@testable import Semillita

class TipoClasesTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlanta() throws{
        // Given
        let id = 1
        let especie = "Testespecie"
        let estatus = true
        let fertilizante = "FertilizanteTest"
        let iluminacion = "IluminacionTest"
        let nombre_cientifico = "NombrecienTest"
        let nombre_tradicional = "NombreTest"
        let origen = "OrigenTest"
        let riego = "Riego Test"
        let temporada = "TemporadaTest"
        let usos = ["Uso1","Uso2"]
        let Pimageness = [Imagen.init(dato:"dato", tipo:"Tipo")]
        let descripcion = "DescripcionTest"
        
        //When
        let plantaClase = Planta.init(id: id, especie: especie, estatus: estatus, fertilizante: fertilizante, iluminacion: iluminacion, nombre_cientifico: nombre_cientifico, nombre_tradicional: nombre_tradicional, origen: origen, riego: riego, temporada: temporada, usos: usos, Pimagenes: Pimageness, descripcion: descripcion)
        
        //Then
        XCTAssertEqual(1, plantaClase.id)
        XCTAssertEqual("Testespecie", plantaClase.especie)
        XCTAssertEqual(true, plantaClase.estatus)
        XCTAssertEqual("FertilizanteTest", plantaClase.fertilizante)
        XCTAssertEqual("IluminacionTest", plantaClase.iluminacion)
        XCTAssertEqual("NombrecienTest", plantaClase.nombre_cientifico)
        XCTAssertEqual("NombreTest", plantaClase.nombre_tradicional)
        XCTAssertEqual("OrigenTest", plantaClase.origen)
        XCTAssertEqual("Riego Test", plantaClase.riego)
        XCTAssertEqual("TemporadaTest", plantaClase.temporada)
        XCTAssertEqual(["Uso1","Uso2"], plantaClase.usos)
        XCTAssertEqual(Pimageness[0].dato, plantaClase.Pimagenes![0].dato)
        XCTAssertEqual(Pimageness[0].tipo, plantaClase.Pimagenes![0].tipo)
        XCTAssertEqual("DescripcionTest", plantaClase.descripcion)
    }
    
    

}
