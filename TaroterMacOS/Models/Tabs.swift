//
//  Tabs.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 03/01/2022.
//

import Foundation

enum Tabs: String {
    case allCards, minor, major
    case templates, yourSpreads
    
    var label: String {
        switch self {
            // Cards
            case .allCards: return LocalizedStrings.allCards
            case .major: return LocalizedStrings.majorArcana
            case .minor: return LocalizedStrings.minorArcana
            
            // Spreads
            case .templates: return LocalizedStrings.spreadTemplates
            case .yourSpreads: return LocalizedStrings.yourSpreads
        }
    }
}
