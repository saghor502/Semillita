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
    let Pimageness = [Imagen.init(dato:"dato", tipo:"Tipo", planta_id: 2)]
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
    
    func testImagen() throws {
        //Given
        let dato = "DatoPrueba"
        let tipo = "TipoPrueba"
        
        //When
        let imagenClase = Imagen.init(dato: dato, tipo: tipo, planta_id: 2)
        
        //Then
        XCTAssertEqual("DatoPrueba", imagenClase.dato)
        XCTAssertEqual("TipoPrueba", imagenClase.tipo)
    }
    
    func testAddPlanta() throws{
        // Given
        let especie = "Testespecie"
        let fertilizante = "FertilizanteTest"
        let iluminacion = "IluminacionTest"
        let nombre_cientifico = "NombrecienTest"
        let nombre_tradicional = "NombreTest"
        let origen = "OrigenTest"
        let riego = "Riego Test"
        let temporada = "TemporadaTest"
        let usos = ["Uso1","Uso2"]
        let descripcion = "DescripcionTest"
        
        //When
        let plantaClase = AddPlanta.init(especie: especie, fertilizante: fertilizante, iluminacion: iluminacion, nombre_cientifico: nombre_cientifico, nombre_tradicional: nombre_tradicional, origen: origen, riego: riego, temporada: temporada, usos: usos, desc: descripcion)
        
        //Then
        XCTAssertEqual("Testespecie", plantaClase.especie)
        XCTAssertEqual("FertilizanteTest", plantaClase.fertilizante)
        XCTAssertEqual("IluminacionTest", plantaClase.iluminacion)
        XCTAssertEqual("NombrecienTest", plantaClase.nombre_cientifico)
        XCTAssertEqual("NombreTest", plantaClase.nombre_tradicional)
        XCTAssertEqual("OrigenTest", plantaClase.origen)
        XCTAssertEqual("Riego Test", plantaClase.riego)
        XCTAssertEqual("TemporadaTest", plantaClase.temporada)
        XCTAssertEqual(["Uso1","Uso2"], plantaClase.usos)
        XCTAssertEqual("DescripcionTest", plantaClase.descripcion)
    }

    func testListaPlanta() throws{
        // Given
        let planta1 = Planta.init(id: 1, especie: "1", estatus: true, fertilizante: "fer1", iluminacion: "ilu1", nombre_cientifico: "nombre1", nombre_tradicional: "nombretra1", origen: "origen1", riego: "riego1", temporada: "temporada1", usos: ["uso1.0","usos1.1"], Pimagenes: [Imagen.init(dato: "dato1", tipo: "tipo1", planta_id: 1)], descripcion: "Des1")
        let planta2 = Planta.init(id: 2, especie: "2", estatus: true, fertilizante: "fer2", iluminacion: "ilu2", nombre_cientifico: "nombre2", nombre_tradicional: "nombretra2", origen: "origen2", riego: "riego2", temporada: "temporada2", usos: ["uso2.0","usos2.1"], Pimagenes: [Imagen.init(dato: "dato2", tipo: "tipo2", planta_id: 2)], descripcion: "Des2")

        //When
        let listaClase = listaPlantas.init(results:[planta1,planta2])
        
        //Then
        XCTAssertEqual(1, listaClase.results[0].id)
        XCTAssertEqual("1", listaClase.results[0].especie)
        XCTAssertEqual(true, listaClase.results[0].estatus)
        XCTAssertEqual("fer1", listaClase.results[0].fertilizante)
        XCTAssertEqual("ilu1", listaClase.results[0].iluminacion)
        XCTAssertEqual("nombre1", listaClase.results[0].nombre_cientifico)
        XCTAssertEqual("nombretra1", listaClase.results[0].nombre_tradicional)
        XCTAssertEqual("origen1", listaClase.results[0].origen)
        XCTAssertEqual("riego1", listaClase.results[0].riego)
        XCTAssertEqual("temporada1", listaClase.results[0].temporada)
        XCTAssertEqual(["uso1.0","usos1.1"], listaClase.results[0].usos)
        XCTAssertEqual("dato1", listaClase.results[0].Pimagenes![0].dato)
        XCTAssertEqual("tipo1", listaClase.results[0].Pimagenes![0].tipo)
        XCTAssertEqual("Des1", listaClase.results[0].descripcion)
        XCTAssertEqual(2, listaClase.results[1].id)
        XCTAssertEqual("2", listaClase.results[1].especie)
        XCTAssertEqual(true, listaClase.results[1].estatus)
        XCTAssertEqual("fer2", listaClase.results[1].fertilizante)
        XCTAssertEqual("ilu2", listaClase.results[1].iluminacion)
        XCTAssertEqual("nombre2", listaClase.results[1].nombre_cientifico)
        XCTAssertEqual("nombretra2", listaClase.results[1].nombre_tradicional)
        XCTAssertEqual("origen2", listaClase.results[1].origen)
        XCTAssertEqual("riego2", listaClase.results[1].riego)
        XCTAssertEqual("temporada2", listaClase.results[1].temporada)
        XCTAssertEqual(["uso2.0","usos2.1"], listaClase.results[1].usos)
        XCTAssertEqual("dato2", listaClase.results[1].Pimagenes![0].dato)
        XCTAssertEqual("tipo2", listaClase.results[1].Pimagenes![0].tipo)
        XCTAssertEqual("Des2", listaClase.results[1].descripcion)
    }
    
}


