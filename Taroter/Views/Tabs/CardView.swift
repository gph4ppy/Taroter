//
//  CardView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/11/2021.
//

import SwiftUI

struct CardView: View {
    let isLandscape: Bool   = UIDevice.current.orientation.isLandscape
    let size: CGSize        = UIScreen.main.bounds.size
    let card: TarotCard
    
    var body: some View {
        GeometryReader { geom in
            List {
                // Card images
                HStack {
                    Spacer()
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(Angle(degrees: 180))
                    Spacer()
                }
                .padding()
                .frame(height: isLandscape ? size.height / 1.3 : size.width - 100)
                
                // Arcana
                createRow(title: LocalizedStrings.arcana,
                          data: card.arcana.name)
                
                // Yes or No
                createRow(title: LocalizedStrings.yesOrNo,
                          data: card.yesOrNo.label)
                
                // Keywords
                HStack {
                    Spacer()
                    
                    createKeywordColumn(title: LocalizedStrings.keywords,
                                        data: card.neutralKeywords,
                                        size: geom.size)
                    
                    Group {
                        Spacer()
                        Divider()
                        Spacer()
                    }
                    
                    createKeywordColumn(title: LocalizedStrings.uprightKeywords,
                                        data: card.uprightKeywords,
                                        size: geom.size)
                    
                    Group {
                        Spacer()
                        Divider()
                        Spacer()
                    }
                    
                    createKeywordColumn(title: LocalizedStrings.reversedKeywords,
                                        data: card.reversedKeywords,
                                        size: geom.size)
                    
                    Spacer()
                }
            }
        }
        .navigationBarTitle(card.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder private func createRow(title: String, data: String) -> some View {
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
    
    @ViewBuilder private func createKeywordColumn(title: String, data: String, size: CGSize) -> some View {
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
        .frame(width: (size.width / 4) - 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: TarotCard(name: LocalizedStrings.fool, imageName: "The Fool", arcana: .major, neutralKeywords: LocalizedStrings.foolNeutral, uprightKeywords: LocalizedStrings.foolPositive, reversedKeywords: LocalizedStrings.foolNegative, yesOrNo: .yes))
    }
}
