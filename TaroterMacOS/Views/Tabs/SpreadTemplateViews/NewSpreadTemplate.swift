//
//  NewSpreadTemplate.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct NewSpreadTemplate: View {
    @State private var cards: [SpreadCard]        = []
    @State private var spreadTitle: String        = ""
    @State private var spreadDescription: String? = ""
    @Binding var selectedTab: SpreadTabs
    @Binding var showingSavingAlert: Bool
    
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
                                   isEditable: true)
                }
            }
            
            // TextField Alert
            if showingSavingAlert {
                TextFieldAlert(title: "Save Spread Template",
                               message: "Please, fill the data below to save the spread template",
                               text: $spreadTitle,
                               spreadDescription: $spreadDescription,
                               isPresented: $showingSavingAlert,
                               alertType: .saving,
                               doneButtonAction: saveSpreadTemplate)
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
        let card = SpreadCard(id: UUID(),
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
}

// MARK: - Data Management
private extension NewSpreadTemplate {
    func saveSpreadTemplate() {
        withAnimation {
            let newTemplate = SpreadTemplate(context: viewContext)
            
            newTemplate.id = UUID()
            newTemplate.date = Date()
            newTemplate.title = spreadTitle
            newTemplate.spreadDescription = spreadDescription
            newTemplate.spreadCards = saveSpreadCards(from: self.cards)
            
            PersistenceController.shared.save()
            self.showingSavingAlert = false
            self.selectedTab = .savedTemplates
        }
    }
    
    func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
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
            Button(action: { withAnimation { self.showingSavingAlert = true } }) {
                Image(systemName: "square.and.arrow.down")
            }
            .disabled(cards.isEmpty ? true : false)
            
            // Add Card Button
            Button(action: { addCard(windowSize: windowSize) }) {
                Image(systemName: "plus")
            }
            .disabled(cards.count == 78 ? true : false)
        }
        .disabled(showingSavingAlert ? true : false)
        .frame(maxWidth: .infinity,
               alignment: .topTrailing)
        .zIndex(1)
    }
}
