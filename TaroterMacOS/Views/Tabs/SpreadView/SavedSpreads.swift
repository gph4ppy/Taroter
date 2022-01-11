//
//  SavedSpreads.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 10/01/2022.
//

import SwiftUI

struct SavedSpreads: View {
    @State private var showingSpread: Bool = false
    @State private var selectedSpread: TarotSpreads?
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
    ) private var spreads: FetchedResults<TarotSpreads>
    
    var body: some View {
        ZStack {
            // Templates List
            ScrollView {
                LazyVStack(spacing: 14,
                           content: createTemplatesList)
            }
            .padding(.top, 30)
            
            // Saved Template
            if let spreadCards = selectedSpread?.tarotSpreadCards, showingSpread {
                Text("\(spreadCards)")
            }
        }
    }
}

// MARK: - Data Management
private extension SavedSpreads {
    private func removeSpread(spread: TarotSpreads) {
        withAnimation {
            viewContext.delete(spread)
            PersistenceController.shared.save()
        }
    }
}

// MARK: - Views
private extension SavedSpreads {
    @ViewBuilder func createTemplatesList() -> some View {
        ForEach(spreads, id: \.self) { spread in
            HStack {
                Text(spread.title ?? "").bold()
                Spacer()
                Text(dateFormatter.string(from: spread.date ?? Date()))
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
                Button(action: { print("REMOVE!!") }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
            }
            .onTapGesture {
                withAnimation {
                    self.selectedSpread = spread
                    self.showingSpread = true
                }
            }
        }
    }
}
