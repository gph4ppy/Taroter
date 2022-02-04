//
//  TemplateCardViewModel.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 12/01/2022.
//

import SwiftUI

/// A ViewModel used to manage the TemplateCard.
final class TemplateCardViewModel: ObservableObject {
    @Published var cards: [TemplateCard] = []
    @Published var selectedCard: TemplateCard?
    
    init(selectedCard: TemplateCard?) {
        self.selectedCard = selectedCard
    }
}
