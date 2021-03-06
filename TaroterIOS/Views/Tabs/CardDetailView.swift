//
//  CardDetailView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/11/2021.
//

import SwiftUI

/// A view that displays details about the card.
struct CardDetailView: View {
    let card: TarotCard
    
    var body: some View {
        GeometryReader(content: createDetailList)
            .navigationBarTitle(card.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Views
private extension CardDetailView {
    @ViewBuilder func createDetailList(geom: GeometryProxy) -> some View {
        List {
            // Card images - upright and reversed
            HStack {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: 180))
            }
            .frame(maxWidth: .infinity, maxHeight: geom.size.height / 1.3)
            .padding()
            
            // Arcana
            ListBuilder.createRow(title: LocalizedStrings.arcana,
                                  data: card.arcana.name)
            
            // Yes or No
            ListBuilder.createRow(title: LocalizedStrings.yesOrNo,
                                  data: card.yesOrNo.label)
            
            // Keywords
            HStack {
                // Upright Keywords
                ListBuilder.createColumn(title: LocalizedStrings.uprightKeywords,
                                         data: card.uprightKeywords)
                
                Divider()
                
                // Reversed Keywords
                ListBuilder.createColumn(title: LocalizedStrings.reversedKeywords,
                                         data: card.reversedKeywords)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
