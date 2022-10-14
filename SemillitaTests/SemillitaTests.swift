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
    let logIn = LogInService()
    let imprimir = ImprimirQRService()
    let addPlanta = AddPlantService()
    let editar = EditService()
    let eliminar = DeletePlantService()
    
    var idPPlanta:Planta? =  nil
    var plantaID = 0
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testLogInValido() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            XCTAssertEqual(result, "Usuario autenticado")
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
    }
    
    func testLogInInvalido() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo2", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            XCTAssertEqual(result, "Usuario no autenticado")
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
    }
    
    func testObtenerPlanta() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        let idPlanta = 132
       
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        planta.leerPlanta(plantaId:idPlanta){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida!.nombre_tradicional, "Romero")
            XCTAssertEqual(plantaRecibida!.nombre_cientifico, "Salvia rosmarinus")
            XCTAssertEqual(plantaRecibida!.especie, "Lamiaceae")
            XCTAssertEqual(plantaRecibida!.origen, "Nativa de la región Mediterránea")
            XCTAssertEqual(plantaRecibida!.temporada, "Esta planta puede crecer a cualquier temporada del año")
            XCTAssertEqual(plantaRecibida!.descripcion, "El romero es un arbusto aromático, leñoso, de hojas perennes, muy ramificado y ocasionalmente achaparrado y que puede llegar a medir hasta 2 metros de altura. Los tallos jóvenes están cubiertos de borra que desaparece al crecer, a medida que envejecen se vuelven de color rojizo y con la corteza resquebrajada.")
            XCTAssertEqual(plantaRecibida!.fertilizante, "Bajo tratamiento de químicos y abonos")
            XCTAssertEqual(plantaRecibida!.riego, "Poca cantidad de agua")
            XCTAssertEqual(plantaRecibida!.iluminacion, "Necesita la luz natural del sol")
            XCTAssertEqual(plantaRecibida!.usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.usos[1], "Alimento")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
    }


func testCatalogo() throws {
    //Given
    let conversionExpectation = expectation(description: "Conversion Terminada")
    logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
        conversionExpectation.fulfill()
        }
    
    waitForExpectations(timeout: 10) {
                (error) in

                if let error = error {
                    XCTFail("waitForExpectations errored: \(error)")
                } else {
                    XCTAssert(true)
                }
    
}
    //When
    let conversionExpectation2 = expectation(description: "Conversion Terminada")
    catalogo.leerCata(){
        (plantaRecibida) in
        conversionExpectation2.fulfill()
        //Then
        XCTAssertEqual(plantaRecibida!.results[0].nombre_tradicional, "Romero")
        XCTAssertEqual(plantaRecibida!.results[0].nombre_cientifico, "Salvia rosmarinus")
        XCTAssertEqual(plantaRecibida!.results[0].especie, "Lamiaceae")
        XCTAssertEqual(plantaRecibida!.results[0].origen, "Nativa de la región Mediterránea")
        XCTAssertEqual(plantaRecibida!.results[0].temporada, "Esta planta puede crecer a cualquier temporada del año")
        XCTAssertEqual(plantaRecibida!.results[0].descripcion, "El romero es un arbusto aromático, leñoso, de hojas perennes, muy ramificado y ocasionalmente achaparrado y que puede llegar a medir hasta 2 metros de altura. Los tallos jóvenes están cubiertos de borra que desaparece al crecer, a medida que envejecen se vuelven de color rojizo y con la corteza resquebrajada.")
        XCTAssertEqual(plantaRecibida!.results[0].fertilizante, "Bajo tratamiento de químicos y abonos")
        XCTAssertEqual(plantaRecibida!.results[0].riego, "Poca cantidad de agua")
        XCTAssertEqual(plantaRecibida!.results[0].iluminacion, "Necesita la luz natural del sol")
        XCTAssertEqual(plantaRecibida!.results[0].usos[0], "Medicinal")
        XCTAssertEqual(plantaRecibida!.results[0].usos[1], "Alimento")
        
    }
    
    waitForExpectations(timeout: 10) {
                (error) in

                if let error = error {
                    XCTFail("waitForExpectations errored: \(error)")
                } else {
                    XCTAssert(true)
                }
            }
}

    func testAnaliticos() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        analiticos.leerAnaliticos(){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida!.popularPlants[0].id, 133)
            XCTAssertEqual(plantaRecibida!.popularPlants[1].id, 134)
            XCTAssertEqual(plantaRecibida!.popularPlants[2].id, 132)
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
    }
    
    
    func testObtenerQR() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        let nombrePlanta = "132"
       
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        imprimir.imprimirQR(planta_id:nombrePlanta){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida, "\"iVBORw0KGgoAAAANSUhEUgAAAZoAAAGaAQAAAAAefbjOAAAC8klEQVR4nO2cTW6jQBBGX00jZQlSDpCjtG82ypHmBnAU3wCWkRp9s+huwM5sMs7YHigWloN5SrcoV331g018+Rh+fJ0BhxxyyCGHHHJon5CVo4HBGhi69ZyZnabl3UOW59D9oShJGoE4ztkE1LeSeoKAIEnSJXS/5Tl0f2gqDsBObUJ9K8HU5D8ByB7kUctz6G5Qc31i6EYRzwZRs4mpSWJ61PIcejwUz2Zmbwm924sY3j7sH/0nh54SIuuDoiOCoE2oh6wtiGPIL5vr+iffk0PfAA1mZtYB8fwi+zmGrCPqMedU41HLc+jeOmJbym4/DJhNTLMxdJguL3j6PTl0C1SjxghcJ5ltQhrJL+unHjV2DVFucs45E7kAEVcraRPEkY22cIvYNVSlwtRg8dxAHDsD5gYIySDIhi4ki2NXg8eT78mhW6BN1KiOorqH7A8IgrZEEo8a+4cWiwjb7FNaJUQQUQlo5TriAFCxCNp6z/sqHNbKhJTtBdcRB4CoX/wEEFT6W20pWBWnQCiBxX3E7qGNjyixoh5ELT2viwaoW8SuoU32mcVEv974VTjUmOJRY/9QtQigphSlkVG1RemGr4UKt4hdQ5swUWtQ6SIPXUqYriOOAS1RYy1cKucVdXzqDxc/+Z4cugWqyhJKzlkq1rUKETe5aXKLOAC0rUdErY5iqVCp9DpqrcotYufQMjFTc42lXFklRK1iu444BrR0ul5ltAmjHWUAYurQcALB3IgppLsvz6G7QxsfUXKNMVxrzHxEuY44ArTNPtf4sYSJtQu67Yc++Z4cugXKUaMOUIYkplcxnAwxhVQ+mF5zwPD5iP1Dn2axL98B4aJM5T7iKFB9povBzBg6UD81WT3kc8vYzH+zJ4e+B8o3fjY7tR+mdytPgAKzT+cfAPr0lF/81SSiIGekUWDxbIh1Rv/J9+TQLdC1jtj0t7Jm2Ezs+3zEEaBtX4O1390uxjCylCK8HnEEyPyXyRxyyCGHHHLIob+EfgNlXfNVTsSrDQAAAABJRU5ErkJggg==\"")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
    }
    
    
    func testObtenerQRFallo() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        let nombrePlanta = "12"
       
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        imprimir.imprimirQR(planta_id:nombrePlanta){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida, "Planta no encontrada")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
    }
    
    func testAddAndDeleatePlanta() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        let new_plant = AddPlanta(
            especie: "Prueba",
            fertilizante: "Fertilizante prueba",
            iluminacion: "Iluminacion prueba",
            nombre_cientifico: "Planta nueva",
            nombre_tradicional: "Plantototototota",
            origen: "Peru",
            riego: "3 veces al dia",
            temporada: "Invierno",
            usos: ["1", "2"],
            desc: "hola"
            
        )
        
        
       
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        addPlanta.addPlant(planta: new_plant){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            self.idPPlanta = plantaRecibida!
            XCTAssertEqual(plantaRecibida!.nombre_cientifico, "Planta nueva")
            XCTAssertEqual(plantaRecibida!.nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.especie, "Prueba")
            XCTAssertEqual(plantaRecibida!.origen, "Peru")
            XCTAssertEqual(plantaRecibida!.temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.fertilizante, "Fertilizante prueba")
            XCTAssertEqual(plantaRecibida!.riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.iluminacion, "Iluminacion prueba")
            XCTAssertEqual(plantaRecibida!.usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.usos[1], "Alimento")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
        
        
        let conversionExpectation3 = expectation(description: "Conversion Terminada")
        eliminar.deletePlant(planta: idPPlanta!){
            (plantaRecibida) in
            conversionExpectation3.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida!,"Planta Desactivada")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
        
    }
    
    
    
    func testAddAndEditAndDeleatePlanta() throws {
        //Given
        let conversionExpectation = expectation(description: "Conversion Terminada")
        logIn.logIn(username: "equipo", password: "semillita1738") { (result) in
            conversionExpectation.fulfill()
            }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
        
    }
        
        let new_plant = AddPlanta(
            especie: "Prueba",
            fertilizante: "Fertilizante prueba",
            iluminacion: "Iluminacion prueba",
            nombre_cientifico: "Planta nueva",
            nombre_tradicional: "Plantototototota",
            origen: "Peru",
            riego: "3 veces al dia",
            temporada: "Invierno",
            usos: ["1", "2"],
            desc: "hola"
            
        )
        
        //When
        let conversionExpectation2 = expectation(description: "Conversion Terminada")
        addPlanta.addPlant(planta: new_plant){
            (plantaRecibida) in
            conversionExpectation2.fulfill()
            //Then
            self.plantaID = plantaRecibida!.id
            XCTAssertEqual(plantaRecibida!.nombre_cientifico, "Planta nueva")
            XCTAssertEqual(plantaRecibida!.nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.especie, "Prueba")
            XCTAssertEqual(plantaRecibida!.origen, "Peru")
            XCTAssertEqual(plantaRecibida!.temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.fertilizante, "Fertilizante prueba")
            XCTAssertEqual(plantaRecibida!.riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.iluminacion, "Iluminacion prueba")
            XCTAssertEqual(plantaRecibida!.usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.usos[1], "Alimento")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
        
        let new_planta = EditarPlanta(
            id: self.plantaID,
            especie: "Pruebaaa",
            fertilizante: "Fertilizante pruebaaa",
            iluminacion: "Iluminacion pruebaaa",
            nombre_cientifico: "Planta nueva",
            nombre_tradicional: "Plantototototota",
            origen: "Peruaa",
            riego: "3 veces al dia",
            temporada: "Invierno",
            usos: ["1", "2"],
            desc: "hola"
            
        )
       
        //When
        let conversionExpectation22 = expectation(description: "Conversion Terminada")
        editar.addPlant(planta: new_planta){
            (plantaRecibida) in
            conversionExpectation22.fulfill()
            //Then
            self.idPPlanta = plantaRecibida!
            XCTAssertEqual(plantaRecibida!.nombre_cientifico, "Planta nueva")
            XCTAssertEqual(plantaRecibida!.nombre_tradicional, "Plantototototota")
            XCTAssertEqual(plantaRecibida!.especie, "Pruebaaa")
            XCTAssertEqual(plantaRecibida!.origen, "Peruaa")
            XCTAssertEqual(plantaRecibida!.temporada, "Invierno")
            XCTAssertEqual(plantaRecibida!.descripcion, "hola")
            XCTAssertEqual(plantaRecibida!.fertilizante, "Fertilizante pruebaaa")
            XCTAssertEqual(plantaRecibida!.riego, "3 veces al dia")
            XCTAssertEqual(plantaRecibida!.iluminacion, "Iluminacion pruebaaa")
            XCTAssertEqual(plantaRecibida!.usos[0], "Medicinal")
            XCTAssertEqual(plantaRecibida!.usos[1], "Alimento")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
        
        
        let conversionExpectation3 = expectation(description: "Conversion Terminada")
        eliminar.deletePlant(planta: idPPlanta!){
            (plantaRecibida) in
            conversionExpectation3.fulfill()
            //Then
            XCTAssertEqual(plantaRecibida!,"Planta Desactivada")
            
        }
        
        waitForExpectations(timeout: 10) {
                    (error) in

                    if let error = error {
                        XCTFail("waitForExpectations errored: \(error)")
                    } else {
                        XCTAssert(true)
                    }
                }
        
    }
}
