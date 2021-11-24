//
//  MainView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    private let cardsLabel: Label = Label("Cards", systemImage: "doc.text.image.fill")
    private let scanLabel: Label = Label("Scan", systemImage: "camera.viewfinder")
    
    var body: some View {
        if isFirstTime {
            WelcomeView()
        } else {
            tabView
        }
    }
    
    @ViewBuilder private var tabView: some View {
        TabView {
            ScannerView()
                .tabItem { scanLabel }
            
            AllCardsView()
                .tabItem { cardsLabel }
        }
    }
}
