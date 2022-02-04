//
//  SpreadTarotCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SpreadTarotCard: View {
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
    func showPlusOverlay(_:Bool) {
        if isHoverable {
            withAnimation {
                self.showingPlusOverlay.toggle()
            }
        }
    }
}

// MARK: - Card Position Management
private extension SpreadTarotCard {
    var gesture: _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged(relocateCard)
            .onEnded(saveCardPosition)
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
}

// MARK: - Card Data Management
private extension SpreadTarotCard {
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
    
    @ViewBuilder func createRotationButton(degrees: Double, operation: RotationButtonOperation) -> some View {
        let isAddition: Bool  = operation == .addition
        let direction: String = isAddition ? "right" : "left"
        
        Button(action: { rotateCard(isAddition: isAddition, degrees: degrees) }) {
            Text("Rotate \(Int(degrees))° \(direction)")
            Image(systemName: isAddition ? "rotate.right.fill" : "rotate.left.fill")
        }
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
}
