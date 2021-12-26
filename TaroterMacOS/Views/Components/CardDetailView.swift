//
//  CardDetailView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 26/12/2021.
//

import SwiftUI

struct CardDetailView: View {
    let card: TarotCard
    @Binding var showingCardDetail: Bool
    
    var body: some View {
        GeometryReader { geom in
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
                .frame(maxWidth: .infinity, maxHeight: geom.size.height / 1.7)
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
                    
                    // Reversed Keywords
                    ListBuilder.createColumn(title: LocalizedStrings.reversedKeywords,
                                             data: card.reversedKeywords)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .overlay(alignment: .topTrailing) {
            closeButton
        }
    }
    
    var closeButton: some View {
        Button(action: {
            withAnimation {
                self.showingCardDetail = false
            }
        }) {
            Image(systemName: "xmark")
                .padding()
        }
        .buttonStyle(.plain)
    }
}

