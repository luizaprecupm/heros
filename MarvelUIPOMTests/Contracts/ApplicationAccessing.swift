//
//  ApplicationAccessing.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Allows the consumer to access the application in Test
protocol ApplicationAccessing {
    var app: XCUIApplication { get }
}

extension ApplicationAccessing {
    /// Returns an instance of the XCUIApplication
    /// - Returns: XCUIApplication
    var app: XCUIApplication { XCUIApplication() }
}

