//
//  TarotCardModel.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 27/10/2021.
//

import Foundation

struct TarotCard {
    // Data
    let name: String
    let imageName: String
    let arcana: Arcana
    
    // Keywords
    let neutralKeywords: String
    let uprightKeywords: String
    let reversedKeywords: String
    let yesOrNo: TarotBoolean
}
