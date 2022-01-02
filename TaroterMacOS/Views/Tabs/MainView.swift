//
//  MainView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 24/12/2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    @State private var selectedTab: String = LocalizedStrings.allCards
    @State private var spreadSearchText: String = ""
    let colors: [Color] = [Color.black.opacity(0), Color.black, Color.black, Color.black]
    
    enum SpreadsTabs: String {
        case templates
        case spreads
        
        var label: String {
            switch self {
                case .templates: return LocalizedStrings.spreadTemplates
                case .spreads: return ""
            }
        }
    }
    
    var body: some View {
        GeometryReader { geom in
            HStack {
                // Side Bar
                ZStack {
                    BlurView()
                    
                    sideBarButtons
                    .mask(
                        LinearGradient(colors: colors,
                                       startPoint: .bottom,
                                       endPoint: .top)
                    )
                }
                .frame(width: geom.size.width / 5)
                .font(.callout)
                
                // Main View
                switch selectedTab {
                    // MARK: - Cards
                    case LocalizedStrings.allCards: CardsView(selectedTab: .allCards)
                    case LocalizedStrings.majorArcana: CardsView(selectedTab: .major)
                    case LocalizedStrings.minorArcana: CardsView(selectedTab: .minor)
                    
                    // MARK: - Spreads
                    case LocalizedStrings.spreadTemplates: CreateSpreadTemplateView()
                    default: CreateSpreadTemplateView()
                }
            }
        }
    }
    
    var sideBarButtons: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 4) {
                // MARK: - Cards
                Text(LocalizedStrings.cards)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                
                SideBarButton(title: LocalizedStrings.allCards,
                              systemImage: "rectangle.grid.3x2.fill",
                              selectedTab: $selectedTab)
                
                SideBarButton(title: LocalizedStrings.majorArcana,
                              systemImage: "globe.asia.australia.fill",
                              selectedTab: $selectedTab)
                
                SideBarButton(title: LocalizedStrings.minorArcana,
                              systemImage: "wand.and.stars",
                              selectedTab: $selectedTab)
                
                // MARK: - Spreads
                Text(LocalizedStrings.spreads)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                SideBarButton(title: LocalizedStrings.spreadTemplates,
                              systemImage: "rectangle.portrait.on.rectangle.portrait",
                              selectedTab: $selectedTab)
                
                SideBarButton(title: "Your Spreads",
                              systemImage: "person.text.rectangle.fill",
                              selectedTab: $selectedTab)
                
                Spacer()
            }
            .padding()
        }
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
