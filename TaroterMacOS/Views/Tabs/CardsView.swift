//
//  CardsView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 26/12/2021.
//

import SwiftUI

struct CardsView: View, CardManager {
    @State private var searchText: String      = ""
    @State private var showingCardDetail: Bool = false
    @State private var selectedCard: TarotCard?
    private let columns: [GridItem]            = [GridItem(.adaptive(minimum: 130))]
    let selectedTab: Arcana
    
    var body: some View {
        let arcanaCards = TarotCards.allCases.filter { $0.tarotCard.arcana == selectedTab }
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
    func showCardDetailView(about card: TarotCard) {
        withAnimation {
            self.selectedCard = card
            self.showingCardDetail = true
            print("Toggled to true")
        }
    }
}

// MARK: - Views
private extension CardsView {
    @ViewBuilder private func createGridCard(card: TarotCards) -> some View {
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
