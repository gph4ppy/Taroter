//
//  NewSpreadTemplate.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadTemplate: View {
    @State private var viewModel: TextFieldAlertViewModel = TextFieldAlertViewModel(alertType: .saving)
    @State private var cards: [TemplateCard]              = []
    @State private var selectedCard: TemplateCard?
    @Binding var selectedTab: SpreadTabs
    @Binding var showingAlert: Bool
    
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
                ForEach(cards, id: \.self) { card in
                    EmptyTarotCard(card: card,
                                   cards: $cards,
                                   selectedCard: $selectedCard,
                                   viewModel: $viewModel,
                                   showingTextFieldAlert: $showingAlert,
                                   isEditable: true)
                }
            }
            
            // Saving TextField Alert
            if showingAlert, viewModel.alertType == .saving {
                TextFieldAlert(viewModel: viewModel,
                               isPresented: $showingAlert,
                               doneButtonAction: saveSpreadTemplate)
            }
            
            // Meaning TextField Alert
            if showingAlert, viewModel.alertType == .meaning  {
                TextFieldAlert(viewModel: viewModel,
                               isPresented: $showingAlert,
                               doneButtonAction: assignCardMeaning)
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
                                number: cards.count,
                                location: CGPoint(x: windowSize.width / 2,
                                                  y: windowSize.height / 2),
                                meaning: "",
                                rotationDegrees: 0.0)
        
        self.cards.append(card)
    }
    
    func clearSpread() {
        withAnimation {
            self.cards.removeAll()
        }
    }
    
    /// This method assigns the card meaning to the card object
    /// and closes the TextFieldAlert.
    func assignCardMeaning() {
        if let index = selectedCard?.number {
            cards[index].meaning = viewModel.textFieldText
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
            newTemplate.title             = viewModel.textFieldText
            newTemplate.spreadDescription = viewModel.textEditorText
            newTemplate.spreadCards       = saveSpreadCards(from: self.cards)
            
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
            .disabled(cards.isEmpty ? true : false)
            
            // Save Template Button
            Button(action: { withAnimation {
                self.viewModel = TextFieldAlertViewModel(alertType: .saving)
                self.showingAlert = true
            } }) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(cards.isEmpty ? true : false)
            
            // Add Card Button
            Button(action: { addCard(windowSize: windowSize) }) {
                Image(systemName: "plus")
            }
            .disabled(cards.count == 78 ? true : false)
        }
        .disabled(showingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
