//
//  SideBarButton.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 25/12/2021.
//

import SwiftUI

struct SideBarButton: View {
    let title: String
    let systemImage: String
    @Binding var selectedTab: String
    
    var body: some View {
        let isSelected: Bool = title == selectedTab
        
        Button(action: { withAnimation { selectedTab = title } }) {
            Label(title, systemImage: systemImage)
                .sideBarButtonStyle(isSelected: isSelected)
        }
        .buttonStyle(.plain)
    }
}
