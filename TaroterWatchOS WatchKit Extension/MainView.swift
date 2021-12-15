//
//  MainView.swift
//  TaroterWatchOS WatchKit Extension
//
//  Created by Jakub Dąbrowski on 13/12/2021.
//

import SwiftUI

/// The main view of the watch app.
struct MainView: View, CardManager {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            GeometryReader(content: createCardsList)
                .navigationBarTitle(LocalizedStrings.cards)
        }
    }
}

// MARK: - Views
extension MainView {
    /// This method creates a row that redirects to the view with the card's data
    /// - Parameters:
    ///   - card: Tarot Card Model, stores data about the card.
    ///   - height: Device screen height
    /// - Returns: NavigationLink that redirects to the CardDetailView
    @ViewBuilder func createCardRow(card: TarotCard, height: CGFloat) -> some View {
        NavigationLink(destination: CardDetailView(card: card)) {
            VStack(spacing: 10) {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(card.name)
            }
            .frame(height: height / 1.3)
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
    
    /// This method creates a list with cards.
    /// - Parameter geom: A proxy for access to the size
    /// - Returns: List with SearchBar and Cards
    @ViewBuilder func createCardsList(geom: GeometryProxy) -> some View {
        List {
            // Search Bar
            SearchBar(text: $searchText)
            
            // Cards
            ForEach(TarotCards.allCases.filter { filterCards($0, search: $searchText) },
                    id: \.self) { card in
                createCardRow(card: card.tarotCard, height: geom.size.height)
            }
        }
    }
}
