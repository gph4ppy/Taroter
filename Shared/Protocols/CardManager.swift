//
//  CardManager.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/12/2021.
//

import SwiftUI

protocol CardManager {
    func filterCards(_ card: TarotCards, search text: Binding<String>) -> Bool
}

extension CardManager {
    /// This method filters an array with cards using the search text, entered in Search Bar.
    /// - Parameter card: Tarot Card Model, stores data about the card
    /// - Returns: A logical value indicates whether a given card contains the given text.
    ///            If so, it is displayed in AllCardsView.
    func filterCards(_ card: TarotCards, search text: Binding<String>) -> Bool {
        let card                 = card.tarotCard
        let searchKeywords       = card.searchKeywords.map { $0.lowercased() }
        let lowercasedSearchText = text.wrappedValue.lowercased()
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
