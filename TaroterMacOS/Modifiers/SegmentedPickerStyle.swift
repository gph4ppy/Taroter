//
//  SegmentedPickerStyle.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct SegmentedPickerStyle: ViewModifier {
    let isDisabled: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 260)
            .frame(height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
            .shadow(color: Color.primary.opacity(0.3), radius: 4)
            .disabled(isDisabled)
    }
}

extension View {
    func segmentedPickerStyle(isDisabled: Bool) -> some View {
        modifier(SegmentedPickerStyle(isDisabled: isDisabled))
    }
}

