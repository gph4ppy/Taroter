//
//  ScannerCoordinator.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/10/2021.
//

import SwiftUI
import VisionKit
import Vision

/// A class that delegates the work of the Scanner.
class ScannerCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    var recognizedImages: Binding<[String]>
    var parent: Scanner
    
    internal init(recognizedImages: Binding<[String]>, parent: Scanner) {
        self.recognizedImages = recognizedImages
        self.parent = parent
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        let extractedImages = extractImages(from: scan)
        recognizeCards(from: extractedImages)
        parent.presentationMode.wrappedValue.dismiss()
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        parent.presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Image Classification
fileprivate extension ScannerCoordinator {
    /// This method extracts up the scans, creates CGImages from them
    /// and appends them into the array that is returned.
    /// - Parameter scan: A document scanned in the document camera
    /// - Returns: An array of scanned cards as CGImages
    func extractImages(from scan: VNDocumentCameraScan) -> [CGImage] {
        var extractedImages: [CGImage] = []
        
        for index in 0..<scan.pageCount {
            let extractedImage = scan.imageOfPage(at: index)
            guard let cgImage = extractedImage.cgImage else { continue }
            extractedImages.append(cgImage)
        }
        
        return extractedImages
    }
    
    /// This method recognizes each card in the table.
    /// - Parameter images: An array of scanned cards as CGImage
    func recognizeCards(from images: [CGImage]) {
        for image in images {
            let ciImage = CIImage(cgImage: image)
            makePredictions(for: ciImage)
        }
    }
    
    /// This method makes predictions for the passed image.
    /// - Parameter photo: Photo of the scanned card
    func makePredictions(for photo: CIImage) {
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            // Get the results and select the most likely one
            let results = getMLReults(photo: photo)
            guard let card = results.first?.identifier else { return }
            
            // If the array doesn't contain the card, append it to it.
            if !recognizedImages.wrappedValue.contains(card) {
                recognizedImages.wrappedValue.append(card)
            }
        }
    }
    
    /// This method creates a model, performs the analysis
    /// and returns an array of data about the recognized scan
    /// - Parameter photo: Photo of the scanned card
    /// - Returns: An array of image classification information from the analysis
    func getMLReults(photo: CIImage) -> [VNClassificationObservation] {
        let configuration = MLModelConfiguration()
        
        // Create model
        if let imageClassifier = try? TaroterCardModel(configuration: configuration),
           let model = try? VNCoreMLModel(for: imageClassifier.model) {
            let request = VNCoreMLRequest(model: model)
            let handler = VNImageRequestHandler(ciImage: photo, options: [:])
            try? handler.perform([request])
            
            // Get results
            guard let results = request.results as? [VNClassificationObservation] else {
                return [VNClassificationObservation]()
            }
            
            return results
        }
        
        return [VNClassificationObservation]()
    }
}
