//
//  SegmentedPickerButton.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SegmentedPickerButton: View {
    @Binding var selectedTab: SpreadTabs
    let title: String
    let selectTabAction: (String) -> SpreadTabs
    
    var body: some View {
        let isSelected = selectedTab.label == title
        
        Button(action: { withAnimation { selectedTab = selectTabAction(title) } }) {
            Text(title)
                .padding()
                .background(
                    Capsule()
                        .fill(isSelected ? Color(.windowBackgroundColor) : Color.gray)
                        .frame(height: 20)
                )
        }
        .buttonStyle(.plain)
        .zIndex(isSelected ? 2 : 0)
    }
}
