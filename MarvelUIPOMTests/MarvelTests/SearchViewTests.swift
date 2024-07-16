//
//  SearchViewTests.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

final class SearchViewTests: UITest {
    
    func testSearchWithNoResultsShowNoResultsMessage() {
        launch(with: [.noHeros])
        let homeScreen = HomeScreen()
        let searchScreen = SearchScreen()
        HomeScreenActions()
            .iWaitForElement(homeScreen.noResultsString)
            .iWaitAndTapButton(homeScreen.searchButton)
            .iWaitAndSeeTextField(field: searchScreen.searchField)
            .iType("Iron", searchScreen.searchField)
            .iWaitForElement(searchScreen.noSearchResults)
    }
    
    func testCloseButtonDimissesView() {
        launch(with: [.noHeros])
        let homeScreen = HomeScreen()
        let searchScreen = SearchScreen()
        HomeScreenActions()
            .iWaitAndTapButton(homeScreen.searchButton)
            .iWaitAndTapButton(searchScreen.closeSearch)
            .iWaitForElement(homeScreen.navigationTitle)
    }
    
    func testSelectingASearchResultNavigatatesToTheHeroDetailsView() {
        launch(with: [.heroes])
        let homeScreen = HomeScreen()
        let searchScreen = SearchScreen()
        HomeScreenActions()
            .iCheckElementsOnScreen()
            .iWaitAndTapButton(homeScreen.searchButton)
            .iWaitAndSeeTextField(field: searchScreen.searchField)
            .iType("Iron", searchScreen.searchField)
            .iWaitForElement(searchScreen.firstHeroResult)
            .iTapHeroName(heroName: searchScreen.firstHeroResult.firstMatch)
        HeroDetailsActions()
            .iCheckElementsOnScreen()
    }
}
