//
//  UITest.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//


import Foundation
import XCTest

class UITest: XCTestCase {
    
    private(set)lazy var app = XCUIApplication()
    
    /// Mock flags invoke HeroServiceMock so it sets up the data source as needed based on each test
    /// - Parameter arguments: Mock flags
    func launch(with arguments: [HeroMockFlag]) {
        app.launchArguments = ["testMode"] + arguments.map({$0.rawValue})
        app.launch()
    }
    
    override func tearDown() {
        addDebugDescriptionAttachment(app)
        addScreenshot(app)
    }
}
