//
//  CardViewManager.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 06/02/2022.
//

import SwiftUI

/// This protocol is responsible for the functions that manage the layout of the card.
protocol CardViewManager {
    // MARK: - Card Rotation
    func rotateCard(degrees: Double, viewModel: Any?, card index: Int, completionHandler: () -> ())
    func rotationButtons(rotateAction: @escaping (Double) -> ()) -> AnyView
    func createRotationButton(degrees: Double, rotateAction: @escaping (Double) -> ()) -> AnyView
    
    // MARK: - Card Position
    func relocateCard(value: DragGesture.Value) -> Void
    func saveCardPosition(value: DragGesture.Value) -> Void
}

// MARK: - Card Rotation
extension CardViewManager {
    /// This function is responsible for rotating the card.
    /// - Parameters:
    ///   - degrees: The degrees by which the card is to be rotated
    ///              * `degrees >= 0` - the card is rotated clockwise (right)
    ///              * `degrees < 0` - the card is rotated counterclockwise (left)
    ///   - viewModel: TarotCardViewModel or TemplateCardViewModel
    ///   - index: Index of the card to be rotated.
    ///   - completionHandler: The action that is performed after updating the
    ///                        rotationDegrees of the card, usually is a visual
    ///                        representation of the rotation.
    func rotateCard(degrees: Double, viewModel: Any?, card index: Int, completionHandler: () -> ()) {
        withAnimation {
            // Check if the Tarot card was given as an parameter
            if let viewModel = viewModel as? TarotCardViewModel {
                // Then flip that Tarot card over
                viewModel.cards[index].rotationDegrees += degrees
                
                // Rotate the displayed card
                completionHandler()
            }
            // Check if the Template card was given as an parameter
            else if let viewModel = viewModel as? TemplateCardViewModel {
                // Then flip that Template card over
                viewModel.cards[index].rotationDegrees += degrees
                
                // Rotate the displayed card
                completionHandler()
            }
        }
    }
    
    /// This function creates the card rotation buttons shown in the ContextMenu.
    /// - Parameter rotateAction: The action that is performed after updating the
    ///                           rotationDegrees of the card, usually is a visual
    ///                           representation of the rotation.
    /// - Returns: AnyView of rotation buttons, which will be presented in the Context View.
    func rotationButtons(rotateAction: @escaping (Double) -> ()) -> AnyView {
        return AnyView(
            VStack {
                // 15°
                createRotationButton(degrees: 15, rotateAction: rotateAction)   // < right
                createRotationButton(degrees: -15, rotateAction: rotateAction) // < left
                
                // 45°
                createRotationButton(degrees: 45, rotateAction: rotateAction)   // < right
                createRotationButton(degrees: -45, rotateAction: rotateAction) // < left
                
                // 90°
                createRotationButton(degrees: 90, rotateAction: rotateAction)   // < right
                createRotationButton(degrees: -90, rotateAction: rotateAction) // < left
            }
        )
    }
    
    /// This function creates the card rotation button shown in the ContextMenu.
    /// - Parameters:
    ///   - degrees: The degrees by which the card is to be rotated
    ///   - rotateAction: The action that is performed after updating the
    ///                   rotationDegrees of the card, usually is a visual
    ///                   representation of the rotation.
    /// - Returns: AnyView of rotation button, which will be presented in the Context View.
    func createRotationButton(degrees: Double, rotateAction: @escaping (Double) -> ()) -> AnyView {
        let isAddition: Bool = degrees >= 0
        let direction: String = isAddition ? LocalizedStrings.right : LocalizedStrings.left
        
        return AnyView(
            Button(action: { rotateAction(degrees) }) {
                Text("\(LocalizedStrings.rotate) \(Int(abs(degrees)))° \(direction)")
                Image(systemName: isAddition ? "rotate.right.fill" : "rotate.left.fill")
            }
        )
    }
}
