//
//  MainView.swift
//  TaroterWatchOS WatchKit Extension
//
//  Created by Jakub Dąbrowski on 13/12/2021.
//

import SwiftUI

struct MainView: View {
    @State private var searchText: String = ""
    
    var clearButton: some View {
        HStack {
            Spacer()
            
            Text(LocalizedStrings.clearButton)
                .onTapGesture { searchText = "" }
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geom in
                List {
                    SearchBar(text: $searchText)
                        .overlay(
                            !searchText.isEmpty ? clearButton : nil
                        )
                    
                    ForEach(TarotCards.allCases.filter(filterCards), id: \.self) { card in
                        NavigationLink(destination: CardDetailView(card: card.tarotCard)) {
                            VStack(spacing: 10) {
                                Image(card.tarotCard.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text(card.tarotCard.name)
                            }
                            .frame(height: geom.size.height, alignment: .center)
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                    }
                }
            }
            .navigationBarTitle(LocalizedStrings.cards)
        }
    }
    
    /// This method filters an array with cards using the search text, entered in Search Bar.
    /// - Parameter card: Tarot Card Model, stores data about the card.
    /// - Returns: A logical value indicates whether a given card contains the given text.
    ///            If so, it is displayed in AllCardsView.
    private func filterCards(_ card: TarotCards) -> Bool {
        let card                 = card.tarotCard
        let searchKeywords       = card.searchKeywords.map { $0.lowercased() }
        let lowercasedSearchText = searchText.lowercased()
        var isTextInSearchArray  = false
        
        searchKeywords.forEach {
            isTextInSearchArray  = $0.contains(lowercasedSearchText) ? true : false
        }
        
        return lowercasedSearchText.isEmpty ||
        card.name.lowercased().contains(lowercasedSearchText) ||
        card.arcana.name.lowercased().contains(lowercasedSearchText) ||
        card.yesOrNo.label.lowercased().contains(lowercasedSearchText) ||
        card.imageName.lowercased().contains(lowercasedSearchText) ||
        card.uprightKeywords.lowercased().contains(lowercasedSearchText) ||
        card.reversedKeywords.lowercased().contains(lowercasedSearchText) ||
        isTextInSearchArray
    }
}

/// A view used to filter the content of the array.
/// Searches for items containing the specified text.
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        if #available(watchOSApplicationExtension 8.0, *) {
            TextField(LocalizedStrings.search, text: $text)
                .disableAutocorrection(true)
        } else {
            TextField(LocalizedStrings.search, text: $text)
        }
    }
}

struct CardDetailView: View {
    let card: TarotCard
    
    var body: some View {
        GeometryReader { geom in
            List {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: geom.size.height / 1.3)
                    .padding()
                
                // Arcana
                createRow(title: LocalizedStrings.arcana, data: card.arcana.name)
                
                // Yes or No
                createRow(title: LocalizedStrings.yesOrNo, data: card.yesOrNo.label)
                
                // Upright Keywords
                createKeywordColumn(title: LocalizedStrings.uprightKeywords, data: card.uprightKeywords)
                
                // Reversed Keywords
                createKeywordColumn(title: LocalizedStrings.reversedKeywords, data: card.reversedKeywords)
            }
        }
        .navigationBarTitle(card.name)
    }
    
    /// This method creates a list row with data.
    /// - Parameters:
    ///   - title: The title of the information provided on the row
    ///   - data: Card data related to the title of the row
    /// - Returns: List row
    @ViewBuilder func createRow(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    /// This method creates a column with card keywords.
    /// - Parameters:
    ///   - title: The title of the card orientation provided on the column [Upright/Reversed]
    ///   - data: Card keywords related to the title of the column (card orientation)
    /// - Returns: A column in the list row
    @ViewBuilder func createKeywordColumn(title: String, data: String) -> some View {
        VStack(alignment: .center) {
            Text(title)
                .bold()
                .padding(.vertical)
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .font(.footnote)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

/// A view with the welcome tutorial.
struct WelcomeView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        TabView(content: createTabViewContent)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
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
    }
}

/// A view displayed in Welcome View.
struct WelcomeScreen: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 13) {
                // Image
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .frame(width: 50, height: 50)
                
                // Title
                Text(title)
                    .bold()
                
                // Description
                Text(description)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 20)
        }
    }
}
