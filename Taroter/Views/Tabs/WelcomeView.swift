//
//  WelcomeView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool    = true
    @State private var showingMainView: Bool                    = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Welcome Title
            Text(LocalizedStrings.welcomeTitle)
                .font(.largeTitle)
                .bold()
            
            // Tutorial Tab View
            TabView {
                // 1st screen
                WelcomeScreen(imageName: "sun.haze.fill",
                              title: LocalizedStrings.firstTitle,
                              description: LocalizedStrings.firstDescription)
                // 2nd screen
                WelcomeScreen(imageName: "doc.text.fill.viewfinder",
                              title: LocalizedStrings.secondTitle,
                              description: LocalizedStrings.secondDescription)
                
                // 3rd screen
                WelcomeScreen(imageName: "doc.text.magnifyingglass",
                              title: LocalizedStrings.thirdTitle,
                              description: LocalizedStrings.thirdDescription)
                
                // 4th screen
                WelcomeScreen(imageName: "moon.stars.fill",
                              title: LocalizedStrings.fourthTitle,
                              description: LocalizedStrings.fourthDescription)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            // Start Using App Button
            Button(action: { self.showingMainView = true }) {
                Text(LocalizedStrings.welcomeButton)
                    .mainButtonStyle(cornerRadius: 15)
            }
        }
        .padding(.vertical)
        .fullScreenCover(isPresented: $showingMainView) { ScannerView() }
    }
}
