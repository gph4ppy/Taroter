//
//  CardStyle.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 04/02/2022.
//

import SwiftUI

struct TemplateCardModifier<ContextMenu>: ViewModifier where ContextMenu: View {
    var rotationDegrees: Double
    let isEditable: Bool
    let id: UUID
    let contextMenu: () -> ContextMenu
    
    func body(content: Content) -> some View {
        content
            .frame(width: 74.75, height: 124.75)
            .shadow(radius: 5)
            .rotationEffect(.degrees(rotationDegrees))
            .contextMenu { isEditable ? contextMenu() : nil }
            .id(id)
            .disabled(!isEditable)
    }
}

extension View {
    func templateCardStyle<ContextMenu: View>(
        rotationDegrees: Double,
        isEditable: Bool,
        contextMenu: @escaping (() -> ContextMenu),
        id: UUID
    ) -> some View {
        modifier(
            TemplateCardModifier(rotationDegrees: rotationDegrees,
                                 isEditable: isEditable,
                                 id: id,
                                 contextMenu: contextMenu)
        )
    }
}
