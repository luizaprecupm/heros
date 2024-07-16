//
//  Hero.swift
//  Marvel
//
//  Created by Precup Aurel Dan on 03/02/2022.
//

import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: ImageResourceAsset
    let comics: CountableProperty
    let events: CountableProperty
    let series: CountableProperty
    let stories: CountableProperty
}

extension Hero: Equatable {
    static func == (lhs: Hero, rhs: Hero) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description
    }
}
