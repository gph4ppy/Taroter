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
            if spreadTemplates.isEmpty {
                // Show information that there are no saved spreads
                Text(LocalizedStrings.noSavedSpreads)
                    .emptySpreadLabel()
            } else {
                // Show Saved Templates List
                ScrollView {
                    LazyVStack {
                        ForEach(spreadTemplates) { template in
                            SavedSpreadCardView(title: template.title ?? "",
                                                description: template.spreadDescription ?? "",
                                                date: template.date ?? Date(),
                                                onTapAction: { showTemplate(template: template) },
                                                deleteAction: { removeTemplate(template: template) })
                        }
                    }
                }
                .padding(.top, 30)
            }
            
            
            // Saved Template
            if let spreadCards = selectedSpread?.spreadCards, showingSpread {
                SpreadTemplatePreview(showingSpread: $showingSpread,
                                      spreadCards: spreadCards)
            }
        }
    }
}

// MARK: - Spread Management
private extension SavedTemplates {
    /// This method shows the selected template.
    /// - Parameter template: The template to be shown.
    private func showTemplate(template: SpreadTemplate) {
        withAnimation {
            self.selectedSpread = template
            self.showingSpread = true
        }
    }
    
    /// This method removes the template from the viewContext.
    /// - Parameter template: The template to be deleted.
    private func removeTemplate(template: SpreadTemplate) {
        withAnimation {
            viewContext.delete(template)
            PersistenceController.shared.save()
        }
    }
}
