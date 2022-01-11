//
//  Tabs.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 03/01/2022.
//

import Foundation

/// Cards displayed on the SideBar.
enum Tabs: String {
    case allCards, minor, major
    case templates, yourSpreads
    
    // Label displayed on the SideBar Button content
    var label: String {
        switch self {
            // Cards
            case .allCards:    return LocalizedStrings.allCards
            case .major:       return LocalizedStrings.majorArcana
            case .minor:       return LocalizedStrings.minorArcana
            
            // Spreads
            case .templates:   return LocalizedStrings.spreadTemplates
            case .yourSpreads: return LocalizedStrings.yourSpreads
        }
    }
}
