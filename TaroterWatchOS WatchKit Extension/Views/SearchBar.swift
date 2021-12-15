//
//  SearchBar.swift
//  TaroterWatchOS WatchKit Extension
//
//  Created by Jakub Dąbrowski on 14/12/2021.
//

import SwiftUI

/// A view used to filter the content of the array.
/// Searches for items containing the specified text.
struct SearchBar: View {
    @Binding var text: String
    
    // SearchBar Body
    var body: some View {
        TextField(LocalizedStrings.search, text: $text)
            .overlay(
                !text.isEmpty ? clearButton : nil
            )
    }
    
    // Clear Button
    var clearButton: some View {
        Image(systemName: "x.circle")
            .foregroundColor(.accentColor)
            .font(.title3)
            .onTapGesture { text = "" }
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
