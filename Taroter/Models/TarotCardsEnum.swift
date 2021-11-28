//
//  TarotCardsEnum.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 27/10/2021.
//

import Foundation

enum TarotCards: CaseIterable {
    // MARK: Major Arcana
    case fool, magician, highPriestess, empress, emperor, hierophant, lovers, chariot, strength, hermit, wheelOfFortune, justice, hangedMan, death, temperance, devil, tower, star, moon, sun, judgement, world
    
    // MARK: Minor Arcana
    // Wands
    case aceOfWands, twoOfWands, threeOfWands, fourOfWands, fiveOfWands, sixOfWands, sevenOfWands, eightOfWands, nineOfWands, tenOfWands, pageOfWands, knightOfWands, queenOfWands, kingOfWands
    
    // Pentacles
    case aceOfPentacles, twoOfPentacles, threeOfPentacles, fourOfPentacles, fiveOfPentacles, sixOfPentacles, sevenOfPentacles, eightOfPentacles, nineOfPentacles, tenOfPentacles, pageOfPentacles, knightOfPentacles, queenOfPentacles, kingOfPentacles
    
    // Cups
    case aceOfCups, twoOfCups, threeOfCups, fourOfCups, fiveOfCups, sixOfCups, sevenOfCups, eightOfCups, nineOfCups, tenOfCups, pageOfCups, knightOfCups, queenOfCups, kingOfCups
    
    // Swords
    case aceOfSwords, twoOfSwords, threeOfSwords, fourOfSwords, fiveOfSwords, sixOfSwords, sevenOfSwords, eightOfSwords, nineOfSwords, tenOfSwords, pageOfSwords, knightOfSwords, queenOfSwords, kingOfSwords
    
    // Variable that contains informations about each card
    var tarotCard: TarotCard {
        switch self {
            case .fool:
                return TarotCard(name: LocalizedStrings.fool,
                                 imageName: "The Fool",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.foolUpright,
                                 reversedKeywords: LocalizedStrings.foolReversed,
                                 yesOrNo: .yes)
            case .magician:
                return TarotCard(name: LocalizedStrings.magician,
                                 imageName: "The Magician",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.magicianUpright,
                                 reversedKeywords: LocalizedStrings.magicianReversed,
                                 yesOrNo: .yes)
            case .highPriestess:
                return TarotCard(name: LocalizedStrings.highPriestess,
                                 imageName: "The High Priestess",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.highPriestessUpright,
                                 reversedKeywords: LocalizedStrings.highPriestessReversed,
                                 yesOrNo: .maybe)
            case .empress:
                return TarotCard(name: LocalizedStrings.empress,
                                 imageName: "The Empress",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.empressUpright,
                                 reversedKeywords: LocalizedStrings.empressReversed,
                                 yesOrNo: .yes)
            case .emperor:
                return TarotCard(name: LocalizedStrings.emperor,
                                 imageName: "The Emperor",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.emperorUpright,
                                 reversedKeywords: LocalizedStrings.emperorReversed,
                                 yesOrNo: .maybe)
            case .hierophant:
                return TarotCard(name: LocalizedStrings.hierophant,
                                 imageName: "The Hierophant",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hierophantUpright,
                                 reversedKeywords: LocalizedStrings.hierophantReversed,
                                 yesOrNo: .maybe)
            case .lovers:
                return TarotCard(name: LocalizedStrings.lovers,
                                 imageName: "The Lovers",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.loversUpright,
                                 reversedKeywords: LocalizedStrings.loversReversed,
                                 yesOrNo: .yes)
            case .chariot:
                return TarotCard(name: LocalizedStrings.chariot,
                                 imageName: "The Chariot",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.chariotUpright,
                                 reversedKeywords: LocalizedStrings.chariotReversed,
                                 yesOrNo: .yes)
            case .strength:
                return TarotCard(name: LocalizedStrings.strength,
                                 imageName: "Strength",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.strengthUpright,
                                 reversedKeywords: LocalizedStrings.strengthReversed,
                                 yesOrNo: .yes)
            case .hermit:
                return TarotCard(name: LocalizedStrings.hermit,
                                 imageName: "The Hermit",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hermitUpright,
                                 reversedKeywords: LocalizedStrings.hermitReversed,
                                 yesOrNo: .maybe)
            case .wheelOfFortune:
                return TarotCard(name: LocalizedStrings.wheelOfFortune,
                                 imageName: "Wheel Of Fortune",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.wheelOfFortuneUpright,
                                 reversedKeywords: LocalizedStrings.wheelOfFortuneReversed,
                                 yesOrNo: .yes)
            case .justice:
                return TarotCard(name: LocalizedStrings.justice,
                                 imageName: "Justice",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.justiceUpright,
                                 reversedKeywords: LocalizedStrings.justiceReversed,
                                 yesOrNo: .maybe)
            case .hangedMan:
                return TarotCard(name: LocalizedStrings.hangedMan,
                                 imageName: "The Hanged Man",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hangedManUpright,
                                 reversedKeywords: LocalizedStrings.hangedManReversed,
                                 yesOrNo: .maybe)
            case .death:
                return TarotCard(name: LocalizedStrings.death,
                                 imageName: "Death",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.deathUpright,
                                 reversedKeywords: LocalizedStrings.deathReversed,
                                 yesOrNo: .no)
            case .temperance:
                return TarotCard(name: LocalizedStrings.temperance,
                                 imageName: "Temperance",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.temperanceUpright,
                                 reversedKeywords: LocalizedStrings.temperanceReversed,
                                 yesOrNo: .yes)
            case .devil:
                return TarotCard(name: LocalizedStrings.devil,
                                 imageName: "The Devil",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.devilUpright,
                                 reversedKeywords: LocalizedStrings.devilReversed,
                                 yesOrNo: .no)
            case .tower:
                return TarotCard(name: LocalizedStrings.tower,
                                 imageName: "The Tower",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.towerUpright,
                                 reversedKeywords: LocalizedStrings.towerReversed,
                                 yesOrNo: .no)
            case .star:
                return TarotCard(name: LocalizedStrings.star,
                                 imageName: "The Star",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.starUpright,
                                 reversedKeywords: LocalizedStrings.starReversed,
                                 yesOrNo: .yes)
            case .moon:
                return TarotCard(name: LocalizedStrings.moon,
                                 imageName: "The Moon",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.moonUpright,
                                 reversedKeywords: LocalizedStrings.moonReversed,
                                 yesOrNo: .no)
            case .sun:
                return TarotCard(name: LocalizedStrings.sun,
                                 imageName: "The Sun",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.sunUpright,
                                 reversedKeywords: LocalizedStrings.sunReversed,
                                 yesOrNo: .yes)
            case .judgement:
                return TarotCard(name: LocalizedStrings.judgement,
                                 imageName: "Judgement",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.judgementUpright,
                                 reversedKeywords: LocalizedStrings.judgementReversed,
                                 yesOrNo: .yes)
            case .world:
                return TarotCard(name: LocalizedStrings.world,
                                 imageName: "The World",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.worldUpright,
                                 reversedKeywords: LocalizedStrings.worldReversed,
                                 yesOrNo: .yes)
            case .aceOfWands:
                return TarotCard(name: LocalizedStrings.aceOfWands,
                                 imageName: "Ace of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfWandsReversed,
                                 yesOrNo: .yes)
            case .twoOfWands:
                return TarotCard(name: LocalizedStrings.twoOfWands,
                                 imageName: "Two of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfWandsReversed,
                                 yesOrNo: .yes)
            case .threeOfWands:
                return TarotCard(name: LocalizedStrings.threeOfWands,
                                 imageName: "Three of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfWandsReversed,
                                 yesOrNo: .yes)
            case .fourOfWands:
                return TarotCard(name: LocalizedStrings.fourOfWands,
                                 imageName: "Four of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfWandsReversed,
                                 yesOrNo: .yes)
            case .fiveOfWands:
                return TarotCard(name: LocalizedStrings.fiveOfWands,
                                 imageName: "Five of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfWandsReversed,
                                 yesOrNo: .no)
            case .sixOfWands:
                return TarotCard(name: LocalizedStrings.sixOfWands,
                                 imageName: "Six of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfWandsReversed,
                                 yesOrNo: .yes)
            case .sevenOfWands:
                return TarotCard(name: LocalizedStrings.sevenOfWands,
                                 imageName: "Seven of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfWandsReversed,
                                 yesOrNo: .no)
            case .eightOfWands:
                return TarotCard(name: LocalizedStrings.eightOfWands,
                                 imageName: "Eight of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfWandsReversed,
                                 yesOrNo: .yes)
            case .nineOfWands:
                return TarotCard(name: LocalizedStrings.nineOfWands,
                                 imageName: "Nine of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfWandsReversed,
                                 yesOrNo: .yes)
            case .tenOfWands:
                return TarotCard(name: LocalizedStrings.tenOfWands,
                                 imageName: "Ten of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfWandsReversed,
                                 yesOrNo: .no)
            case .pageOfWands:
                return TarotCard(name: LocalizedStrings.pageOfWands,
                                 imageName: "Page of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfWandsReversed,
                                 yesOrNo: .yes)
            case .knightOfWands:
                return TarotCard(name: LocalizedStrings.knightOfWands,
                                 imageName: "Knight of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfWandsReversed,
                                 yesOrNo: .yes)
            case .queenOfWands:
                return TarotCard(name: LocalizedStrings.queenOfWands,
                                 imageName: "Queen of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfWandsReversed,
                                 yesOrNo: .yes)
            case .kingOfWands:
                return TarotCard(name: LocalizedStrings.kingOfWands,
                                 imageName: "King of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfWandsReversed,
                                 yesOrNo: .yes)
            case .aceOfPentacles:
                return TarotCard(name: LocalizedStrings.aceOfPentacles,
                                 imageName: "Ace of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.aceOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .twoOfPentacles:
                return TarotCard(name: LocalizedStrings.twoOfPentacles,
                                 imageName: "Two of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.twoOfPentaclesReversed,
                                 yesOrNo: .maybe)
            case .threeOfPentacles:
                return TarotCard(name: LocalizedStrings.threeOfPentacles,
                                 imageName: "Three of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.threeOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .fourOfPentacles:
                return TarotCard(name: LocalizedStrings.fourOfPentacles,
                                 imageName: "Four of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.fourOfPentaclesReversed,
                                 yesOrNo: .no)
            case .fiveOfPentacles:
                return TarotCard(name: LocalizedStrings.fiveOfPentacles,
                                 imageName: "Five of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfPentaclesReversed,
                                 yesOrNo: .no)
            case .sixOfPentacles:
                return TarotCard(name: LocalizedStrings.sixOfPentacles,
                                 imageName: "Six of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.sixOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .sevenOfPentacles:
                return TarotCard(name: LocalizedStrings.sevenOfPentacles,
                                 imageName: "Seven of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfPentaclesReversed,
                                 yesOrNo: .maybe)
            case .eightOfPentacles:
                return TarotCard(name: LocalizedStrings.eightOfPentacles,
                                 imageName: "Eight of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.eightOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .nineOfPentacles:
                return TarotCard(name: LocalizedStrings.nineOfPentacles,
                                 imageName: "Nine of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.nineOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .tenOfPentacles:
                return TarotCard(name: LocalizedStrings.tenOfPentacles,
                                 imageName: "Ten of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.tenOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .pageOfPentacles:
                return TarotCard(name: LocalizedStrings.pageOfPentacles,
                                 imageName: "Page of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.pageOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .knightOfPentacles:
                return TarotCard(name: LocalizedStrings.knightOfPentacles,
                                 imageName: "Knight of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.knightOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .queenOfPentacles:
                return TarotCard(name: LocalizedStrings.queenOfPentacles,
                                 imageName: "Queen of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.queenOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .kingOfPentacles:
                return TarotCard(name: LocalizedStrings.kingOfPentacles,
                                 imageName: "King of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.kingOfPentaclesReversed,
                                 yesOrNo: .yes)
            case .aceOfCups:
                return TarotCard(name: LocalizedStrings.aceOfCups,
                                 imageName: "Ace of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfCupsReversed,
                                 yesOrNo: .yes)
            case .twoOfCups:
                return TarotCard(name: LocalizedStrings.twoOfCups,
                                 imageName: "Two of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfCupsReversed,
                                 yesOrNo: .yes)
            case .threeOfCups:
                return TarotCard(name: LocalizedStrings.threeOfCups,
                                 imageName: "Three of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfCupsReversed,
                                 yesOrNo: .yes)
            case .fourOfCups:
                return TarotCard(name: LocalizedStrings.fourOfCups,
                                 imageName: "Four of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfCupsReversed,
                                 yesOrNo: .maybe)
            case .fiveOfCups:
                return TarotCard(name: LocalizedStrings.fiveOfCups,
                                 imageName: "Five of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfCupsReversed,
                                 yesOrNo: .no)
            case .sixOfCups:
                return TarotCard(name: LocalizedStrings.sixOfCups,
                                 imageName: "Six of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfCupsReversed,
                                 yesOrNo: .yes)
            case .sevenOfCups:
                return TarotCard(name: LocalizedStrings.sevenOfCups,
                                 imageName: "Seven of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfCupsReversed,
                                 yesOrNo: .maybe)
            case .eightOfCups:
                return TarotCard(name: LocalizedStrings.eightOfCups,
                                 imageName: "Eight of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfCupsReversed,
                                 yesOrNo: .no)
            case .nineOfCups:
                return TarotCard(name: LocalizedStrings.nineOfCups,
                                 imageName: "Nine of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfCupsReversed,
                                 yesOrNo: .yes)
            case .tenOfCups:
                return TarotCard(name: LocalizedStrings.tenOfCups,
                                 imageName: "Ten of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfCupsReversed,
                                 yesOrNo: .yes)
            case .pageOfCups:
                return TarotCard(name: LocalizedStrings.pageOfCups,
                                 imageName: "Page of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfCupsReversed,
                                 yesOrNo: .yes)
            case .knightOfCups:
                return TarotCard(name: LocalizedStrings.knightOfCups,
                                 imageName: "Knight of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfCupsReversed,
                                 yesOrNo: .yes)
            case .queenOfCups:
                return TarotCard(name: LocalizedStrings.queenOfCups,
                                 imageName: "Queen of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfCupsReversed,
                                 yesOrNo: .yes)
            case .kingOfCups:
                return TarotCard(name: LocalizedStrings.kingOfCups,
                                 imageName: "King of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfCupsReversed,
                                 yesOrNo: .yes)
            case .aceOfSwords:
                return TarotCard(name: LocalizedStrings.aceOfSwords,
                                 imageName: "Ace of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfSwordsReversed,
                                 yesOrNo: .no)
            case .twoOfSwords:
                return TarotCard(name: LocalizedStrings.twoOfSwords,
                                 imageName: "Two of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfSwordsReversed,
                                 yesOrNo: .maybe)
            case .threeOfSwords:
                return TarotCard(name: LocalizedStrings.threeOfSwords,
                                 imageName: "Three of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfSwordsReversed,
                                 yesOrNo: .no)
            case .fourOfSwords:
                return TarotCard(name: LocalizedStrings.fourOfSwords,
                                 imageName: "Four of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfSwordsReversed,
                                 yesOrNo: .maybe)
            case .fiveOfSwords:
                return TarotCard(name: LocalizedStrings.fiveOfSwords,
                                 imageName: "Five of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfSwordsReversed,
                                 yesOrNo: .no)
            case .sixOfSwords:
                return TarotCard(name: LocalizedStrings.sixOfSwords,
                                 imageName: "Six of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfSwordsReversed,
                                 yesOrNo: .maybe)
            case .sevenOfSwords:
                return TarotCard(name: LocalizedStrings.sevenOfSwords,
                                 imageName: "Seven of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfSwordsReversed,
                                 yesOrNo: .no)
            case .eightOfSwords:
                return TarotCard(name: LocalizedStrings.eightOfSwords,
                                 imageName: "Eight of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfSwordsReversed,
                                 yesOrNo: .no)
            case .nineOfSwords:
                return TarotCard(name: LocalizedStrings.nineOfSwords,
                                 imageName: "Nine of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfSwordsReversed,
                                 yesOrNo: .no)
            case .tenOfSwords:
                return TarotCard(name: LocalizedStrings.tenOfSwords,
                                 imageName: "Ten of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfSwordsReversed,
                                 yesOrNo: .no)
            case .pageOfSwords:
                return TarotCard(name: LocalizedStrings.pageOfSwords,
                                 imageName: "Page of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfSwordsReversed,
                                 yesOrNo: .yes)
            case .knightOfSwords:
                return TarotCard(name: LocalizedStrings.knightOfSwords,
                                 imageName: "Knight of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfSwordsReversed,
                                 yesOrNo: .yes)
            case .queenOfSwords:
                return TarotCard(name: LocalizedStrings.queenOfSwords,
                                 imageName: "Queen of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfSwordsReversed,
                                 yesOrNo: .maybe)
            case .kingOfSwords:
                return TarotCard(name: LocalizedStrings.kingOfSwords,
                                 imageName: "King of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfSwordsReversed,
                                 yesOrNo: .maybe)
        }
    }
}
