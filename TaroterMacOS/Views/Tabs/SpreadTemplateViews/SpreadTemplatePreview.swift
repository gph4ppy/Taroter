//
//  SpreadTemplatePreview.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

/// A view showing the saved spread template.
struct SpreadTemplatePreview: View {
    @Binding var showingSpread: Bool
    let spreadCards: NSSet
    
    var body: some View {
        let cards = spreadCards.toArray(SpreadCards.self)
        let sortedCards = cards.sorted { $0.number < $1.number }
        
        ZStack {
            // Background with a close button
            Background().overlay(alignment: .topTrailing) {
                CloseButton { self.showingSpread = false }
            }
            
            // Saved Cards
            ForEach(sortedCards, id: \.self) { card in
                let cardLocation = CGPoint(x: card.xPosition,
                                           y: card.yPosition)
                
                let card = TemplateCard(id: card.id ?? UUID(),
                                        number: Int(card.number),
                                        location: cardLocation,
                                        meaning: card.meaning ?? LocalizedStrings.noMeaning,
                                        rotationDegrees: card.rotationDegrees)
                
                // Card Shape
                TemplateCardView(card: card,
                                 isEditable: false,
                                 showingTextFieldAlert: .constant(false),
                                 alertViewModel: nil,
                                 cardViewModel: nil)
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
    /// This method creates the SpreadCards meanings list.
    /// - Parameter cards: SpreadCards containing their meanings
    /// - Returns: A ScrollView of cards meanings.
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
