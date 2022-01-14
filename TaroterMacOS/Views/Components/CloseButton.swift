//
//  CloseButton.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 04/01/2022.
//

import SwiftUI

/// A button used to close the parent view.
struct CloseButton: View {
    let action: () -> ()
    
    var body: some View {
        Button(action: { withAnimation(.default, action) }) {
            Image(systemName: "xmark")
                .padding()
        }
        .buttonStyle(.plain)
    }
}
