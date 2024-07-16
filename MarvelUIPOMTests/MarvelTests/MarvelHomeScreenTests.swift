//
//  MarvelUIPOMTests.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import XCTest

final class MarvelHomeScreenTests: UITest {
    
    func testShowingHeroesList() {
        launch(with: [.heroes])
        let homeScreen = HomeScreen()
        HomeScreenActions()
            .iCheckNavigationTitle()
            .iCheckHeroName(heroName: homeScreen.firstHero)
            .iSeeImage(homeScreen.image)
            .scrollDown()
            .iCheckHeroName(heroName: homeScreen.secondHero)
    }
    
    func testTapOnSearchOpensTheSearchView() {
        launch(with: [])
        HomeScreenActions()
            .iTapSearchButton()
            .iWaitAndSeeTextField(field: SearchScreen().searchField)
    }
    
    func testNoHeroesShowsEmptyMessage() {
        launch(with: [])
        let homeScreen = HomeScreen()
        HomeScreenActions()
            .iCheckNavigationTitle()
            .iWaitForElement(homeScreen.noResultsString)
    }
}
