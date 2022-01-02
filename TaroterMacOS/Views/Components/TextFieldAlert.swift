//
//  TextFieldAlert.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 29/12/2021.
//

import SwiftUI

struct TextFieldAlert: View {
    let title: String
    let message: String?
    @Binding var text: String
    @Binding var spreadDescription: String?
    @Binding var isPresented: Bool
    let alertType: AlertType
    let doneButtonAction: () -> ()
    
    enum AlertType {
        case saving
        case meaning
    }
    
    var body: some View {
        VStack {
            Text(title).bold()
            Text(message ?? "")
            
            TextField(alertType == .saving ? "Title" : "Card meaning or question...",
                      text: $text)
                .textFieldStyle(.roundedBorder)
            
            if let spreadDescription = Binding($spreadDescription), alertType == .saving {
                Text("Description").padding(.top)
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
