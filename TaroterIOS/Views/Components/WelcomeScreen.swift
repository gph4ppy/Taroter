//
//  WelcomeScreen.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

/// A view displayed in Welcome View.
struct WelcomeScreen: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 10) {
            // Image
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 150)
                .foregroundColor(.accentColor)
            
            // Title
            Text(title)
                .font(.title)
                .bold()
            
            // Description
            Text(description)
                .multilineTextAlignment(.center)
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 40)
    }
}

