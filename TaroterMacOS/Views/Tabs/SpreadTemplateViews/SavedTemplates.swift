//
//  SavedTemplates.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

/// A view showing saved spreads templates.
struct SavedTemplates: View {
    @State private var showingSpread: Bool = false
    @State private var selectedSpread: SpreadTemplate?
    
    // Core Data Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<SpreadTemplate>
    
    var body: some View {
        ZStack {
            // Saved Templates List
            ScrollView {
                LazyVStack {
                    ForEach(spreadTemplates) { template in
                        SavedTemplateCardView(spreadTemplate: template,
                                              showingSpread: $showingSpread,
                                              selectedSpread: $selectedSpread)
                    }
                }
            }
            .padding(.top, 30)
            
            // Saved Template
            if let spreadCards = selectedSpread?.spreadCards, showingSpread {
                SpreadTemplatePreview(showingSpread: $showingSpread,
                                      spreadCards: spreadCards)
            }
        }
    }
}
