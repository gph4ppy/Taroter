//
//  AllCardsView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct AllCardsView: View {
    @State private var searchText: String = ""
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $searchText)
                
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
    
    private func filterCards(_ card: TarotCards) -> Bool {
        let card = card.tarotCard
        
        return searchText.isEmpty ||
        card.name.contains(searchText) ||
        card.arcana.name.contains(searchText) ||
        card.yesOrNo.label.contains(searchText) ||
        card.imageName.contains(searchText) ||
        card.neutralKeywords.contains(searchText) ||
        card.uprightKeywords.contains(searchText) ||
        card.reversedKeywords.contains(searchText)
    }
}

struct AllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsView()
    }
}
