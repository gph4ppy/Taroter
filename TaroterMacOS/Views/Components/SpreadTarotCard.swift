//
//  SpreadTarotCard.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SpreadTarotCard: View {
    @State private var showingPlusOverlay: Bool = false
    @State var cardPosition: CGPoint
    @State var rotationDegrees: Double
    @Binding var cards: [TarotCards]
    @Binding var selectedCard: TarotCards?
    let card: TarotCards
    let isHoverable: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            // Card Image
            Image(card.tarotCard.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 74.75)
                .shadow(color: Color(.windowBackgroundColor), radius: 3)
                .rotationEffect(.degrees(rotationDegrees))
            
            // Card Name
            Text(card.tarotCard.name)
                .font(.footnote)
                .bold()
                .foregroundColor(isHoverable ? Color(.windowBackgroundColor) : .primary)
        }
        .padding()
        .overlay(plusOverlay)
        .position(x: cardPosition.x, y: cardPosition.y)
        .gesture(gesture)
        .onHover(perform: showPlusOverlay)
        .disabled(isHoverable)
        .contextMenu {
            if !isHoverable {
                // Add Card Meaning Button
                //        Button {
                //            withAnimation { self.showingTextFieldAlert = true }
                //        } label: {
                //            Text("Add meaning")
                //            Image(systemName: "plus")
                //        }
                
                // Rotate x° Buttons
                rotationButtons
                
                // Remove Card Button
                Button(action: removeCard) {
                    Text("Delete card")
                    Image(systemName: "trash")
                }
            }
        }
    }
    
    func showPlusOverlay(_:Bool) {
        if isHoverable {
            withAnimation {
                self.showingPlusOverlay.toggle()
            }
        }
    }
    
    var gesture: _ChangedGesture<DragGesture> {
        DragGesture()
            .onChanged { value in
                cardPosition = value.location
            }
    }
    
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
    
    func rotateCard(isAddition: Bool, degrees: Double) {
        withAnimation(.linear(duration: 0.15)) {
            if isAddition {
                self.rotationDegrees += degrees
            } else {
                self.rotationDegrees -= degrees
            }
        }
    }
    
    /// This method removes the card from the spread.
    func removeCard() {
        var filteredCards: [TarotCards] = []
        
        // Filter Cards
        filteredCards = cards.filter { spreadCard in
            spreadCard.tarotCard.name != card.tarotCard.name
        }
        
        // Assign a filtered array to the displayed array.
        self.cards = filteredCards
    }
}
