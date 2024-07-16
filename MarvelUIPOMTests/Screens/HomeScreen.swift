//
//  HomeScreen.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Home screen data representation
class HomeScreen: ApplicationAccessing, ElementRequired {
    
    lazy var searchButton = app.navigationBars.buttons["trailingSearchButton"]
    lazy var navigationTitle = app.navigationBars["Marvel Heros"]
    lazy var firstHero = app.staticTexts["Iron Man"]
    lazy var secondHero = app.staticTexts["Captain America"]
    lazy var image = app.images["heroImage"]
    lazy var noResultsString = app.staticTexts["Nothing to see here"]
    
    /// Required elements needed for``ElementRequired``
    lazy var requiredElements = [searchButton, navigationTitle, firstHero, secondHero, image]
}

/// Home screen actions representation
class HomeScreenActions: ElementWaitable, Scrollable, TextFieldActionable {
    
    /// The screen data model
    private let screen: HomeScreen
    
    /// Create a new instance of the home screen actions
    /// - Parameter screen: The data model
    init(screen: HomeScreen = HomeScreen()) {
        self.screen = screen
    }
    
    @discardableResult
    func iCheckElementsOnScreen() -> Self {
        screen.verifyAllElementsPresent()
        return self
    }
    
    @discardableResult
    func iCheckHeroName(heroName: XCUIElement) -> Self {
        iWaitForElement(heroName)
        return self
    }
    
    @discardableResult
    func iTapHeroName(heroName: XCUIElement) -> Self {
        heroName.tap()
        return self
    }
    
    @discardableResult
    func iTapSearchButton() -> Self {
        iWaitAndTapButton(screen.searchButton)
        return self
    }
    
    @discardableResult
    func iCheckNavigationTitle() -> Self {
        iWaitForElement(screen.navigationTitle)
        return self
    }
    
    @discardableResult
    func iSeeImage(_ image: XCUIElement, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(image.exists, file: file, line: line)
        return self
    }
    
}
