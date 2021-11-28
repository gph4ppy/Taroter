//
//  AllCardsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct AllCardsView: View {
    @State private var searchText: String = ""
    let columns: [GridItem]               = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Search Bar
                SearchBar(text: $searchText)
                
                // Cards Grid
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(TarotCards.allCases.filter(filterCards), id: \.self) { card in
                        GridCard(card: card.tarotCard)
                    }
                }
                .padding()
            }
            .navigationBarTitle(LocalizedStrings.cards)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Methods
private extension AllCardsView {
    /// This method filters an array with cards using the search text, entered in Search Bar.
    /// - Parameter card: Tarot Card Model, stores data about the card.
    /// - Returns: A logical value indicates whether a given card contains the given text.
    ///            If so, it is displayed in AllCardsView.
    private func filterCards(_ card: TarotCards) -> Bool {
        let card = card.tarotCard
        
        return searchText.isEmpty ||
        card.name.contains(searchText) ||
        card.arcana.name.contains(searchText) ||
        card.yesOrNo.label.contains(searchText) ||
        card.imageName.contains(searchText) ||
        card.uprightKeywords.contains(searchText) ||
        card.reversedKeywords.contains(searchText)
    }
}
