//
//  SpreadTemplatePreview.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SpreadTemplatePreview: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var showingSpread: Bool
    let spreadCards: NSSet
    
    var body: some View {
        let cards = spreadCards.toArray(SpreadCards.self)
        
        ZStack {
            background
                .overlay(alignment: .topTrailing) {
                    CloseButton { self.showingSpread = false }
                }
            
            ForEach(cards, id: \.self) { card in
                let card = SpreadCard(id: card.id ?? UUID(),
                                      number: Int(card.number),
                                      location: CGPoint(x: card.xPosition, y: card.yPosition),
                                      meaning: card.meaning ?? "",
                                      rotationDegrees: card.rotationDegrees)
                
                // Card Shape
                EmptyTarotCard(card: card,
                               cards: .constant([SpreadCard]()),
                               isEditable: false)
            }
        }
        .transition(.move(edge: .bottom))
        .zIndex(1)
    }
    
    var background: some View {
        // I couldn't find the color that matched the background (in dark mode),
        // NSColor.underPageBackgroundColor didn't work either,
        // so I used an empty list.
        // Modern problems require modern solutions. ¯\_(ツ)_/¯
        colorScheme == .dark ? AnyView(List{}) : AnyView(Color(.windowBackgroundColor))
    }
}
