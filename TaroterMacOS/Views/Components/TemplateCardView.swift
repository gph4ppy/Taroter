//
//  TemplateCardView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

struct TemplateCardView: View {
    // Properties
    @State var card: TemplateCard
    var isEditable: Bool
    @Binding var showingTextFieldAlert: Bool
    
    // View Models
    let alertViewModel: TextFieldAlertViewModel?
    let cardViewModel: TemplateCardViewModel?
    
    var body: some View {
        ZStack {
            // Card Shape
            RoundedRectangle(cornerRadius: 12)
                .overlay(cardNumberOverlay)
                .templateCardStyle(rotationDegrees: card.rotationDegrees,
                                   isEditable: isEditable,
                                   contextMenu: createContextMenu,
                                   id: card.id)
                .position(card.location)
                .gesture(
                    DragGesture()
                        .onChanged(relocateCard)
                        .onEnded(saveCardPosition)
                )
        }
    }
}

// MARK: - Methods
private extension TemplateCardView {
    func rotateCard(isAddition: Bool, degrees: Double) {
        withAnimation {
            if isAddition {
                self.card.rotationDegrees += degrees
            } else {
                self.card.rotationDegrees -= degrees
            }
            
            if let cardViewModel = cardViewModel {
                let index = card.number
                cardViewModel.cards[index].rotationDegrees = self.card.rotationDegrees
            }
        }
    }
    
    func relocateCard(value: DragGesture.Value) -> Void {
        if let cardViewModel = cardViewModel {
            cardViewModel.selectedCard = card
            card.location = value.location
        }
    }
    
    func saveCardPosition(value: DragGesture.Value) -> Void {
        if let cardViewModel = cardViewModel {
            let index = card.number
            cardViewModel.cards[index].location = value.location
        }
    }
    
    /// This method removes the card from the spread.
    func removeCard() {
        /* ----------------------------------------------
         MARK: - Workaround
         cards.remove(at: Index) didn't work:
         
         - removing a card with its number, in many cases,
         threw the index out of range.
         
         - cards.firstIndex(of: SpreadCard) only searched
         the first card (index 0); it couldn't find
         and delete other cards.
         
         Therefore, I filter the array by comparing the
         card ID with the ID of the selected card.
         
         I assign all cards that have a different ID
         to the filteredCards variable.
         
         Then I assign the value of this variable
         to the cards array.
         ---------------------------------------------- */
        var filteredCards: [TemplateCard] = []
        
        if let cardViewModel = cardViewModel {
            // Filter Cards
            filteredCards = cardViewModel.cards.filter { spreadCard in
                spreadCard.id != card.id
            }
            
            // Assign the numbers again
            for index in filteredCards.indices {
                filteredCards[index].number = index
            }
            
            // Assign a filtered array to the displayed array.
            cardViewModel.cards = filteredCards
        }
    }
    
    func addMeaning() {
        withAnimation {
            // Assign selected card
            guard let cardViewModel = cardViewModel else { return }
            cardViewModel.selectedCard = card
            
            // Show TextFieldAlert
            self.alertViewModel?.alertType = .meaning
            self.alertViewModel?.textFieldText = ""
            self.showingTextFieldAlert = true
        }
    }
}

// MARK: - Views
private extension TemplateCardView {
    var cardNumberOverlay: some View {
        Text(String(card.number + 1))
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.windowBackgroundColor))
    }
    
    @ViewBuilder var rotationButtons: some View {
        // 15°
        createRotationButton(degrees: 15, operation: .subtraction)
        createRotationButton(degrees: 15, operation: .addition)
        
        // 45°
        createRotationButton(degrees: 45, operation: .subtraction)
        createRotationButton(degrees: 45, operation: .addition)
        
        // 90°
        createRotationButton(degrees: 90, operation: .subtraction)
        createRotationButton(degrees: 90, operation: .addition)
    }
    
    @ViewBuilder func createRotationButton(degrees: Double, operation: RotationButtonOperation) -> some View {
        let isAddition: Bool  = operation == .addition
        let direction: String = isAddition ? "right" : "left"
        
        Button(action: { rotateCard(isAddition: isAddition, degrees: degrees) }) {
            Text("Rotate \(Int(degrees))° \(direction)")
            Image(systemName: isAddition ? "rotate.right.fill" : "rotate.left.fill")
        }
    }
    
    @ViewBuilder func createContextMenu() -> some View {
        // Add Card Meaning Button
        Button(action: addMeaning) {
            Text("Add meaning")
            Image(systemName: "plus")
        }
        
        // Rotate x° Buttons
        rotationButtons
        
        // Remove Card Button
        Button(action: removeCard) {
            Text("Delete card")
            Image(systemName: "trash")
        }
    }
}
