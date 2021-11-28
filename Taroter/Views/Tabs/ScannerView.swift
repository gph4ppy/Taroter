//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @State private var cardNames: [String]                   = []
    @State private var cards: [TarotCards]                   = []
    
    var body: some View {
        NavigationView {
            VStack {
                if cardNames.isEmpty {
                    Text(LocalizedStrings.emptyView)
                        .foregroundColor(.gray)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List {
                        ForEach(cards,
                                id: \.self,
                                content: createCardPreview)
                            .onDelete(perform: delete)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(false)
            .navigationBarTitle(LocalizedStrings.scannedCards)
            .toolbar(content: makeToolbar)
        }
        .onAppear(perform: setFirstTimeStatus)
        .onChange(of: cardNames, perform: defineCards)
    }
}

// MARK: - Methods
private extension HomeView {
    func setFirstTimeStatus() {
        if isFirstTime {
            self.isFirstTime = false
        }
    }
    
    func defineCards(_:[String]) {
        TarotCards.allCases.forEach { card in
            cardNames.forEach { imageName in
                if card.tarotCard.imageName == imageName {
                    self.cards.append(card)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        self.cardNames.remove(atOffsets: offsets)
    }
}

// MARK: - Views
private extension HomeView {
    @ToolbarContentBuilder func makeToolbar() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(LocalizedStrings.clearButton) {
                cardNames.removeAll()
                cards.removeAll()
            }
            .disabled(cardNames.isEmpty ? true : false)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(LocalizedStrings.scanButton) {
                Scanner(recognizedImages: $cardNames)
                    .navigationBarHidden(true)
            }
        }
    }
    
    @ViewBuilder private func createCardPreview(card: TarotCards) -> some View {
        let tarotCard = card.tarotCard
        
        NavigationLink(destination: CardView(card: tarotCard)) {
            HStack(spacing: 10) {
                Image(tarotCard.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text(tarotCard.name)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
