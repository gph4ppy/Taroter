//
//  TextFieldAlertViewModel.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 11/01/2022.
//

import SwiftUI

/// A ViewModel used to manage the TextFieldAlert.
final class TextFieldAlertViewModel: ObservableObject {
    @Published var textFieldText: String   = ""
    @Published var textEditorText: String? = ""
    
    var title: String                      { assignAlertData().title }
    var message: String                    { assignAlertData().message }
    var textFieldPlaceholder: String       { assignAlertData().textFieldPlaceholder }
    
    var alertType: AlertType
    
    init(alertType: AlertType) {
        self.alertType = alertType
    }
    
    // The type of alert that affects the content displayed.
    enum AlertType {
        case saving
        case meaning
    }
    
    /// This method returns a tuple that contains the data displayed in the alert.
    /// - Returns: String data contained in a tuple.
    ///            Alert title, alert description, and TextField placeholder.
    private func assignAlertData() -> (title: String, message: String, textFieldPlaceholder: String) {
        switch alertType {
            // Saving Alert Data
            case .saving:
                return (title: LocalizedStrings.saveSpreadTitle,
                        message: LocalizedStrings.saveSpreadMessage,
                        textFieldPlaceholder: LocalizedStrings.saveSpreadPlaceholder)
            
            // Meaning Alert Data
            case .meaning:
                return (title: LocalizedStrings.meaningTitle,
                        message: LocalizedStrings.meaningMessage,
                        textFieldPlaceholder: LocalizedStrings.meaningPlaceholder)
        }
    }
}
