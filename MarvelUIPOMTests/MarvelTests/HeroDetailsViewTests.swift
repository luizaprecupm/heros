//
//  HeroDetailsViewTests.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

final class HeroDetailsViewTests: UITest {
    
    func testTapingOnACardShowsTheHeroDetails() {
        launch(with: [.heroes])
        let homeScreen = HomeScreen()
        HomeScreenActions()
            .iCheckNavigationTitle()
            .iCheckHeroName(heroName: homeScreen.firstHero)
            .iTapHeroName(heroName: homeScreen.firstHero)
        HeroDetailsActions()
            .iCheckElementsOnScreen()
    }
}
