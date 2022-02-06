//
//  MainView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 24/12/2021.
//

import SwiftUI
import CoreData

/// The main view showing the content depending on the selected tab.
struct MainView: View {
    @State private var selectedTab: Tabs = .allCards
    @State private var spreadSearchText: String = ""
    private let colors: [Color] = [Color.black.opacity(0), Color.black, Color.black, Color.black]
    
    var body: some View {
        GeometryReader(content: createMainView)
    }
}

// MARK: Views
private extension MainView {
    /// This method creates the content of the Main View.
    /// - Parameter geom: GeometryProxy, which is used to
    ///                   determine the width of the SideBar
    /// - Returns: Main View content
    @ViewBuilder func createMainView(geom: GeometryProxy) -> some View {
        HStack {
            // Side Bar
            ZStack {
                BlurView()
                sideBarButtons
            }
            .frame(width: geom.size.width / 5)
            .font(.callout)
            .zIndex(1)
            
            // Main View
            switch selectedTab {
                // MARK: - Cards
                case .allCards:    CardsView(selectedTab: .allCards)
                case .major:       CardsView(selectedTab: .major)
                case .minor:       CardsView(selectedTab: .minor)
                
                // MARK: - Spreads
                case .templates:   SpreadTemplateView()
                case .yourSpreads: CreateSpreadView()
            }
        }
    }
    
    /// A VStack containing sections with SideBar buttons.
    var sideBarButtons: some View {
        VStack(alignment: .leading, spacing: 4) {
            // MARK: - Cards
            Text(LocalizedStrings.cards)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
            
            // All Cards
            SideBarButton(title: LocalizedStrings.allCards,
                          systemImage: "rectangle.grid.3x2.fill",
                          selectedTab: $selectedTab)
            
            // Major Arcana
            SideBarButton(title: LocalizedStrings.majorArcana,
                          systemImage: "globe.asia.australia.fill",
                          selectedTab: $selectedTab)
            
            // Minor Arcana
            SideBarButton(title: LocalizedStrings.minorArcana,
                          systemImage: "wand.and.stars",
                          selectedTab: $selectedTab)
            
            // MARK: - Spreads
            Text(LocalizedStrings.spreads)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .padding(.top)
            
            // Spread Templates
            SideBarButton(title: LocalizedStrings.spreadTemplates,
                          systemImage: "rectangle.portrait.on.rectangle.portrait",
                          selectedTab: $selectedTab)
            
            // Your Spreads
            SideBarButton(title: LocalizedStrings.yourSpreads,
                          systemImage: "person.text.rectangle.fill",
                          selectedTab: $selectedTab)
            
            Spacer()
        }
        .padding()
    }
}
