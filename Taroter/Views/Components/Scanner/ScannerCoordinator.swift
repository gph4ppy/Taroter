//
//  ScannerCoordinator.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 22/10/2021.
//

import SwiftUI
import VisionKit
import Vision

class ScannerCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    private var predictionHandlers: [VNRequest: ImagePredictionHandler] = [:]
    private let imageClassifier: VNCoreMLModel                          = createImageClassifier()
    var recognizedImages: Binding<[String]>
    var parent: Scanner
    
    internal init(recognizedImages: Binding<[String]>, parent: Scanner) {
        self.recognizedImages = recognizedImages
        self.parent = parent
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        DispatchQueue.main.async { [self] in
            let extractedImages = extractImages(from: scan)
            recognizeCards(from: extractedImages)
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        self.recognizedImages.wrappedValue.removeAll()
        parent.presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Image Classification
fileprivate extension ScannerCoordinator {
    func extractImages(from scan: VNDocumentCameraScan) -> [CGImage] {
        var extractedImages: [CGImage] = []
        
        for index in 0..<scan.pageCount {
            let extractedImage = scan.imageOfPage(at: index)
            guard let cgImage = extractedImage.cgImage else { continue }
            extractedImages.append(cgImage)
        }
        
        return extractedImages
    }
    
    func recognizeCards(from images: [CGImage]) {
        for image in images {
            let uiImage = UIImage(cgImage: image)
            
            do {
                try makePredictions(for: uiImage, completionHandler: addCardToRecognized)
            } catch {
                print("App couldn't recognize the objects.")
            }
        }
    }
    
    func addCardToRecognized(predictions: [ScannerCoordinator.Prediction]?) {
        if let card = predictions?.first {
            let cardName = card.classification
            
            if !self.recognizedImages.wrappedValue.contains(cardName) {
                print(cardName)
                self.recognizedImages.wrappedValue.append(cardName)
            }
        }
    }
    
    static func createImageClassifier() -> VNCoreMLModel {
        // Use a default model configuration.
        let defaultConfig = MLModelConfiguration()
        
        // Create an instance of the image classifier's wrapper class.
        let wrapper = try? TaroterCardModel(configuration: defaultConfig)
        
        guard let classifier = wrapper else {
            fatalError("App failed to create an image classifier model instance.")
        }
        
        // Get the underlying model instance.
        let classifierModel = classifier.model
        
        // Create a Vision instance using the image classifier's model instance.
        guard let classifierVisionModel = try? VNCoreMLModel(for: classifierModel) else {
            fatalError("App failed to create a `VNCoreMLModel` instance.")
        }
        
        return classifierVisionModel
    }
    
    func visionRequestHandler(_ request: VNRequest, error: Error?) {
        // Remove the caller's handler from the dictionary and keep a reference to it.
        guard let predictionHandler = predictionHandlers.removeValue(forKey: request) else {
            fatalError("Every request must have a prediction handler.")
        }
        
        // Start with a `nil` value in case there's a problem.
        var predictions: [Prediction]? = nil
        
        // Call the client's completion handler after the method returns.
        defer {
            // Send the predictions back to the client.
            predictionHandler(predictions)
        }
        
        // Check for an error first.
        if let error = error {
            print("Vision image classification error...\n\n\(error.localizedDescription)")
            return
        }
        
        // Check that the results aren't `nil`.
        if request.results == nil {
            print("Vision request had no results.")
            return
        }
        
        // Cast the request's results as an `VNClassificationObservation` array.
        guard let observations = request.results as? [VNClassificationObservation] else {
            // Image classifiers, like MobileNet, only produce classification observations.
            // However, other Core ML model types can produce other observations.
            // For example, a style transfer model produces `VNPixelBufferObservation` instances.
            print("VNRequest produced the wrong result type: \(type(of: request.results)).")
            return
        }
        
        // Create a prediction array from the observations.
        predictions = observations.map { observation in
            // Convert each observation into an `ImagePredictor.Prediction` instance.
            return Prediction(classification: observation.identifier)
        }
    }
    
    /// Stores a classification name and confidence for an image classifier's prediction.
    /// - Tag: Prediction
    struct Prediction {
        /// The name of the object the image classifier recognizes in an image.
        let classification: String
    }
    
    /// The function signature the caller must provide as a completion handler.
    typealias ImagePredictionHandler = (_ predictions: [Prediction]?) -> Void
    
    /// Generates a new request instance that uses the Image Predictor's image classifier model.
    private func createImageClassificationRequest() -> VNImageBasedRequest {
        // Create an image classification request with an image classifier model.
        let imageClassificationRequest = VNCoreMLRequest(model: imageClassifier,
                                                         completionHandler: visionRequestHandler)
        
        imageClassificationRequest.imageCropAndScaleOption = .centerCrop
        return imageClassificationRequest
    }
    
    /// Generates an image classification prediction for a photo.
    /// - Parameter photo: An image, typically of an object or a scene.
    /// - Tag: makePredictions
    func makePredictions(for photo: UIImage, completionHandler: @escaping ImagePredictionHandler) throws {
        if let orientation = CGImagePropertyOrientation(rawValue: UInt32(photo.imageOrientation.rawValue)) {
            guard let photoImage = photo.cgImage else {
                fatalError("Photo doesn't have underlying CGImage.")
            }
            
            let imageClassificationRequest = createImageClassificationRequest()
            predictionHandlers[imageClassificationRequest] = completionHandler
            
            let handler = VNImageRequestHandler(cgImage: photoImage, orientation: orientation)
            let requests: [VNRequest] = [imageClassificationRequest]
            
            // Start the image classification request.
            try handler.perform(requests)
        }
    }
}
