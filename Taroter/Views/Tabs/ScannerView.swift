//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct ScannerView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool    = true
    @State private var cardNames: [String]                      = []
    @State private var cards: [TarotCards]                      = []
    
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
                        ForEach(cardNames, id: \.self) { cardName in
                            HStack(spacing: 10) {
                                Image(cardName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                
                                VStack {
                                    Text(cardName)
                                        .font(.title3)
                                        .bold()
                                    
                                    Spacer()
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle(LocalizedStrings.scannedCards)
            .toolbar(content: makeToolbar)
        }
        .onAppear(perform: setFirstTimeStatus)
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}

// MARK: - Methods
private extension ScannerView {
    func setFirstTimeStatus() {
        if isFirstTime {
            self.isFirstTime = false
        }
    }
    
    func defineCards() {
        self.cardNames.forEach { cardName in
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        self.cardNames.remove(atOffsets: offsets)
    }
}

// MARK: - Views
private extension ScannerView {
    @ToolbarContentBuilder func makeToolbar() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(LocalizedStrings.clearButton) {
                cardNames.removeAll()
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
}
