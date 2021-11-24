//
//  GridCard.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/11/2021.
//

import SwiftUI

struct GridCard: View {
    let card: TarotCard
    
    var body: some View {
        NavigationLink(destination: CardView(card: card)) {
            VStack {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(card.name)
                    .font(.footnote)
                    .bold()
                    .foregroundColor(.primary)
            }
        }
    }
}
