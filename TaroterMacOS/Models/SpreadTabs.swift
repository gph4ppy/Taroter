//
//  SpreadTabs.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import Foundation

/// Tabs displayed as the Segmented Picker Buttons
enum SpreadTabs: String {
    case savedTemplates, newTemplate
    case savedSpreads, newSpread
    
    // Label displayed in the Segmented Picker Button content
    var label: String {
        switch self {
            case .savedTemplates: return LocalizedStrings.savedTemplates
            case .newTemplate:    return LocalizedStrings.newTemplate
            case .savedSpreads:   return LocalizedStrings.savedSpreads
            case .newSpread:      return LocalizedStrings.newSpread
        }
    }
}
