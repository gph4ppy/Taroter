//
//  SavedTemplates.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SavedTemplates: View {
    @State private var showingSpread: Bool = false
    @State private var selectedSpread: SpreadTemplate?
    private let dateFormatter: DateFormatter      = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // Core Data Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<SpreadTemplate>
    
    var body: some View {
        ZStack {
            // Templates List
            ScrollView {
                LazyVStack(spacing: 14,
                           content: createTemplatesList)
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

// MARK: - Data Management
private extension SavedTemplates {
    private func removeTemplate(template: SpreadTemplate) {
        withAnimation {
            viewContext.delete(template)
            PersistenceController.shared.save()
        }
    }
}

// MARK: - Views
private extension SavedTemplates {
    @ViewBuilder func createTemplatesList() -> some View {
        ForEach(spreadTemplates, id: \.self) { template in
            HStack {
                Text(template.title ?? "").bold()
                Spacer()
                Text(dateFormatter.string(from: template.date ?? Date()))
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
                Button(action: { removeTemplate(template: template) }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
            }
            .onTapGesture {
                withAnimation {
                    self.selectedSpread = template
                    self.showingSpread = true
                }
            }
        }
    }
}
