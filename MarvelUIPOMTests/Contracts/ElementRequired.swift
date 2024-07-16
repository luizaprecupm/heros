//
//  ElementRequired.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Provides a list of required elemnents and way to verify their existence of the screen
protocol ElementRequired: ElementWaitable, AnyObject {
    
    /// The required elements
    var requiredElements: [XCUIElement] { get }
    
    /// Function checks that given array of elements is displayed on the screen
    /// - Parameters:
    ///   - file: caller file to show in which file the error happens
    ///   - line: line from where the function was called
    func verifyAllElementsPresent(_ file: StaticString, line: UInt)
}

extension ElementRequired {
    
    func verifyAllElementsPresent(_ file: StaticString = #file, line: UInt = #line) {
        requiredElements.forEach({[weak self] in
            guard let self else { return }
            iWaitForElement($0, timeout: .standardTimeout, file: file, line: line)})
    }
}
