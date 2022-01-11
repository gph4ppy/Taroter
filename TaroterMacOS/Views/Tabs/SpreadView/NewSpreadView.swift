//
//  NewSpreadView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadView: View {
    @State private var viewModel: TextFieldAlertViewModel = TextFieldAlertViewModel(alertType: .saving)
    @State private var displayedCards: [SpreadCard]       = []
    @State private var showingSavingAlert: Bool           = false
    @State private var selectedCard: SpreadCard?
    @Binding var selectedTab: SpreadTabs
    
    // Core Data Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<SpreadTemplate>
    
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
                            let tarotCard = SpreadCard(id: UUID(),
                                                       name: card.tarotCard.name,
                                                       imageName: card.tarotCard.imageName,
                                                       number: displayedCards.count,
                                                       location: CGPoint(x: 125, y: 125),
                                                       meaning: "",
                                                       rotationDegrees: 0.0)
                            
                            Button(action: { addCard(card: tarotCard) }) {
                                SpreadTarotCard(cardPosition: tarotCard.location,
                                                rotationDegrees: 0.0,
                                                cards: $displayedCards,
                                                selectedCard: $selectedCard,
                                                card: tarotCard,
                                                isHoverable: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            
            // TextField Save Spread Alert
            if showingSavingAlert {
                TextFieldAlert(viewModel: viewModel,
                               isPresented: $showingSavingAlert,
                               doneButtonAction: saveTarotSpread)
            }
        }
    }
}

// MARK: - Methods
private extension NewSpreadView {
    func addCard(card: SpreadCard) {
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
        func saveTarotSpread() {
            withAnimation {
                let newSpread = TarotSpreads(context: viewContext)
    
                newSpread.id = UUID()
                newSpread.date = Date()
                newSpread.title = viewModel.textFieldText
                newSpread.spreadDescription = viewModel.textEditorText
//                newSpread.tarotSpreadCards = saveSpreadCards(from: self.displayedCards)
    
                PersistenceController.shared.save()
                self.showingSavingAlert = false
                self.selectedTab = .savedTemplates
            }
        }
    
        func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
            var cardsArray: [SpreadCard] = []
    
            for card in cards {
                let newCard = TarotSpreadCards(context: viewContext)
                newCard.id = UUID()
                newCard.meaning = card.meaning
                newCard.number = Int32(card.number)
                newCard.xPosition = card.location.x
                newCard.yPosition = card.location.y
                newCard.rotationDegrees = card.rotationDegrees
    
//                cardsArray.append(newCard)
            }
    
            return NSSet(array: cardsArray)
        }
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
            Button(action: saveTarotSpread) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(displayedCards.isEmpty ? true : false)
        }
        .disabled(showingSavingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
