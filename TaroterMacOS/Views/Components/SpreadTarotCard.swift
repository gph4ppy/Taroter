//
//  SpreadTarotCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SpreadTarotCard: View, CardViewManager {
    // Properties
    @State private var showingPlusOverlay: Bool = false
    @State var card: SpreadCard
    var isHoverable: Bool
    @Binding var showingTextFieldAlert: Bool
    
    // View Models
    let alertViewModel: TextFieldAlertViewModel?
    let cardViewModel: TarotCardViewModel?
    
    var body: some View {
        VStack(spacing: 10) {
            // Card Image
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 74.75)
                .shadow(color: Color(.windowBackgroundColor), radius: 3)
                .rotationEffect(.degrees(card.rotationDegrees))
            
            // Card Name
            Text(card.name)
                .font(.footnote)
                .bold()
                .foregroundColor(isHoverable ? Color(.windowBackgroundColor) : .primary)
        }
        .padding()
        .overlay(plusOverlay)
        .position(x: card.location.x, y: card.location.y)
        .gesture(gesture)
        .onHover(perform: showPlusOverlay)
        .disabled(isHoverable)
        .contextMenu { isHoverable ? nil : createContextMenu() }
    }
}

// MARK: - Methods
private extension SpreadTarotCard {
    /// If hover is allowed and performed, show plus overlay.
    func showPlusOverlay(_:Bool) {
        if isHoverable {
            withAnimation {
                self.showingPlusOverlay.toggle()
            }
        }
    }
}

// MARK: - Card Position Management
extension SpreadTarotCard {
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
private extension SpreadTarotCard {
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
        withAnimation {
            var filteredCards: [SpreadCard] = []
            
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
}

// MARK: - Views
private extension SpreadTarotCard {
    /// A plus overlay, which is displayed on hover.
    var plusOverlay: some View {
        ZStack {
            if showingPlusOverlay {
                Color.white.opacity(0.35)
                    .cornerRadius(12)
                
                Image(systemName: "plus")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3)
            }
        }
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
