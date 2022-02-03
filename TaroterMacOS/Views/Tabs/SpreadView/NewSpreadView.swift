//
//  NewSpreadView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadView: View {
    @ObservedObject private var alertViewModel = TextFieldAlertViewModel(alertType: .saving)
    @ObservedObject private var cardViewModel = TarotCardViewModel(selectedCard: nil)
    @Binding var showingAlert: Bool
    @Binding var selectedTab: SpreadTabs
    
    // Core Data Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TarotSpreads.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<TarotSpreads>
    
    var body: some View {
        ZStack {
            GeometryReader { geom in
                // Template Management Buttons
                createTemplateManagementButtons(windowSize: geom.size)
                
                // Cards View
                ForEach(cardViewModel.cards, id: \.self) { card in
                    SpreadTarotCard(card: card,
                                    isHoverable: false,
                                    showingTextFieldAlert: $showingAlert,
                                    alertViewModel: alertViewModel,
                                    cardViewModel: cardViewModel)
                        .shadow(radius: 3)
                        .transition(.scale(scale: 0.5, anchor: .center))
                }
                
                ExpandableView {
                    ScrollView {
                        LazyVStack {
                            ForEach(TarotCards.allCases, id: \.self) { card in
                                var tarotCard = SpreadCard(id: UUID(),
                                                           name: card.tarotCard.name,
                                                           imageName: card.tarotCard.imageName,
                                                           number: cardViewModel.cards.count,
                                                           location: CGPoint(x: 125, y: 125),
                                                           meaning: "",
                                                           rotationDegrees: 0.0)
                                
                                Button(action: { addCard(card: &tarotCard, size: geom.size) }) {
                                    SpreadTarotCard(card: tarotCard,
                                                    isHoverable: true,
                                                    showingTextFieldAlert: $showingAlert,
                                                    alertViewModel: alertViewModel,
                                                    cardViewModel: cardViewModel)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            
            // Saving TextField Alert
            if showingAlert, alertViewModel.alertType == .saving {
                TextFieldAlert(viewModel: alertViewModel,
                               isPresented: $showingAlert,
                               saveAction: saveTarotSpread)
            }
            
            // Meaning TextField Alert
            if showingAlert, alertViewModel.alertType == .meaning  {
                TextFieldAlert(viewModel: alertViewModel,
                               isPresented: $showingAlert,
                               saveAction: assignCardMeaning)
            }
        }
    }
}

// MARK: - Methods
private extension NewSpreadView {
    // MARK: - TO FIX!!!!
    func addCard(card: inout SpreadCard, size: CGSize) {
        if !cardViewModel.cards.contains(card) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                card.location = CGPoint(x: size.width / 2, y: size.height / 2)
                cardViewModel.cards.append(card)
            }
        }
    }
    
    /// This method removes all added cards from the array and view.
    func clearSpread() {
        cardViewModel.cards.removeAll()
    }
    
    /// This method assigns the card meaning to the card object
    /// and closes the TextFieldAlert.
    func assignCardMeaning() {
        if let index = cardViewModel.selectedCard?.number {
            cardViewModel.cards[index].meaning = alertViewModel.textFieldText
            withAnimation { self.showingAlert = false }
        }
    }
    
    /// This method clears all the TextFields in
    /// TextFieldViewModel and shows a TextFieldAlert.
    func showSavingAlert() {
        withAnimation {
            self.alertViewModel.alertType = .saving
            self.alertViewModel.textFieldText = ""
            self.alertViewModel.textEditorText = ""
            self.showingAlert = true
        }
    }
}

// MARK: - Data Management
private extension NewSpreadView {
    func saveTarotSpread() {
        withAnimation {
            // Create New Spread
            let newSpread = TarotSpreads(context: viewContext)
            
            // Assign Spread Data
            newSpread.id                = UUID()
            newSpread.date              = Date()
            newSpread.title             = alertViewModel.textFieldText
            newSpread.spreadDescription = alertViewModel.textEditorText
            newSpread.tarotSpreadCards  = saveSpreadCards(from: cardViewModel.cards)
            
            // Save Spread
            PersistenceController.shared.save()
            
            // Hide Alert and show Saved Spreads
            self.showingAlert = false
            self.selectedTab = .savedSpreads
        }
    }
    
    func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
        var cardsArray: [TarotSpreadCards] = []
        
        for card in cards {
            let newCard             = TarotSpreadCards(context: viewContext)
            newCard.id              = UUID()
            newCard.name            = card.name
            newCard.imageName       = card.imageName
            newCard.meaning         = card.meaning
            newCard.number          = Int32(card.number)
            newCard.xPosition       = card.location.x
            newCard.yPosition       = card.location.y
            newCard.rotationDegrees = card.rotationDegrees
            
            cardsArray.append(newCard)
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
            .disabled(cardViewModel.cards.isEmpty ? true : false)
            
            // Save Template Button
            Button(action: saveTarotSpread) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(cardViewModel.cards.isEmpty ? true : false)
        }
        .disabled(showingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
