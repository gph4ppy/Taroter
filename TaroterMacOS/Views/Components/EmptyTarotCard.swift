//
//  EmptyTarotCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

enum RotationButtonOperation {
    case addition
    case subtraction
}

struct EmptyTarotCard: View {
    @State var cardMeaning: String         = ""
    @State var showingTextFieldAlert: Bool = false
    @State var card: SpreadCard
    @Binding var cards: [SpreadCard]
    var isEditable: Bool
    
    var body: some View {
        ZStack {
            // Card Shape
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 74.75, height: 124.75)
                .shadow(radius: 5)
                .overlay(cardNumberOverlay)
                .rotationEffect(.degrees(card.rotationDegrees))
                .position(card.location)
                .gesture(
                    // Strange code, but without the onEnded,
                    // the location couldn't be saved
                    // (although you could move the card).
                    DragGesture()
                        .onChanged { card.location = $0.location }
                        .onEnded { cards[card.number].location = $0.location }
                )
                .contextMenu(menuItems: createContextMenu)
                .id(card.id)
                .disabled(!isEditable)
            
            // Meaning TextField Alert
            if showingTextFieldAlert {
                TextFieldAlert(title: "Meaning",
                               message: "Add card number \(card.number + 1) meaning or question",
                               text: $cardMeaning,
                               spreadDescription: .constant(nil),
                               isPresented: $showingTextFieldAlert,
                               alertType: .meaning,
                               doneButtonAction: assignCardMeaning)
            }
        }
    }
}

// MARK: - Methods
private extension EmptyTarotCard {
    /// This method assigns the card meaning to the card object
    /// and closes the TextFieldAlert.
    func assignCardMeaning() {
        card.meaning = self.cardMeaning
        withAnimation { self.showingTextFieldAlert = false }
    }
    
    func rotateCard(isAddition: Bool, degrees: Double) {
        withAnimation {
            if isAddition {
                self.card.rotationDegrees += degrees
            } else {
                self.card.rotationDegrees -= degrees
            }
            
            cards[card.number].rotationDegrees = card.rotationDegrees
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
        var filteredCards: [SpreadCard] = []
        
        // Filter Cards
        filteredCards = cards.filter { spreadCard in
            spreadCard.id != card.id
        }
        
        // Assign the numbers again
        for index in filteredCards.indices {
            filteredCards[index].number = index
        }
        
        // Assign a filtered array to the displayed array.
        self.cards = filteredCards
    }
}

// MARK: - Views
private extension EmptyTarotCard {
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
        Button {
            withAnimation { self.showingTextFieldAlert = true }
        } label: {
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
