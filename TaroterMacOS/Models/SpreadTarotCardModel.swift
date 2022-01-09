//
//  SpreadTarotCardModel.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 09/01/2022.
//

import Foundation

struct SpreadTarotCardModel: Hashable {
    let id: UUID
    var number: Int
    var location: CGPoint
    var meaning: String
    var rotationDegrees: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
