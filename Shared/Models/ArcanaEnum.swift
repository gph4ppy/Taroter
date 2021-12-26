//
//  ArcanaEnum.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 27/10/2021.
//

import Foundation

enum Arcana {
    case allCards
    case minor
    case major
    
    var name: String {
        switch self {
            case .allCards: return LocalizedStrings.allCards
            case .major: return LocalizedStrings.majorArcana
            case .minor: return LocalizedStrings.minorArcana
        }
    }
}
