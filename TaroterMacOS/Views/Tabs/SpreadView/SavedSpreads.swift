//
//  SavedSpreads.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 10/01/2022.
//

import SwiftUI

/// A view showing saved spreads.
struct SavedSpreads: View {
    @State private var showingSpread: Bool = false
    @State private var selectedSpread: TarotSpreads?
    
    // Core Data Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var savedSpreads: FetchedResults<TarotSpreads>
    
    var body: some View {
        ZStack {
            // Templates List
            ScrollView {
                LazyVStack {
                    ForEach(savedSpreads, id: \.self) { spread in
                        SavedSpreadCardView(savedSpread: spread,
                                            showingSpread: $showingSpread,
                                            selectedSpread: $selectedSpread)
                    }
                }
            }
            .padding(.top, 30)
            
            // Saved Template
            if let spreadCards = selectedSpread?.tarotSpreadCards, showingSpread {
                SpreadPreview(showingSpread: $showingSpread,
                              tarotSpreadCards: spreadCards)
            }
        }
    }
}
