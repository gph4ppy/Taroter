//
//  ListBuilder.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/12/2021.
//

import SwiftUI

/// This structure is used to create views in List.
struct ListBuilder {
    /// This method creates a list row with data.
    /// - Parameters:
    ///   - title: The title of the information provided on the row
    ///   - data: Card data related to the title of the row
    /// - Returns: List row
    @ViewBuilder public static func createRow(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    /// This method creates a column with card keywords.
    /// - Parameters:
    ///   - title: The title of the card orientation provided on the column [Upright/Reversed]
    ///   - data: Card keywords related to the title of the column (card orientation)
    /// - Returns: A column in the list row
    @ViewBuilder public static func createColumn(title: String, data: String) -> some View {
        VStack(alignment: .center) {
            Text(title)
                .bold()
                .padding(.vertical)
            
            Text(data)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .font(.footnote)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
