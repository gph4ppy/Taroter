//
//  ExpandableView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct ExpandableView<Content>: View where Content: View {
    @Namespace var namespace
    @State private var isExpanded: Bool = false
    let content: () -> Content
    
    var body: some View {
        HStack {
            Spacer()
            
            if isExpanded {
                expandedView
            } else {
                collapsedView
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Methods
private extension ExpandableView {
    /// This method changes the value of a variable `isExpanded` with animation.
    /// - Parameter expandsOnClick: The boolean value assigned to the variable.
    ///                             It tells what state the view will be
    ///                             after tapping it.
    func changeViewExpansionState(expandsOnClick: Bool) {
        withAnimation {
            self.isExpanded = expandsOnClick
        }
    }
}

// MARK: - Views
private extension ExpandableView {
    /// A view shown when it is expanded.
    /// Collapses itself when clicked.
    @ViewBuilder var expandedView: some View {
        // Collapse View Button
        Image(systemName: "chevron.right")
            .foregroundColor(Color(.windowBackgroundColor))
            .background(
                Rectangle()
                    .frame(width: 25, height: 50)
                    .cornerRadius(8)
            )
            .matchedGeometryEffect(id: "arrow", in: namespace)
            .onTapGesture { changeViewExpansionState(expandsOnClick: false) }
            .padding()
        
        // A rectangle with the content inside
        Rectangle()
            .cornerRadius(8)
            .frame(width: 250)
            .overlay(alignment: .top) {
                content()
            }
            .matchedGeometryEffect(id: "backgroundRect", in: namespace)
    }
    
    /// A view shown when it is collapsed.
    /// Expands itself when clicked.
    @ViewBuilder var collapsedView: some View {
        // Expand View Button
        Image(systemName: "chevron.left")
            .matchedGeometryEffect(id: "arrow", in: namespace)
            .foregroundColor(Color(.windowBackgroundColor))
            .background(
                Rectangle()
                    .matchedGeometryEffect(id: "backgroundRect", in: namespace)
                    .frame(width: 25, height: 50)
                    .cornerRadius(8)
                    .shadow(radius: 5)
            )
            .onTapGesture { changeViewExpansionState(expandsOnClick: true) }
            .padding()
    }
}
