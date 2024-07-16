//
//  SearchScreen.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Search screen data representation
class SearchScreen: ApplicationAccessing, ElementRequired {
    
    lazy var searchField = app.textFields["searchTextField"]
    lazy var closeSearch = app.buttons["closeButton"]
    lazy var noSearchResults = app.staticTexts["No results yet"]
    lazy var firstHeroResult = app.staticTexts["Iron Man"]
    lazy var secondHeroResult = app.staticTexts["Captain America"]
    
    /// Required elements needed for``ElementRequired``
    lazy var requiredElements = [searchField, closeSearch, noSearchResults, firstHeroResult, secondHeroResult]
}
/// Search  screen actions representation
class SearchScreenActions: ElementWaitable, TextFieldActionable {
    
    /// The screen data model
    private let screen: SearchScreen
    
    /// Create a new instance of the search screen actions
    /// - Parameter screen: The data model
    init(screen: SearchScreen = SearchScreen()) {
        self.screen = screen
    }
    
    @discardableResult
    func iCheckElementsOnScreen() -> Self {
        screen.verifyAllElementsPresent()
        return self
    }
    
    @discardableResult
    func iCheckSearchResult(result: XCUIElement) -> Self {
        iWaitForElement(result)
        return self
    }
    
    @discardableResult
    func iTapOnSearchResult(_ result: XCUIElement, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(result.exists, file: file, line: line)
        result.firstMatch.tap()
        return self
    }
    
    @discardableResult
    func iCloseSearch() -> Self {
        iWaitAndTapButton(screen.closeSearch)
        return self
    }
    
    @discardableResult
    func iCheckNoResultFound() -> Self {
        iWaitForElement(screen.noSearchResults)
        return self
    }    
}
