//
//  SpreadTabs.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import Foundation

enum SpreadTabs: String {
    case savedTemplates, newTemplate
    case savedSpreads, newSpread
    
    var label: String {
        switch self {
            case .savedTemplates: return "Saved templates"
            case .newTemplate: return "New template"
            case .savedSpreads: return ""
            case .newSpread: return ""
        }
    }
}
