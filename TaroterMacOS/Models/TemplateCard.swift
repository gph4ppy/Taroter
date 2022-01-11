//
//  TemplateCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 29/12/2021.
//

import Foundation

/// An empty card model
struct TemplateCard: Hashable {
    let id:              UUID
    var number:          Int
    var location:        CGPoint
    var meaning:         String
    var rotationDegrees: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
