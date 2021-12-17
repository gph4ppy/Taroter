//
//  MainView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// Main view that displays:
/// - Welcome View when the user has not used the application before
/// - TabView which includes HomeView with scanner and view with all cards.
struct MainView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @State private var cardNames: [String]                   = []
    @State private var cards: [TarotCards]                   = []
    private let scanLabel: Label                             = Label(LocalizedStrings.scanner,
                                                                     systemImage: "camera.viewfinder")
    private let cardsLabel: Label                            = Label(LocalizedStrings.cards,
                                                                     systemImage: "doc.text.image.fill")
    
    var body: some View {
        if isFirstTime {
            WelcomeView()
        } else {
            TabView {
                NavigationView {
                    HomeView(cardNames: $cardNames, cards: $cards)
                        .toolbar(content: makeToolbar)
                }
                .tabItem { scanLabel }
                
                NavigationView {
                    AllCardsView()
                }
                .tabItem { cardsLabel }
            }
            .transition(.move(edge: .bottom))
            .navigationViewStyle(.stack)
        }
    }
    
    /// This methods creates the toolbar content
    /// - Returns: ToolbarContent
    @ToolbarContentBuilder func makeToolbar() -> some ToolbarContent {
        // Clear Button
        ToolbarItem(placement: .navigationBarLeading) {
            Button(LocalizedStrings.clearButton) {
                cardNames.removeAll()
                cards.removeAll()
            }
            .disabled(cardNames.isEmpty ? true : false)
        }
        
        // Scan Button
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(LocalizedStrings.scanButton) {
                Scanner(recognizedImages: $cardNames)
                    .navigationBarHidden(true)
            }
        }
    }
}
