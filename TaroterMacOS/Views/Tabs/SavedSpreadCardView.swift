//
//  SavedSpreadCardView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 03/02/2022.
//

import SwiftUI

/// A view showing basic data about the saved spread.
struct SavedSpreadCardView: View {
    let title: String
    let description: String
    let date: Date
    let onTapAction: () -> ()
    let deleteAction: () -> ()
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
                HStack(spacing: 10) {
                    // Title
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    // Date String
                    Text(dateFormatter.string(from: date))
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    // Delete Saved Spread/Template Button
                    Button(action: deleteAction) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }
                
                // Description
                Text(description)
                    .font(.footnote)
            }
            .foregroundColor(Color(.textBackgroundColor))
            .padding()
        }
        .padding()
        .onTapGesture(perform: onTapAction)
    }
}
