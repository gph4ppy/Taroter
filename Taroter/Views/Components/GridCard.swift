//
//  GridCard.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/11/2021.
//

import SwiftUI

/// A view that displays the grid cell.
/// Consists of an image and text with a name.
struct GridCard: View {
    let card: TarotCard
    
    var body: some View {
        NavigationLink(destination: CardView(card: card)) {
            VStack {
                // Card Image
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // Card Name
                Text(card.name)
                    .font(.footnote)
                    .bold()
                    .foregroundColor(.primary)
            }
        }
    }
}
