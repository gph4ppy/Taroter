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
    private let scanLabel: Label                             = Label(LocalizedStrings.scanner,
                                                                     systemImage: "camera.viewfinder")
    private let cardsLabel: Label                            = Label(LocalizedStrings.cards,
                                                                     systemImage: "doc.text.image.fill")
    
    var body: some View {
        if isFirstTime {
            WelcomeView()
        } else {
            TabView {
                HomeView().tabItem { scanLabel }
                AllCardsView().tabItem { cardsLabel }
            }
            .transition(.move(edge: .bottom))
        }
    }
}
