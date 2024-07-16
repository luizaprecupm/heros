//
//  ElementWaitable.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Allows user to interact with waitable elements
protocol ElementWaitable: ApplicationAccessing {
    
    @discardableResult
    /// Waits for the existence of an XCUIElement
    /// - Parameters:
    ///   - element: XCUIElement to wait for
    ///   - timeout: waitTime
    ///    file: caller file to show in which file the error happens
    ///    line:line from where the function was called
    /// - Returns: self
    func iWaitForElement(_ element: XCUIElement, timeout: Double, file: StaticString,  line: UInt) -> Self
    
    @discardableResult
    /// Waits for the existtence of a button element, then taps
    /// - Parameters:
    ///   - element: XCUIElement to wait for
    ///   - timeout: waitTime
    ///   - file: caller file to show in which file the error happens
    ///   - line:line from where the function was called
    /// - Returns: self
    func iWaitAndTapButton(_ element: XCUIElement, timeout: Double, file: StaticString, line: UInt) -> Self
}

extension ElementWaitable {
    
    @discardableResult
    func iWaitForElement(_ element: XCUIElement, timeout: Double = .standardTimeout, file: StaticString = #file,  line: UInt = #line) -> Self {
        XCTAssertTrue(element.waitForExistence(timeout: timeout), "Could not find element: \(element.identifier)", file: file, line: line)
        return self
    }
    
    @discardableResult
    func iWaitAndTapButton(_ element: XCUIElement, timeout: Double = .standardTimeout, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(element.waitForExistence(timeout: timeout), "Cannot find button with identifier \(element.identifier) ", file: file, line: line)
        element.tap()
        return self
    }
}
