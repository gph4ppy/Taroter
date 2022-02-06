//
//  TemplateCardView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

struct TemplateCardView: View, CardViewManager {
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
                .gesture(gesture)
        }
    }
}

// MARK: - Card Position Management
extension TemplateCardView {
    /// A DragGesture, which allows moving the card.
    private var gesture: _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged(relocateCard)
            .onEnded(saveCardPosition)
    }
    
    /// This method changes the location of the displayed card.
    /// - Parameter value: Attributes of DragGesture
    func relocateCard(value: DragGesture.Value) -> Void {
        if let cardViewModel = cardViewModel {
            cardViewModel.selectedCard = card
            card.location = value.location
        }
    }
    
    /// This method updates the location of the card.
    /// - Parameter value: Attributes of DragGesture
    func saveCardPosition(value: DragGesture.Value) -> Void {
        if let cardViewModel = cardViewModel {
            let index = card.number
            cardViewModel.cards[index].location = value.location
        }
    }
}

// MARK: - Card Data Management
private extension TemplateCardView {
    /// This method shows an alert that allows adding the meaning of the card.
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
}

// MARK: - Views
private extension TemplateCardView {
    /// An overlay displaying a card number.
    var cardNumberOverlay: some View {
        Text(String(card.number + 1))
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.windowBackgroundColor))
    }
    
    /// This method creates the context menu.
    @ViewBuilder func createContextMenu() -> some View {
        // Add Card Meaning Button
        Button(action: addMeaning) {
            Text(LocalizedStrings.addMeaning)
            Image(systemName: "plus")
        }
        
        // Rotate x° Buttons
        rotationButtons { degrees in
            rotateCard(degrees: degrees, viewModel: cardViewModel, card: card.number) {
                self.card.rotationDegrees += degrees
            }
        }
        
        // Remove Card Button
        Button(action: removeCard) {
            Text(LocalizedStrings.deleteCard)
            Image(systemName: "trash")
        }
    }
}
