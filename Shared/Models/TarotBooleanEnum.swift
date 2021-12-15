//
//  TarotBooleanEnum.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 27/10/2021.
//

import Foundation

enum TarotBoolean {
    case yes
    case no
    case maybe
    
    var label: String {
        switch self {
            case .yes: return LocalizedStrings.yes
            case .no: return LocalizedStrings.no
            case .maybe: return LocalizedStrings.maybe
        }
    }
}
