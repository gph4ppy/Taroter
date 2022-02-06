//
//  SpreadPreview.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 14/01/2022.
//

import SwiftUI

/// A view showing the saved spread.
struct SpreadPreview: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding var showingSpread: Bool
    let tarotSpreadCards: NSSet
    
    var body: some View {
        let cards = tarotSpreadCards.toArray(TarotSpreadCards.self)
        let sortedCards = cards.sorted { $0.number < $1.number }
        
        ZStack {
            // Background with a close button
            Background().overlay(alignment: .topTrailing) {
                CloseButton { self.showingSpread = false }
            }
            
            // Saved Cards
            ForEach(sortedCards, id: \.self) { card in
                let spreadCard = prepareCard(card: card)
                SpreadTarotCard(card: spreadCard,
                                isHoverable: false,
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

// MARK: - Methods
private extension SpreadPreview {
    /// This method prepares the card to be shown in the view.
    /// It converts `TarotSpreadCards` to `SpreadCard`.
    /// - Parameter card: TarotSpreadCards object which contains all card data.
    /// - Returns: SpreadCard object which contains card data and
    ///            will be displayed as `SpreadTarotCard` [View].
    func prepareCard(card: TarotSpreadCards) -> SpreadCard {
        // Prepare Card Position
        let cardLocation = CGPoint(x: card.xPosition,
                                   y: card.yPosition)
        
        // Return Spread Card
        return SpreadCard(id: card.id ?? UUID(),
                          name: card.name ?? "",
                          imageName: card.imageName ?? "",
                          number: Int(card.number),
                          location: cardLocation,
                          meaning: card.meaning ?? LocalizedStrings.noMeaning,
                          rotationDegrees: card.rotationDegrees,
                          uprightKeywords: card.uprightKeywords ?? "",
                          reversedKeywords: card.reversedKeywords ?? "")
    }
}

// MARK: - Views
private extension SpreadPreview {
    /// This method creates the SpreadCards meanings list.
    /// - Parameter cards: TarotSpreadCards containing their meanings
    /// - Returns: A ScrollView of cards meanings.
    @ViewBuilder func createMeaningsList(cards: [TarotSpreadCards]) -> some View {
        let sortedCards = cards.sorted { $0.number < $1.number }
        
        ScrollView {
            LazyVStack(spacing: 6) {
                // "Meanings" Label
                Text(LocalizedStrings.meanings)
                    .font(.title3)
                    .bold()
                
                // Cards
                ForEach(sortedCards, id: \.self) { card in
                    VStack {
                        // Title
                        Text("\(card.number + 1). \(card.name ?? "")")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        // Meaning
                        if let meaning = card.meaning, !meaning.isEmpty {
                            DisclosureGroup(LocalizedStrings.meaningTitle) {
                                Text(meaning)
                            }
                            .font(.footnote)
                        }
                        
                        // Keywords
                        DisclosureGroup(LocalizedStrings.keywords) {
                            HStack {
                                // Upright Keywords
                                ListBuilder.createColumn(title: LocalizedStrings.uprightKeywords,
                                                         data: card.uprightKeywords ?? "")
                                
                                // Reversed Keywords
                                ListBuilder.createColumn(title: LocalizedStrings.reversedKeywords,
                                                         data: card.reversedKeywords ?? "")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .font(.footnote)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .padding()
        .foregroundColor(Color(.windowBackgroundColor))
    }
}
