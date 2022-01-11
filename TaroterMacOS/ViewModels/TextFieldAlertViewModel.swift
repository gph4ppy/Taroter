//
//  TextFieldAlertViewModel.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 11/01/2022.
//

import SwiftUI

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
    
    enum AlertType {
        case saving
        case meaning
    }
    
    func assignAlertData() -> (title: String, message: String, textFieldPlaceholder: String)  {
        switch alertType {
            case .saving:
                return (title: LocalizedStrings.saveSpreadTitle,
                        message: LocalizedStrings.saveSpreadMessage,
                        textFieldPlaceholder: LocalizedStrings.saveSpreadPlaceholder)
            case .meaning:
                return (title: LocalizedStrings.meaningTitle,
                        message: LocalizedStrings.meaningMessage,
                        textFieldPlaceholder: LocalizedStrings.meaningPlaceholder)
        }
    }
}
