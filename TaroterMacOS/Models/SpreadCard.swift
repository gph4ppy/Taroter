//
//  SpreadCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 09/01/2022.
//

import Foundation

/// A Tarot Card model
struct SpreadCard: Hashable {
    let id:               UUID
    let name:             String
    let imageName:        String
    var number:           Int
    var location:         CGPoint
    var meaning:          String
    var rotationDegrees:  Double
    var uprightKeywords:  String
    var reversedKeywords: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
