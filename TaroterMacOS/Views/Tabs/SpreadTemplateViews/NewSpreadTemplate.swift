//
//  NewSpreadTemplate.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadTemplate: View {
    @StateObject private var cardViewModel: TemplateCardViewModel = TemplateCardViewModel(selectedCard: nil)
    @StateObject private var alertViewModel: TextFieldAlertViewModel    = TextFieldAlertViewModel(alertType: .saving)
    @Binding var selectedTab: SpreadTabs
    @Binding var showingAlert: Bool
    
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
                ForEach(cardViewModel.cards, id: \.self) { card in
                    TemplateCardView(card: card,
                                     isEditable: true,
                                     showingTextFieldAlert: $showingAlert,
                                     alertViewModel: alertViewModel,
                                     cardViewModel: cardViewModel)
                }
            }
            
            // Saving TextField Alert
            if showingAlert, alertViewModel.alertType == .saving {
                TextFieldAlert(viewModel: alertViewModel,
                               isPresented: $showingAlert,
                               saveAction: saveSpreadTemplate)
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
private extension NewSpreadTemplate {
    /// This method appends a card with a number to the array
    /// so it can be displayed in the center of the view.
    /// - Parameter windowSize: View size that allows the startup positioning of the card
    ///                         (x = half-width and y = half-height).
    func addCard(windowSize: CGSize) {
        let card = TemplateCard(id: UUID(),
                                number: cardViewModel.cards.count,
                                location: CGPoint(x: windowSize.width / 2,
                                                  y: windowSize.height / 2),
                                meaning: "",
                                rotationDegrees: 0.0)
        
        cardViewModel.cards.append(card)
    }
    
    func clearSpread() {
        withAnimation {
            cardViewModel.cards.removeAll()
        }
    }
    
    /// This method assigns the card meaning to the card object
    /// and closes the TextFieldAlert.
    func assignCardMeaning() {
        if let index = cardViewModel.selectedCard?.number {
            cardViewModel.cards[index].meaning = alertViewModel.textFieldText
            withAnimation { self.showingAlert = false }
        }
    }
}

// MARK: - Data Management
private extension NewSpreadTemplate {
    func saveSpreadTemplate() {
        withAnimation {
            let newTemplate = SpreadTemplate(context: viewContext)
            
            // Assign Data
            newTemplate.id                = UUID()
            newTemplate.date              = Date()
            newTemplate.title             = alertViewModel.textFieldText
            newTemplate.spreadDescription = alertViewModel.textEditorText
            newTemplate.spreadCards       = saveSpreadCards(from: cardViewModel.cards)
            
            // Save
            PersistenceController.shared.save()
            
            // Hide alert and show saved templates
            self.showingAlert             = false
            self.selectedTab              = .savedTemplates
        }
    }
    
    func saveSpreadCards(from cards: [TemplateCard]) -> NSSet? {
        var cardsArray: [SpreadCards] = []
        
        for card in cards {
            let newCard = SpreadCards(context: viewContext)
            newCard.id = UUID()
            newCard.meaning = card.meaning
            newCard.number = Int32(card.number)
            newCard.xPosition = card.location.x
            newCard.yPosition = card.location.y
            newCard.rotationDegrees = card.rotationDegrees
            
            cardsArray.append(newCard)
        }
        
        return NSSet(array: cardsArray)
    }
}

// MARK: - Views
private extension NewSpreadTemplate {
    @ViewBuilder func createTemplateManagementButtons(windowSize: CGSize) -> some View {
        HStack {
            // Clear Button
            Button(action: clearSpread) {
                Image(systemName: "xmark")
            }
            .disabled(cardViewModel.cards.isEmpty ? true : false)
            
            // Save Template Button
            Button(action: { withAnimation {
                self.alertViewModel.alertType = .saving
                self.showingAlert = true
            } }) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(cardViewModel.cards.isEmpty ? true : false)
            
            // Add Card Button
            Button(action: { addCard(windowSize: windowSize) }) {
                Image(systemName: "plus")
            }
            .disabled(cardViewModel.cards.count == 78 ? true : false)
        }
        .disabled(showingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
