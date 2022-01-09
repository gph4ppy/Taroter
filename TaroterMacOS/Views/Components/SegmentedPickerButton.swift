//
//  SegmentedPickerButton.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

// A button that is part of a custom segmented picker.
struct SegmentedPickerButton: View {
    @Binding var selectedTab: SpreadTabs
    let title: String
    let selectTabAction: (String) -> SpreadTabs
    var isSelected: Bool { selectedTab.label == title }
    
    var body: some View {
        Button(action: selectTab) {
            Text(title)
                .padding()
                .background(capsuleBackground)
        }
        .buttonStyle(.plain)
        .zIndex(isSelected ? 2 : 0)
    }
}

// MARK: - Methods
private extension SegmentedPickerButton {
    /// This method performs an action based on the title
    /// and assigns the return value to the variable
    /// holding the selected tab.
    func selectTab() {
        withAnimation {
            self.selectedTab = self.selectTabAction(title)
        }
    }
}

// MARK: - Views
private extension SegmentedPickerButton {
    /// A capsule that changes color when a tab is selected.
    var capsuleBackground: some View {
        Capsule()
            .fill(isSelected ? Color(.windowBackgroundColor) : Color.gray)
            .frame(height: 20)
    }
}
