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
        
        passwordTextField.tap()
        passwordTextField.typeText("semillita1738\n")
        
        app.buttons["Ingresar"].tap()
        
        //IMPORTANTE FER PON ATENCION, volvi a poner esta comprovacion para darle tiempo al closer a que cargue, sino el app no va a saber a que darle click
        let pruebaLabel = app.staticTexts.element(matching: .any, identifier: "Prueba").label
        var resultadosPrueba = false
        if (pruebaLabel == "Todas las Plantas"){
            resultadosPrueba = true
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
    
    
}
