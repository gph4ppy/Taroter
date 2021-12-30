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
    @Binding var isPresented: Bool
    let doneButtonAction: () -> ()
    
    var body: some View {
        VStack {
            Text(title).bold()
            Text(message ?? "")
            
            TextField("Card meaning or question...",
                      text: $text)
                .textFieldStyle(.roundedBorder)
            
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
