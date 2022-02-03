//
//  SavedTemplateCardView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 03/02/2022.
//

import SwiftUI

/// A view showing basic data about the saved spread template.
struct SavedTemplateCardView: View {
    var spreadTemplate: SpreadTemplate
    @Binding var showingSpread: Bool
    @Binding var selectedSpread: SpreadTemplate?
    @Environment(\.managedObjectContext) private var viewContext
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 12)
                .shadow(color: .secondary,
                        radius: 2,
                        x: -5, y: 5)
            
            VStack(spacing: 10) {
                // Title, Date and Remove Template Button
                HStack(spacing: 10) {
                    Text(spreadTemplate.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text(dateFormatter.string(from: spreadTemplate.date ?? Date()))
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Button(action: { removeTemplate(template: spreadTemplate) }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }
                
                // Description
                Text(spreadTemplate.spreadDescription ?? "")
                    .font(.footnote)
            }
            .foregroundColor(Color(.textBackgroundColor))
            .padding()
        }
        .padding()
        .onTapGesture {
            // Show Spread Template
            withAnimation {
                self.selectedSpread = spreadTemplate
                self.showingSpread = true
            }
        }
    }
}

// MARK: - Data Management
private extension SavedTemplateCardView {
    /// This method removes the template from the viewContext.
    /// - Parameter template: SpreadTemplate displayed on this card
    private func removeTemplate(template: SpreadTemplate) {
        withAnimation {
            viewContext.delete(template)
            PersistenceController.shared.save()
        }
    }
}
