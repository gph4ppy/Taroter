//
//  ExpandableView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 05/01/2022.
//

import SwiftUI

struct ExpandableView<Content>: View where Content: View{
    @Namespace var namespace
    @State private var isShown: Bool = false
    let content: () -> Content
    
    var body: some View {
        HStack {
            Spacer()
            
            if isShown {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.windowBackgroundColor))
                    .background(
                        Rectangle()
                            .frame(width: 25, height: 50)
                            .cornerRadius(8)
                    )
                    .matchedGeometryEffect(id: "arrow", in: namespace)
                    .onTapGesture {
                        withAnimation {
                            self.isShown = false
                        }
                    }
                    .padding()
                
                Rectangle()
                    .cornerRadius(8)
                    .frame(width: 250)
                    .overlay(alignment: .top) {
                        content()
                    }
                    .matchedGeometryEffect(id: "backgroundRect", in: namespace)
            } else {
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
                    .onTapGesture {
                        withAnimation {
                            self.isShown = true
                        }
                    }
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
    }
}


