//
//  SpreadTemplatePreview.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

/// A view showing the saved spread template.
struct SpreadTemplatePreview: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var showingSpread: Bool
    let spreadCards: NSSet
    
    var body: some View {
        let cards = spreadCards.toArray(SpreadCards.self)
        
        ZStack {
            // Background with a close button
            background.overlay(alignment: .topTrailing) {
                CloseButton { self.showingSpread = false }
            }
            
            // Saved Cards
            ForEach(cards, id: \.self) { card in
                let cardLocation = CGPoint(x: card.xPosition,
                                           y: card.yPosition)
                
                let card = SpreadCard(id: card.id ?? UUID(),
                                      number: Int(card.number),
                                      location: cardLocation,
                                      meaning: card.meaning ?? LocalizedStrings.noMeaning,
                                      rotationDegrees: card.rotationDegrees)
                
                // Card Shape
                EmptyTarotCard(card: card,
                               cards: .constant([SpreadCard]()),
                               isEditable: false)
            }
            
            // Meanings List
            ExpandableView { createMeaningsList(cards: cards) }
        }
        .transition(.move(edge: .bottom))
        .zIndex(1)
    }
}

// MARK: - Views
private extension SpreadTemplatePreview {
    var background: some View {
        // I couldn't find the color that matched the background (in dark mode),
        // NSColor.underPageBackgroundColor didn't work either,
        // so I used an empty list.
        // Modern problems require modern solutions. ¯\_(ツ)_/¯
        colorScheme == .dark ? AnyView(List{}) : AnyView(Color(.windowBackgroundColor))
    }
    
    @ViewBuilder func createMeaningsList(cards: [SpreadCards]) -> some View {
        let sortedCards = cards.sorted { $0.number < $1.number }
        
        ScrollView {
            LazyVStack(spacing: 6) {
                Text(LocalizedStrings.meanings)
                    .bold()
                
                ForEach(sortedCards, id: \.self) { card in
                    if let cardMeaning = card.meaning {
                        let isMeaningEmpty = cardMeaning.isEmpty
                        let meaning = isMeaningEmpty ? LocalizedStrings.noMeaning : cardMeaning
                        
                        Text("\(card.number + 1). \(meaning)")
                    }
                }
            }
        }
        .padding()
        .foregroundColor(Color(.windowBackgroundColor))
    }
}
