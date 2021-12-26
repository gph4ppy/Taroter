//
//  BlurView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 25/12/2021.
//

import SwiftUI

struct BlurView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
