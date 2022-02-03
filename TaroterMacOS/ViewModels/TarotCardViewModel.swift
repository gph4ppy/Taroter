//
//  TarotCardViewModel.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 14/01/2022.
//

import SwiftUI

final class TarotCardViewModel: ObservableObject {
    @Published var cards: [SpreadCard] = []
    @Published var selectedCard: SpreadCard?
    
    init(selectedCard: SpreadCard?) {
        self.selectedCard = selectedCard
    }
}
