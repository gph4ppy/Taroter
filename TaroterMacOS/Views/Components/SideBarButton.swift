//
//  SideBarButton.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 25/12/2021.
//

import SwiftUI

// Part of the SideBar - a button used to select the currently displayed view.
struct SideBarButton: View {
    let title: String
    let systemImage: String
    @Binding var selectedTab: Tabs
    var isSelected: Bool { title == selectedTab.label }
    
    var body: some View {
        Button(action: assignTab) {
            Label(title, systemImage: systemImage)
                .sideBarButtonStyle(isSelected: isSelected)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Methods
private extension SideBarButton {
    /// This method assigns the selected tab based on the title of the tapped button.
    func assignTab() {
        withAnimation {
            selectedTab = selectTab()
        }
    }
    
    /// This method determines the selected tab based on the title of the tapped button.
    /// - Returns: Tabs [enum] case of the selected tab
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
