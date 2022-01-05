//
//  MainView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 24/12/2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    @State private var selectedTab: Tabs        = .allCards
    @State private var spreadSearchText: String = ""
    let colors: [Color]                         = [
        Color.black.opacity(0), Color.black, Color.black, Color.black
    ]
    
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
                case .templates:   CreateSpreadTemplateView()
                case .yourSpreads: CreateSpreadTemplateView()
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

//struct CreateSpreadView: View {
//    @Namespace var namespace
//    @State private var showingCardPicker: Bool = false
//    private let columns: [GridItem]            = [GridItem(.adaptive(minimum: 150))]
//    @State private var cardState: CGSize       = .zero
//
//    var body: some View {
//        VStack(alignment: .center) {
//            if showingCardPicker {
//                Rectangle()
//                    .overlay(alignment: .top) {
//                        VStack {
//                            Image(systemName: "chevron.down")
//                                .foregroundColor(.white)
//                                .onTapGesture {
//                                    withAnimation {
//                                        self.showingCardPicker = false
//                                    }
//                                }
//                                .padding()
//
//                            LazyVGrid(columns: columns) {
//                                ForEach(TarotCards.allCases,
//                                        id: \.self,
//                                        content: createGridCard)
//                            }
//                            .padding()
//                        }
//
//                    }
//                    .matchedGeometryEffect(id: "backgroundRect",
//                                           in: namespace)
//            } else {
//                Spacer()
//
//                Rectangle()
//                    .frame(width: 50, height: 25)
//                    .cornerRadius(8)
//                    .overlay(alignment: .center) {
//                        Image(systemName: "chevron.up")
//                            .foregroundColor(.white)
//                            .onTapGesture {
//                                withAnimation {
//                                    self.showingCardPicker = true
//                                }
//                            }
//                            .padding()
//                    }
//                    .offset(y: 5)
//                    .shadow(radius: 5)
//                    .matchedGeometryEffect(id: "backgroundRect",
//                                           in: namespace)
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//
//    @ViewBuilder private func createGridCard(card: TarotCards) -> some View {
//        VStack {
//            // Card Image
//            Image(card.tarotCard.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            // Card Name
//            Text(card.tarotCard.name)
//                .font(.footnote)
//                .bold()
//                .foregroundColor(.white)
//        }
//        .offset(x: cardState.width, y: cardState.height)
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    withAnimation {
//                        self.showingCardPicker = false
//                    }
//
//                    cardState = value.translation
//                }
//        )
//    }
//}
