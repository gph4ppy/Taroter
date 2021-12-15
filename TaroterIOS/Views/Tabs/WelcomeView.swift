//
//  WelcomeView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A view with the welcome tutorial.
struct WelcomeView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        VStack(spacing: 30) {
            // Welcome Title
            Text(LocalizedStrings.welcomeTitle)
                .font(.largeTitle)
                .bold()
            
            // Tutorial Tab View
            TabView(content: createTabViewContent)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            // Start Using App Button
            Button {
                withAnimation { self.isFirstTime = false }
            } label: {
                Text(LocalizedStrings.welcomeButton)
                    .mainButtonStyle(cornerRadius: 15)
            }

        }
        .padding(.vertical)
    }
}

// MARK: - Methods
private extension WelcomeView {
    /// This method creates the contents of the welcome screen.
    /// - Returns: TabView content
    @ViewBuilder func createTabViewContent() -> some View {
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
}
