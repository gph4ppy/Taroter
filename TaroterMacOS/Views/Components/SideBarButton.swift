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
    @Binding var selectedTab: Tabs
    
    var body: some View {
        let isSelected: Bool = title == selectedTab.label
        
        Button(action: { withAnimation { selectedTab = selectTab() } }) {
            Label(title, systemImage: systemImage)
                .sideBarButtonStyle(isSelected: isSelected)
        }
        .buttonStyle(.plain)
    }
    
    func selectTab() -> Tabs {
        switch title {
            // Cards
            case Tabs.allCards.label: return .allCards
            case Tabs.major.label: return .major
            case Tabs.minor.label: return .minor
            
            // Spreads
            case Tabs.templates.label: return .templates
            case Tabs.yourSpreads.label: return .yourSpreads
            default: return .allCards
        }
    }
}
