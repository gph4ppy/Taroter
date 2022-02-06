//
//  NewSpreadView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

/// This View is used to create new Spread.
struct NewSpreadView: View {
    @StateObject private var alertViewModel = TextFieldAlertViewModel(alertType: .saving)
    @StateObject private var cardViewModel = TarotCardViewModel(selectedCard: nil)
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var showingAlert: Bool
    @Binding var selectedTab: SpreadTabs
    
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
                }
                
                // List of Tarot cards that can be added to the view
                ExpandableView {
                    ScrollView {
                        createCardsList(windowSize: geom.size)
                    }
                }
                .frame(maxHeight: .infinity)
                .zIndex(2)
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
    /// This method adds the draggable Tarot card to the view.
    /// - Parameters:
    ///   - card: [inout] SpreadCard, whose position is changed to the
    ///           center of the view and then added to the
    ///           array containing all displayed cards.
    ///   - size: View size that allows the startup positioning of the card
    ///           (x = half-width and y = half-height).
    func addCard(card: inout SpreadCard, size: CGSize) {
        if !cardViewModel.cards.contains(where: { $0.imageName == card.imageName }) {
            withAnimation {
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
    
    /// This method clears all the TextFields values in
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
    /// This method saves the spread.
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
    
    /// This method saves the SpreadCards, appends them to the array,
    /// which is returned as the NSSet.
    /// - Parameter cards: An array of SpreadCards, which are converted
    ///                    to the TarotSpreadCards
    /// - Returns: NSSet of TarotSpreadCards
    func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
        var cardsArray: [TarotSpreadCards] = []
        
        for card in cards {
            let newCard              = TarotSpreadCards(context: viewContext)
            
            newCard.id               = UUID()
            newCard.name             = card.name
            newCard.imageName        = card.imageName
            newCard.meaning          = card.meaning
            newCard.number           = Int32(card.number)
            newCard.xPosition        = card.location.x
            newCard.yPosition        = card.location.y
            newCard.rotationDegrees  = card.rotationDegrees
            newCard.uprightKeywords  = card.uprightKeywords
            newCard.reversedKeywords = card.reversedKeywords

            cardsArray.append(newCard)
        }
        
        return NSSet(array: cardsArray)
    }
}

// MARK: - Views
private extension NewSpreadView {
    /// This method creates a list of Tarot cards that can be added to the view.
    /// - Parameter windowSize: A size of the container view
    /// - Returns: LazyVStack that contains TarotCards buttons,
    ///            which are added to the view after tapping.
    @ViewBuilder func createCardsList(windowSize: CGSize) -> some View {
        LazyVStack {
            ForEach(TarotCards.allCases, id: \.self) { card in
                // Prepare Card
                var tarotCard = SpreadCard(id: UUID(),
                                           name: card.tarotCard.name,
                                           imageName: card.tarotCard.imageName,
                                           number: cardViewModel.cards.count,
                                           location: CGPoint(x: 125, y: 125),
                                           meaning: "",
                                           rotationDegrees: 0.0,
                                           uprightKeywords: card.tarotCard.uprightKeywords,
                                           reversedKeywords: card.tarotCard.reversedKeywords)
                
                // Add Card Button
                Button(action: { addCard(card: &tarotCard, size: windowSize) }) {
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
    
    /// This method creates the spread management buttons.
    /// - Parameter windowSize: A size of the container view
    /// - Returns: HStack of Buttons for Spread Management
    @ViewBuilder func createTemplateManagementButtons(windowSize: CGSize) -> some View {
        HStack {
            // Clear Button
            Button(action: clearSpread) {
                Image(systemName: "xmark")
            }
            .disabled(cardViewModel.cards.isEmpty ? true : false)
            
            // Save Template Button
            Button(action: showSavingAlert) {
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
