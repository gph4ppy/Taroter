//
//  SavedSpreadCardView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 03/02/2022.
//

import SwiftUI

/// A view showing basic data about the saved spread template.
struct SavedSpreadCardView: View {
    var savedSpread: TarotSpreads
    @Binding var showingSpread: Bool
    @Binding var selectedSpread: TarotSpreads?
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
                    Text(savedSpread.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text(dateFormatter.string(from: savedSpread.date ?? Date()))
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Button(action: { removeTemplate(template: savedSpread) }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }
                
                // Description
                Text(savedSpread.spreadDescription ?? "")
                    .font(.footnote)
            }
            .foregroundColor(Color(.textBackgroundColor))
            .padding()
        }
        .padding()
        .onTapGesture {
            // Show Spread Template
            withAnimation {
                self.selectedSpread = savedSpread
                self.showingSpread = true
            }
        }
    }
}

// MARK: - Data Management
private extension SavedSpreadCardView {
    /// This method removes the template from the viewContext.
    /// - Parameter template: SpreadTemplate displayed on this card
    private func removeTemplate(template: TarotSpreads) {
        withAnimation {
            viewContext.delete(template)
            PersistenceController.shared.save()
        }
    }
}

