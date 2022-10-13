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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
        //Given
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
    
    
    
    
}
/*
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
            XCTAssertEqual(plantaRecibida![1].id, 76)
            XCTAssertEqual(plantaRecibida![2].id, 75)
            
        }
    
    }
    
    func testAddPlanta() throws {
        //Given
        let new_plant = AddPlanta(especie: "Prueba", fertilizante: "Fertilizante prueba", iluminacion: "Iluminacion prueba", nombre_cientifico: "Planta mamastrosa", nombre_tradicional: "Plantototototota", origen: "Peru", riego: "3 veces al dia", temporada: "Invierno", usos: ["1", "2"], desc: "hola"
        )
        //When
        add.addPlant(planta: new_plant) {
            (plantaRecibida) in
            //Then
            XCTAssertEqual(plantaRecibida, "Planta Agregada")
            
        }

    }
    
    func testLoginValido() throws{
        //Given
        let username = "equipo"
        let password = "semillita1738"
        
        //When
        logIn.logIn(username: username, password: password){
            (plantaRecibida) in
            //Then
            XCTAssertEqual(plantaRecibida, "Usuario autenticado")
        }
    }
    
    func testLoginInvalido() throws{
        //Given
        let username = "notequipo"
        let password = "notsemillita1738"
        
        //When
        logIn.logIn(username: username, password: password){
            (plantaRecibida) in
            //Then
            XCTAssertEqual(plantaRecibida, "Usuario no autenticado")
        }
    }
    
    func testQR() throws{
        //Given
        let plantaID = 75
        
        //When
        imprimir.imprimirQR(planta_id: plantaID) {
            (plantaRecibida) in
            //Then
            XCTAssertEqual(plantaRecibida, "iVBORw0KGgoAAAANSUhEUgAAAZoAAAGaAQAAAAAefbjOAAAC/ElEQVR4nO2cTW7bMBBG31QCspSAHsBHoW7Qs+YG0lF8A2lpgMLXBX+spKvUqaVao0VgkH4wCY9n5pshY+LLz/Tj6ww45JBDDjnkkEOvCVl+2s2MDUsZ3rzaZXkOPR8KkqQ5D9rAahpppJFGQCNJ0kfoectz6PnQkh2AWb+axuVN0EVs6GJ6w9aD/Cd7cuhboHB9E3Q3g8VMurZoPM7yHHo6NPWrMVmL2UUyu9zsH32SQ4eESiToBCwA3YxBE4G1FcubLLzDtpJ18D059A3QZGZmPRCuLYQZbFjeZEOaX5PU2Gt5Dj3bR2wcwHSJKHkLVmPqMX30EIffk0OPQCRVGWYgi8xI1pxdRJqhyNIsQTUefE8OfRcUdMtJZdKcS4vZJWIDoJHVK1QngGpmGVtYfipnlotRc0zZ1DfRwtyX4HHwPTn0CJSjBp2kscuFS42pLlVrll0uV3rUeH1oYxFQv/0wA0ERaW5EUCQZjVvEy0PlZw+kVHJM3iKnlxohmUVKL4NbxKtDVWs0JS7MWWaksWQCNMlvuI94fSh/yUlf1jxCiunPNpy4+jwRZHaRpKuZ2SU3O5n6XIrQ2N0st0J3WZ5D++QRRWGQkomST9YxahA5+J4cegQqWiNlCk1Rn1BlRjkn43nEqaCgGheKU0juYar9ranfb3kO7VCP2AaHe7a5ne2i+4gTQNuoUVtbWX0WwZGtZPY84gxQqUeo+IicR9yP2m7rmO4jTgUlE5j6XLa2YWnLxLyaRsCG/Zbn0HOg6iO0rUFpbjaNr/SEMuc+4gRQlpuK6XQ+UG7wDEC2l8Vv8JwHut/p0kiTTmCnMlV6avwYd1meQ/tEjc9NrtrN2JapPGqcBbqHhNIDT/ojqJapOr/ldwao/TwQxrWF7mZi6dFkoOnXjMFa3nzwPTn0CPSHRUAjC+OKhfcmWhBYuBrifkb/4Hty6BHocx5RLoNTzkd8qFW5+nx9qFaxgXsD9H6qLp+li/UUjVvEi0Pm/5nMIYcccsghhxz6S+g3jFF0itkEv+YAAAAASUVORK5CYII=")
        }
    }
    
    func testQRFalso() throws{
        //Given
        let plantaID = 0
        
        //When
        imprimir.imprimirQR(planta_id: plantaID) {
            (plantaRecibida) in
            //Then
            XCTAssertEqual(plantaRecibida, "Planta no encontrada")
        }
    }
    
 }*/
