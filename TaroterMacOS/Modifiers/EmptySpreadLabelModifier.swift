//
//  EmptySpreadLabelModifier.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 06/02/2022.
//

import SwiftUI

/// This modifier configures the style for the label informing that
/// the user does not have any saved spreads.
struct EmptySpreadLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .padding()
            .frame(maxHeight: .infinity, alignment: .center)
    }
}

extension Text {
    func emptySpreadLabel() -> some View {
        self
            .font(.title3)
            .fontWeight(.semibold)
            .modifier(EmptySpreadLabelModifier())
    }
}
