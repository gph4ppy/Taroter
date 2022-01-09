//
//  CreateSpreadView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct CreateSpreadView: View {
    @State private var selectedTab: SpreadTabs  = .savedSpreads
    @State private var showingSavingAlert: Bool = false
    
    var body: some View {
        ZStack {
            // View Switch
            switch selectedTab {
                case .savedSpreads: EmptyView()
                case .newSpread: NewSpreadView()
                default: EmptyView()
            }
            
            // Segmented Custom Tab Picker
            HStack(spacing: -10) {
                // Saved Templates
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.savedSpreads.label,
                                      selectTabAction: selectTab)
                
                // New Template
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.newSpread.label,
                                      selectTabAction: selectTab)
            }
            .segmentedPickerStyle(isDisabled: showingSavingAlert)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Methods
private extension CreateSpreadView {
    func selectTab(title: String) -> SpreadTabs {
        switch title {
            case SpreadTabs.savedSpreads.label: return .savedSpreads
            case SpreadTabs.newSpread.label: return .newSpread
            default: return .savedSpreads
        }
    }
}

