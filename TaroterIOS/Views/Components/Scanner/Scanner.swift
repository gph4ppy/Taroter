//
//  Scanner.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/10/2021.
//

import SwiftUI
import VisionKit

/// A view that includes the card scanner.
struct Scanner: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var recognizedImages: [String]
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentVC = VNDocumentCameraViewController()
        documentVC.delegate = context.coordinator
        return documentVC
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    func makeCoordinator() -> ScannerCoordinator {
        ScannerCoordinator(recognizedImages: $recognizedImages, parent: self)
    }
}
