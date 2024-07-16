//
//  Scrollable.swift
//  MarvelUIPOMTests
//
//  Created by Luiza on 2024-07-13.
//

import Foundation
import XCTest

/// Provides a scrollable interface for a given screen
protocol Scrollable: ApplicationAccessing {
    
    /// Scroll up on the scrollable element
    /// - Returns: Self
    func scrollUp() -> Self
    
    /// Scroll down on the scrollable element
    /// - Returns: Self
    func scrollDown() -> Self
}

extension Scrollable {
    @discardableResult
    func scrollUp() -> Self {
        app.swipeDown()
        return self
    }
    
    @discardableResult
    func scrollDown() -> Self {
        app.swipeUp()
        return self
    }
}
