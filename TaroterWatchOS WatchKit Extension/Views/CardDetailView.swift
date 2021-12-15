//
//  CardDetailView.swift
//  TaroterWatchOS WatchKit Extension
//
//  Created by Jakub Dąbrowski on 15/12/2021.
//

import SwiftUI

/// A view that displays details about the card.
struct CardDetailView: View {
    let card: TarotCard
    
    var body: some View {
        GeometryReader { geom in
            List {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity,
                           maxHeight: geom.size.height / 1.3)
                    .padding()
                
                // Arcana
                ListBuilder.createRow(title: LocalizedStrings.arcana,
                                      data: card.arcana.name)
                
                // Yes or No
                ListBuilder.createRow(title: LocalizedStrings.yesOrNo,
                                      data: card.yesOrNo.label)
                
                // Upright Keywords
                ListBuilder.createColumn(title: LocalizedStrings.uprightKeywords,
                                         data: card.uprightKeywords)
                
                // Reversed Keywords
                ListBuilder.createColumn(title: LocalizedStrings.reversedKeywords,
                                         data: card.reversedKeywords)
            }
        }
        .navigationBarTitle(card.name)
    }
}
