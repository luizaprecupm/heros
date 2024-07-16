//
//  TextFieldSActionable.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest


protocol TextFieldActionable: ApplicationAccessing {
    
    @discardableResult
    /// Check existance of the TextField
    /// - Parameters:
    ///   - field: which textField to type the text in
    ///   - file: caller file to show in which file the error happens
    ///   - line:line from where the function was called
    /// - Returns: self
    func iWaitAndSeeTextField(field: XCUIElement, file: StaticString, line: UInt) -> Self
    
    @discardableResult
    /// Types a text in a specific TextField
    /// - Parameters:
    ///   - text: String to be typed
    ///   - textField: which textField to type the text in
    ///   - shouldClear: defines if needed to clear a previous text, set to true by default
    ///   - file: caller file to show in which file the error happens
    ///   - line:line from where the function was called
    /// - Returns: self
    func iType(_ text: String, _ textField: XCUIElement, shouldClear: Bool, file: StaticString, line: UInt) -> Self
}

extension TextFieldActionable {
    
    @discardableResult
    func iWaitAndSeeTextField(field: XCUIElement, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(field.waitForExistence(timeout: .standardTimeout), "Cannot find Text Field with identifier: \(field)", file: file, line: line)
        return self
    }
    
    @discardableResult
    func iType(_ text: String, _ textField: XCUIElement, shouldClear: Bool = true, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(textField.exists, file: file, line: line)
        textField.tap()
        if shouldClear {
            textField.clearAndEnterText(text: text)
        } else {
            textField.typeText(text)
        }
        return self
    }
}
