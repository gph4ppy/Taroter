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
    let doneButtonAction:          () -> ()
    
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
                Text("Description")
                    .padding(.top)
                
                TextEditor(text: spreadDescription)
                    .cornerRadius(12)
                    .shadow(color: Color.primary.opacity(0.3), radius: 1, x: 0, y: 1)
                    .frame(maxHeight: 150)
            }
            
            Divider()
            
            HStack {
                Button(action: doneButtonAction) {
                    Text("Done")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Divider()
                
                Button(action: {
                    withAnimation {
                        self.isPresented = false
                    }
                }) {
                    Text("Cancel")
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .foregroundColor(.blue)
            .buttonStyle(.plain)
            .frame(maxHeight: 44)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(NSColor.windowBackgroundColor))
                .shadow(radius: 2)
        )
        .padding()
        .transition(.scale(scale: 0.25, anchor: .center))
        .zIndex(1)
    }
}
