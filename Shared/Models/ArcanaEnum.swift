//
//  ArcanaEnum.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 27/10/2021.
//

import Foundation

enum Arcana {
    case minor
    case major
    
    var name: String {
        switch self {
            case .minor: return LocalizedStrings.minorArcana
            case .major: return LocalizedStrings.majorArcana
        }
    }
}
