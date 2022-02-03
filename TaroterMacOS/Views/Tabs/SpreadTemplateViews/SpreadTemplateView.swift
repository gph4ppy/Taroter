//
//  SpreadTemplateView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

/// This view is used to show the views for selected template tabs.
struct SpreadTemplateView: View {
    @State private var selectedTab: SpreadTabs  = .savedTemplates
    @State private var showingSavingAlert: Bool = false
    
    var body: some View {
        ZStack {
            // View Switch
            switch selectedTab {
                case .savedTemplates: SavedTemplates()
                case .newTemplate: NewSpreadTemplate(selectedTab: $selectedTab,
                                                     showingAlert: $showingSavingAlert)
                default: EmptyView()
            }
            
            // Segmented Custom Tab Picker
            HStack(spacing: -10) {
                // Saved Templates
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.savedTemplates.label,
                                      selectTabAction: selectTab)
                
                // New Template
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.newTemplate.label,
                                      selectTabAction: selectTab)
            }
            .segmentedPickerStyle(isDisabled: showingSavingAlert)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Methods
private extension SpreadTemplateView {
    /// This method converts the provided title to a case of the SpreadTabs enum.
    /// - Parameter title: A [String] title of the selected tab.
    /// - Returns: SpreadTabs enum cases
    func selectTab(title: String) -> SpreadTabs {
        switch title {
            case SpreadTabs.savedTemplates.label: return .savedTemplates
            case SpreadTabs.newTemplate.label: return .newTemplate
            default: return .savedTemplates
        }
    }
}
