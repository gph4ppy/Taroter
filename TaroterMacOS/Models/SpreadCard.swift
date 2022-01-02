//
//  SpreadCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 29/12/2021.
//

import Foundation

struct SpreadCard: Hashable {
    let id: UUID
    let number: Int
    var location: CGPoint
    var meaning: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
