//
//  CardView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/11/2021.
//

import SwiftUI

struct CardView: View {
    let card: TarotCard
    
    var body: some View {
        List {
            HStack {
                Spacer()
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding()
                Spacer()
            }
            
            // Arcana
            HStack {
                Text(LocalizedStrings.arcana).bold()
                Spacer()
                Text(card.arcana.name).foregroundColor(.gray)
            }
            
            // Yes or No
            HStack {
                Text(LocalizedStrings.yesOrNo).bold()
                Spacer()
                Text(card.yesOrNo.label).foregroundColor(.gray)
            }
            
            // Keywords
            HStack {
                Text(LocalizedStrings.keywords).bold()
                Spacer()
                Text(card.neutralKeywords).foregroundColor(.gray)
            }
            
            // Upright
            HStack {
                Text(LocalizedStrings.uprightKeywords).bold()
                Spacer()
                Text(card.uprightKeywords).foregroundColor(.gray)
            }
            
            // Reversed
            HStack {
                Text(LocalizedStrings.reversedKeywords).bold()
                Spacer()
                Text(card.reversedKeywords).foregroundColor(.gray)
            }
        }
        .navigationBarTitle(card.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: TarotCard(name: LocalizedStrings.kingOfSwords, imageName: "King of Swords", arcana: .minor, neutralKeywords: "", uprightKeywords: "", reversedKeywords: "", yesOrNo: .yes))
    }
}
