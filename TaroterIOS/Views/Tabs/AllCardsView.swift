//
//  AllCardsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A view that shows all 78 cards in a grid.
/// After tapping the cell, it moves to the view with details of the selected card.
struct AllCardsView: View, CardManager {
    @State private var searchText: String               = ""
    private static let deviceType: UIUserInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    private let columns: [GridItem]                     = [GridItem(.adaptive(minimum: deviceType == .phone ? 100 : 120))]
    
    var body: some View {
        ScrollView {
            // Search Bar
            SearchBar(text: $searchText)
            
            // Cards Grid
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(TarotCards.allCases.filter {
                    filterCards($0, search: $searchText)
                }, id: \.self) { card in
                    GridCard(card: card.tarotCard)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarTitle(LocalizedStrings.cards)
    }
}
