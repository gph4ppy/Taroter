//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A view that:
/// - shows information that the cards array is empty and the user should click the "Scan" button,
/// - displays scanned cards.
struct HomeView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @Binding var cardNames: [String]
    @Binding var cards: [TarotCards]
    
    var body: some View {
        VStack {
            if cardNames.isEmpty {
                // Information that no cards have been scanned.
                Text(LocalizedStrings.emptyView)
                    .foregroundColor(.gray)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                // List of scanned cards
                List {
                    ForEach(cards,
                            id: \.self,
                            content: createScannedCardRow)
                        .onDelete(perform: delete)
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarHidden(false)
        .navigationBarTitle(LocalizedStrings.scannedCards)
        .onChange(of: cardNames, perform: defineCards)
    }
}

// MARK: - Methods
private extension HomeView {
    /// This method is used to receive the object of the scanned card
    /// by using the scanned card class label.
    func defineCards(_:[String]) {
        cardNames.forEach { imageName in
            cards += TarotCards.allCases.filter {
                $0.tarotCard.imageName == imageName && !cards.contains($0)
            }
        }
    }
    
    /// This method removes a card row from the list.
    /// - Parameter offsets: Represents the indexes of elements in the array with card names
    func delete(at offsets: IndexSet) {
        self.cards.remove(atOffsets: offsets)
        self.cardNames.remove(atOffsets: offsets)
    }
}

// MARK: - Views
private extension HomeView {
    /// This method creates a list row with an image and the name of the scanned card.
    /// - Parameter card: An object containing the data of the scanned card
    /// - Returns: NavigationLink with an image and the name of the scanned card
    @ViewBuilder private func createScannedCardRow(card: TarotCards) -> some View {
        let tarotCard = card.tarotCard
        
        NavigationLink(destination: CardDetailView(card: tarotCard)) {
            HStack(spacing: 10) {
                Image(tarotCard.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text(tarotCard.name)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
