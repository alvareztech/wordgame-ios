//
//  WordGameUITests.swift
//  WordGameUITests
//
//  Created by Daniel Alvarez on 13/11/22.
//

import XCTest
//@testable import WordGame

final class WordGameUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testBaseState() throws {
        let app = XCUIApplication()
        app.launch()

        let correctLabel = app.staticTexts["Correct attempts: 0"]
        let wrongLabel = app.staticTexts["Wrong attempts: 0"]
        let correctButton = app.buttons["Correct"]
        let wrongButton = app.buttons["Wrong"]
        XCTAssert(correctLabel.exists)
        XCTAssert(wrongLabel.exists)
        XCTAssert(correctButton.exists)
        XCTAssert(wrongButton.exists)
    }
    
    func testTimer() throws {
        let app = XCUIApplication()
        app.launch()
        
        let wrongLabel = app.staticTexts["Wrong attempts: 0"]
        let wrong1Label = app.staticTexts["Wrong attempts: 1"]
        XCTAssert(wrongLabel.exists)
        XCTAssert(wrong1Label.waitForExistence(timeout: 5))
    }

    func testCorrectButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstWord = app.staticTexts["firstWord"]
        let secondWord = app.staticTexts["secondWord"]
        XCTAssert(firstWord.exists)
        XCTAssert(secondWord.exists)
        
        let firstValue = firstWord.label
        let secondValue = secondWord.label
        XCTAssertEqual(firstWord.label, firstValue)
        XCTAssertEqual(secondWord.label, secondValue)
        
        let correctButton = app.buttons["Correct"]
        correctButton.tap()
        XCTAssertNotEqual(firstWord.label, firstValue)
        XCTAssertNotEqual(secondWord.label, secondValue)
    }
    
    func testWrongButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstWord = app.staticTexts["firstWord"]
        let secondWord = app.staticTexts["secondWord"]
        XCTAssert(firstWord.exists)
        XCTAssert(secondWord.exists)
        
        let firstValue = firstWord.label
        let secondValue = secondWord.label
        XCTAssertEqual(firstWord.label, firstValue)
        XCTAssertEqual(secondWord.label, secondValue)
        
        let wrongButton = app.buttons["Wrong"]
        wrongButton.tap()
        XCTAssertNotEqual(firstWord.label, firstValue)
        XCTAssertNotEqual(secondWord.label, secondValue)
    }
}
