//
//  AllCardsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A view that shows all 78 cards in a grid.
/// After tapping the cell, it moves to the view with details of the selected card.
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
            .navigationBarTitleDisplayMode(.large)
            .navigationBarTitle(LocalizedStrings.cards)
        }
        .navigationViewStyle(.stack)
    }
}

// MARK: - Methods
private extension AllCardsView {
    /// This method filters an array with cards using the search text, entered in Search Bar.
    /// - Parameter card: Tarot Card Model, stores data about the card.
    /// - Returns: A logical value indicates whether a given card contains the given text.
    ///            If so, it is displayed in AllCardsView.
    private func filterCards(_ card: TarotCards) -> Bool {
        let card                 = card.tarotCard
        let searchKeywords       = card.searchKeywords.map { $0.lowercased() }
        let lowercasedSearchText = searchText.lowercased()
        var isTextInSearchArray  = false
        
        searchKeywords.forEach {
            isTextInSearchArray  = $0.contains(lowercasedSearchText) ? true : false
        }
        
        return lowercasedSearchText.isEmpty ||
        card.name.lowercased().contains(lowercasedSearchText) ||
        card.arcana.name.lowercased().contains(lowercasedSearchText) ||
        card.yesOrNo.label.lowercased().contains(lowercasedSearchText) ||
        card.imageName.lowercased().contains(lowercasedSearchText) ||
        card.uprightKeywords.lowercased().contains(lowercasedSearchText) ||
        card.reversedKeywords.lowercased().contains(lowercasedSearchText) ||
        isTextInSearchArray
    }
}
