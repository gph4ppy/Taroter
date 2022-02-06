//
//  CardsView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 26/12/2021.
//

import SwiftUI

/// A view that shows all cards in a grid. When [card is] clicked, it shows `CardDetailView`.
struct CardsView: View, CardManager {
    @State private var searchText: String = ""
    @State private var showingCardDetail: Bool = false
    @State private var selectedCard: TarotCard?
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 130))]
    let selectedTab: Tabs
    
    var body: some View {
        let arcanaCards = TarotCards.allCases.filter { $0.tarotCard.arcana.name == selectedTab.label }
        let filteredArcanaCards = arcanaCards.filter { filterCards($0, search: $searchText) }
        let allCards = TarotCards.allCases.filter { filterCards($0, search: $searchText) }
        
        ZStack {
            // Filtered Cards
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(arcanaCards.isEmpty ? allCards : filteredArcanaCards,
                            id: \.self,
                            content: createGridCard)
                }
                .padding()
                .searchable(text: $searchText)
            }
            
            // Card Detail View
            if let selectedCard = selectedCard, showingCardDetail {
                CardDetailView(card: selectedCard, showingCardDetail: $showingCardDetail)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

// MARK: - Methods
private extension CardsView {
    /// This method selects a card and presents its data in a detail view.
    /// - Parameter card: TarotCard enum case, containing all card data
    func showCardDetailView(about card: TarotCard) {
        withAnimation {
            self.selectedCard = card
            self.showingCardDetail = true
        }
    }
}

// MARK: - Views
private extension CardsView {
    /// This method creates a view of the card (photo + name) presented in the grid.
    /// - Parameter card: TarotCard enum case, containing all card data
    /// - Returns: A VStack containing card image and name
    @ViewBuilder func createGridCard(card: TarotCards) -> some View {
        VStack {
            // Card Image
            Image(card.tarotCard.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Card Name
            Text(card.tarotCard.name)
                .font(.footnote)
                .bold()
                .foregroundColor(.primary)
        }
        .onTapGesture { showCardDetailView(about: card.tarotCard) }
    }
}
