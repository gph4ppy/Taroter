//
//  MainButtonStyle.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A modifier used for the style of the main buttons.
struct MainButtonStyle: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.title3.bold())
            .frame(width: UIScreen.main.bounds.width - 40, height: 58)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func mainButtonStyle(cornerRadius: CGFloat) -> some View {
        self.modifier(MainButtonStyle(cornerRadius: cornerRadius))
    }
}
