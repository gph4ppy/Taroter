//
//  BlurView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 25/12/2021.
//

import SwiftUI

// A view that blends and blurs with the content behind the window.
struct BlurView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
