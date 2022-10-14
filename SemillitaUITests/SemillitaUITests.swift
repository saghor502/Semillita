//
//  SemillitaUITests.swift
//  SemillitaUITests
//
//  Created by Ángel Saghir Rodríguez Fernández on 06/09/22.
//

import XCTest

class SemillitaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //Checa elementos del ui para ver si el app hizo lo que queriamos, en este caso checa si el texto del label con ID "Prueba" es igual a "Todas las Plantas". IMPORTANTE para ver el texto de un label se hace diferente al textfield, el textfield es facil u se hace como los ejemplos de arriba, label se usa la linea de abajo la cual te guarda un string del label.
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
        
        
    }
    
    
    func testPlantaRomero() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        do{
        sleep(1)
        }
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprovacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        do {
            sleep(4)
        }
        
        
        let firstChild = app.collectionViews.children(matching:.any).element(boundBy: 0)
        if firstChild.exists {
             firstChild.tap()
        }
        
        let pruebaLabel2 = app.staticTexts.element(matching: .any, identifier: "nombre_tradicional").label
        resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
        
        
    }
    
    func testPlantaQR() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprobacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
        app.buttons["SacarQR"].tap()
        
        let buscarQRTextField = app.textFields["BuscarQR"]
        
        
        buscarQRTextField.tap()
        buscarQRTextField.typeText("Romero\n")
        
        app.buttons["ImprimirQR"].tap()
        
        let prueba2Label = app.staticTexts.element(matching: .any, identifier: "Prueba2").label
        var resultados2Prueba = false
        if (prueba2Label == "Mandar QR a correo"){
            resultadosPrueba = true
        }
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
    }
    
    func testAgregarPlanta() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprobacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
        app.buttons["BotonAgregarP"].tap()
        
        let nombreComunTextField = app.textFields["NComun"]
        let nombrecientificoTextField = app.textFields["NCientifico"]
        let origenPlantaTextField = app.textFields["OPlanta"]
        let especiePlantaTextField = app.textFields["EPlanta"]
        let temporadaPlantaTextField = app.textFields["TPlanta"]
        let riegoplantaTextField = app.textFields["RPlanta"]
        let fertilizantePlantaTextField = app.textFields["FPlanta"]
        let iluminacionPlantaTextField = app.textFields["IPlanta"]
        let descrpicionPlantaTextView = app.textViews ["DescPlanta"]
        let usosLabel = app.staticTexts.element(matching: .any, identifier: "usosLabel").label
        
        nombreComunTextField.tap()
        nombreComunTextField.typeText("Ciruelo\n")
        
        nombrecientificoTextField.tap()
        nombrecientificoTextField.typeText("Ciruelus Maximus\n")
        
        origenPlantaTextField.tap()
        origenPlantaTextField.typeText("Dubai\n")
        
        especiePlantaTextField.tap()
        especiePlantaTextField.typeText("Arbol\n")
        
        temporadaPlantaTextField.tap()
        temporadaPlantaTextField.typeText("Primavera\n")
        
        riegoplantaTextField.tap()
        riegoplantaTextField.typeText("Mucha agua\n")
        
        fertilizantePlantaTextField.tap()
        fertilizantePlantaTextField.typeText("De vaca Europea\n")
        
        iluminacionPlantaTextField.tap()
        iluminacionPlantaTextField.typeText("Mucho sol\n")
        
        //let loadedPredicate = NSPredicate(format: "value != %@", "Usos")
        //let loadExpectation = XCTNSPredicateExpectation(predicate: loadedPredicate, object: usosLabel)
        
        
        //wait(for: [loadExpectation], timeout: 10.0)
        let segments = app.segmentedControls["slider"]
        print(segments)
        
        descrpicionPlantaTextView.tap()
        descrpicionPlantaTextView.typeText("esta planta da muy buenos ciruelos, recomendada")
        
        iluminacionPlantaTextField.tap()
        iluminacionPlantaTextField.typeText("\n")
        
        
        
        app.buttons["AgregarPlanta"].tap()
        
        /*let prueba2Label = app.staticTexts.element(matching: .any, identifier: "Prueba2").label
        var resultados2Prueba = false
        if (prueba2Label == "Mandar QR a correo"){
            resultadosPrueba = true
        }*/
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
    }
    
    func testEditarPlanta() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprovacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        do {
            sleep(4)
        }
        
        
        let firstChild = app.collectionViews.children(matching:.any).element(boundBy: 1)
        if firstChild.exists {
             firstChild.tap()
        }
        
        let pruebaLabel2 = app.staticTexts.element(matching: .any, identifier: "nombre_tradicional").label
        resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
        app.buttons["BotonEditarPlanta"].tap()
        
        let riegoPlantaTextField = app.textFields["RiegoPlanta"]
        
        riegoPlantaTextField.tap()
        riegoPlantaTextField.typeText("Muchisima agua\n")
        
        app.buttons["ConfirmarEdicion"].tap()
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
        
        
    }
    
    func testVisitarAnaliticos() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprobacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
        app.buttons["BotonAnaliticos"].tap()
        
    
        
        let prueba3Label = app.staticTexts.element(matching: .any, identifier: "Prueba3").label
        var resultados3Prueba = false
        if (prueba3Label == "Las Plantas mas Populares"){
            resultadosPrueba = true
        }
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
    }
    
    func testBorrarPlanta() throws {
        //Inicia el app
        let app = XCUIApplication()
        app.launch()
        
        //Decimos que objetos vamos a usar, a xcode le vale en cual screen esta el objeto solo busca los objetos cuando los va a usar, recuerda que se busca por ID
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.secureTextFields["Password"]
        
        
        //Haces todas las acciones que quieres para llegar al punto final, en este caso le da click al text field username e ingresa equipo\n, \n es para que cierre el keyboard, despues le da click al de password hace lo mismo y finalmente le da click al boton.
        usernameTextField.tap()
        usernameTextField.typeText("equipo\n")
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprovacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        do {
            sleep(4)
        }
        
        
        let firstChild = app.collectionViews.children(matching:.any).element(boundBy: 9)
        if firstChild.exists {
            firstChild.swipeLeft()
            firstChild.tap()
        }
        
        let pruebaLabel2 = app.staticTexts.element(matching: .any, identifier: "nombre_tradicional").label
        resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
        }
        
        
       //app.buttons["BorrarPlantas"].tap() SOLO CON CIRUELO ( UI TEST DE AGREGAR PLANTA)
        
        let pruebaLabel3 = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba3 = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba3 = true
        }
    
        
        //Si el resultadosPrueba sale true la prueba es un exito, si sale false fallo
        XCTAssert(resultadosPrueba)
        
        
    }
}
