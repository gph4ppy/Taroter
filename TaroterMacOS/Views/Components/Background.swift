//
//  Background.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 14/01/2022.
//

import SwiftUI

/// The background of the views (mostly representing the data) appearing in ZStack.
struct Background: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        // I couldn't find the color that matched the background (in dark mode),
        // NSColor.underPageBackgroundColor didn't work either,
        // so I used an empty list.
        // Modern problems require modern solutions. ¯\_(ツ)_/¯
        colorScheme == .dark ? AnyView(List{}) : AnyView(Color(.windowBackgroundColor))
    }
}
