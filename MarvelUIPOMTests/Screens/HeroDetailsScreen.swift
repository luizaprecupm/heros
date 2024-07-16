//
//  HeroDetailsScreen.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest


/// Hero Details screen data representation
class HeroDetailsScreen: ApplicationAccessing, ElementRequired {
    
    lazy var statsTile = app.staticTexts["Stats"]
    lazy var eventsLabel = app.staticTexts["eventsValue"]
    lazy var storiesLabel = app.staticTexts["storiesValue"]
    lazy var comicsValue = app.staticTexts["comicsValue"]
    lazy var aboutTitle = app.staticTexts["About"]
    lazy var textDescription = app.staticTexts["largeTextLabel"]
    lazy var closeButton = app.buttons["closeButton"]
    
    /// Required elements needed for``ElementRequired``
    lazy var requiredElements =  [statsTile, eventsLabel, storiesLabel, comicsValue, aboutTitle, textDescription]
}

class HeroDetailsActions {
    
    /// The screen data model
    private let screen: HeroDetailsScreen
    
    /// Create a new instance of the details screen actions
    /// - Parameter screen: The data model
    init(screen: HeroDetailsScreen = HeroDetailsScreen()) {
        self.screen = screen
    }
    
    @discardableResult
    func iCheckElementsOnScreen() -> Self {
        screen.verifyAllElementsPresent()
        return self
    }
}
