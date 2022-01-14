//
//  TextFieldAlert.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 29/12/2021.
//

import SwiftUI

struct TextFieldAlert: View {
    @ObservedObject var viewModel: TextFieldAlertViewModel
    @Binding var isPresented:      Bool
    let saveAction:                () -> ()
    
    var body: some View {
        VStack {
            // Alert tile and description
            Text(viewModel.title).bold()
            Text(viewModel.message)
            
            // TextField
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.textFieldText)
                .textFieldStyle(.roundedBorder)
            
            // TextEditor
            if let spreadDescription = Binding($viewModel.textEditorText),
               viewModel.alertType == .saving {
                descriptionView(text: spreadDescription)
            }
            
            Divider()
            
            // Buttons HStack
            buttons
        }
        .padding()
        .background(background)
        .padding()
        .transition(.scale(scale: 0.25, anchor: .center))
        .zIndex(1)
    }
}

// MARK: - Views
private extension TextFieldAlert {
    /// Alert background.
    var background: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(NSColor.windowBackgroundColor))
            .shadow(radius: 2)
    }
    
    /// Save and Cancel Buttons
    var buttons: some View {
        HStack {
            // Save Button
            Button(action: saveAction) {
                Text(LocalizedStrings.save)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Divider()
            
            // Cancel Button
            Button(action: { withAnimation { self.isPresented = false } }) {
                Text(LocalizedStrings.cancel)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .buttonStyle(.plain)
        .foregroundColor(.blue)
        .frame(maxHeight: 44)
    }
    
    /// A TextEditor and a label above it.
    /// - Parameter text: A Binding to the variable containing
    ///                   the description text to edit.
    /// - Returns: A view consisting of TextEditor and Text above it.
    @ViewBuilder func descriptionView(text: Binding<String>) -> some View {
        Text(LocalizedStrings.description)
            .padding(.top)
        
        TextEditor(text: text)
            .cornerRadius(12)
            .shadow(color: Color.primary.opacity(0.3), radius: 1, x: 0, y: 1)
            .frame(maxHeight: 150)
    }
}
