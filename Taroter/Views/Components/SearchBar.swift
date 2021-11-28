//
//  SearchBar.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 05/11/2021.
//

import SwiftUI

/// A view used to filter the content of the array.
/// Searches for items containing the specified text.
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemGray5))
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(LocalizedStrings.search, text: $text)
                    .disableAutocorrection(true)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
