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
            if savedSpreads.isEmpty {
                // Show information that there are no saved spreads
                Text(LocalizedStrings.noSavedSpreads)
                    .emptySpreadLabel()
            } else {
                // Show Saved Spreads List
                ScrollView {
                    LazyVStack {
                        ForEach(savedSpreads, id: \.self) { spread in
                            SavedSpreadCardView(title: spread.title ?? "",
                                                description: spread.spreadDescription ?? "",
                                                date: spread.date ?? Date(),
                                                onTapAction: { showSpread(spread: spread) },
                                                deleteAction: { removeSpread(spread: spread) })
                        }
                    }
                }
                .padding(.top, 30)
            }
            
            // Saved Template
            if let spreadCards = selectedSpread?.tarotSpreadCards, showingSpread {
                SpreadPreview(showingSpread: $showingSpread,
                              tarotSpreadCards: spreadCards)
            }
        }
    }
}

// MARK: - Spread Management
private extension SavedSpreads {
    /// This method shows the selected spread.
    /// - Parameter spread: The spread to be shown.
    func showSpread(spread: TarotSpreads) {
        withAnimation {
            self.selectedSpread = spread
            self.showingSpread = true
        }
    }
    
    /// This method removes the spread from the viewContext.
    /// - Parameter spread: The spread to be deleted.
    func removeSpread(spread: TarotSpreads) {
        withAnimation {
            viewContext.delete(spread)
            PersistenceController.shared.save()
        }
    }
}
