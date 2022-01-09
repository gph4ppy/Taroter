//
//  NewSpreadView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadView: View {
    @State private var displayedCards: [TarotCards] = []
    @State private var selectedCard: TarotCards?
    
    var body: some View {
        ZStack {
            GeometryReader { geom in
                // Template Management Buttons
                createTemplateManagementButtons(windowSize: geom.size)
                
                // Cards View
                ForEach(displayedCards, id: \.self) { card in
                    SpreadTarotCard(cardPosition: CGPoint(x: geom.size.width / 2,
                                                          y: geom.size.height / 2),
                                    rotationDegrees: 0.0,
                                    cards: $displayedCards,
                                    selectedCard: $selectedCard,
                                    card: card,
                                    isHoverable: false)
                        .shadow(radius: 3)
                        .transition(.scale(scale: 0.5, anchor: .center))
                }
            }
            
            ExpandableView {
                ScrollView {
                    LazyVStack {
                        ForEach(TarotCards.allCases, id: \.self) { card in
                            Button(action: { addCard(card: card) }) {
                                SpreadTarotCard(cardPosition: CGPoint(x: 125, y: 125),
                                                rotationDegrees: 0.0,
                                                cards: $displayedCards,
                                                selectedCard: $selectedCard,
                                                card: card,
                                                isHoverable: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Methods
private extension NewSpreadView {
    func addCard(card: TarotCards) {
        if !displayedCards.contains(card) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                self.displayedCards.append(card)
            }
        }
    }
    
    func clearSpread() {
        self.displayedCards.removeAll()
    }
}

// MARK: - Data Management
private extension NewSpreadView {
    //    func saveSpreadTemplate() {
    //        withAnimation {
    //            let newTemplate = SpreadTemplate(context: viewContext)
    //
    //            newTemplate.id = UUID()
    //            newTemplate.date = Date()
    //            newTemplate.title = spreadTitle
    //            newTemplate.spreadDescription = spreadDescription
    //            newTemplate.spreadCards = saveSpreadCards(from: self.cards)
    //
    //            PersistenceController.shared.save()
    //            self.showingSavingAlert = false
    //            self.selectedTab = .savedTemplates
    //        }
    //    }
    //
    //    func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
    //        var cardsArray: [SpreadCards] = []
    //
    //        for card in cards {
    //            let newCard = SpreadCards(context: viewContext)
    //            newCard.id = UUID()
    //            newCard.meaning = card.meaning
    //            newCard.number = Int32(card.number)
    //            newCard.xPosition = card.location.x
    //            newCard.yPosition = card.location.y
    //            newCard.rotationDegrees = card.rotationDegrees
    //
    //            cardsArray.append(newCard)
    //        }
    //
    //        return NSSet(array: cardsArray)
    //    }
}

// MARK: - Views
private extension NewSpreadView {
    @ViewBuilder func createTemplateManagementButtons(windowSize: CGSize) -> some View {
        HStack {
            // Clear Button
            Button(action: clearSpread) {
                Image(systemName: "xmark")
            }
            .disabled(displayedCards.isEmpty ? true : false)
            
            // Save Template Button
            Button(action: {}) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(displayedCards.isEmpty ? true : false)
        }
        //        .disabled(showingSavingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
