//
//  CardView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/11/2021.
//

import SwiftUI

struct CardView: View {
    let height: CGFloat = UIScreen.main.bounds.size.height
    let card: TarotCard
    
    var body: some View {
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
            .frame(maxWidth: .infinity, maxHeight: height / 1.3)
            .padding()
            
            // Arcana
            createRow(title: LocalizedStrings.arcana,
                      data: card.arcana.name)
            
            // Yes or No
            createRow(title: LocalizedStrings.yesOrNo,
                      data: card.yesOrNo.label)
            
            // Keywords
            HStack {
                // Upright Keywords
                createKeywordColumn(title: LocalizedStrings.uprightKeywords,
                                    data: card.uprightKeywords)
                
                Divider()
                
                // Reversed Keywords
                createKeywordColumn(title: LocalizedStrings.reversedKeywords,
                                    data: card.reversedKeywords)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(card.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - ViewBuilder Methods
private extension CardView {
    /// This method creates a list row with data.
    /// - Parameters:
    ///   - title: The title of the information provided on the row
    ///   - data: Card data related to the title of the row
    /// - Returns: List row
    @ViewBuilder func createRow(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .bold()
                .padding(.trailing, 50)
            
            Spacer()
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    /// This method creates a column with card keywords.
    /// - Parameters:
    ///   - title: The title of the card orientation provided on the column [Upright/Reversed]
    ///   - data: Card keywords related to the title of the column (card orientation)
    /// - Returns: A column in the list row
    @ViewBuilder func createKeywordColumn(title: String, data: String) -> some View {
        VStack(alignment: .center) {
            Text(title)
                .bold()
                .padding(.vertical)
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .font(.footnote)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
