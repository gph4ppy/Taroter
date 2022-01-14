//
//  SpreadPreview.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 14/01/2022.
//

import SwiftUI

struct SpreadPreview: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var showingSpread: Bool
    let tarotSpreadCards: NSSet
    
    var body: some View {
        let cards = tarotSpreadCards.toArray(TarotSpreadCards.self)
        let sortedCards = cards.sorted { $0.number < $1.number }
        
        ZStack {
            // Background with a close button
            background.overlay(alignment: .topTrailing) {
                CloseButton { self.showingSpread = false }
            }
            
            // Saved Cards
            ForEach(sortedCards, id: \.self) { card in
                let cardLocation = CGPoint(x: card.xPosition,
                                           y: card.yPosition)
                
                let card = SpreadCard(id: card.id ?? UUID(),
                                      name: card.name ?? "",
                                      imageName: card.imageName ?? "",
                                      number: Int(card.number),
                                      location: cardLocation,
                                      meaning: card.meaning ?? LocalizedStrings.noMeaning,
                                      rotationDegrees: card.rotationDegrees)
                
                // Card Shape
                SpreadTarotCard(cardPosition: cardLocation,
                                rotationDegrees: card.rotationDegrees,
                                cards: .constant([]),
                                selectedCard: .constant(nil),
                                card: card,
                                isHoverable: false)
            }
            
            // Meanings List
            ExpandableView { createMeaningsList(cards: cards) }
        }
        .transition(.move(edge: .bottom))
        .zIndex(1)
    }
}

// MARK: - Views
private extension SpreadPreview {
    var background: some View {
        // I couldn't find the color that matched the background (in dark mode),
        // NSColor.underPageBackgroundColor didn't work either,
        // so I used an empty list.
        // Modern problems require modern solutions. ¯\_(ツ)_/¯
        colorScheme == .dark ? AnyView(List{}) : AnyView(Color(.windowBackgroundColor))
    }
    
    @ViewBuilder func createMeaningsList(cards: [TarotSpreadCards]) -> some View {
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
