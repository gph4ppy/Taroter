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
                                 neutralKeywords: LocalizedStrings.foolNeutral,
                                 uprightKeywords: LocalizedStrings.foolPositive,
                                 reversedKeywords: LocalizedStrings.foolNegative,
                                 yesOrNo: .yes)
            case .magician:
                return TarotCard(name: LocalizedStrings.magician,
                                 imageName: "The Magician",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.magicianNeutral,
                                 uprightKeywords: LocalizedStrings.magicianPositive,
                                 reversedKeywords: LocalizedStrings.magicianNegative,
                                 yesOrNo: .yes)
            case .highPriestess:
                return TarotCard(name: LocalizedStrings.highPriestess,
                                 imageName: "The High Priestess",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.highPriestessNeutral,
                                 uprightKeywords: LocalizedStrings.highPriestessPositive,
                                 reversedKeywords: LocalizedStrings.highPriestessNegative,
                                 yesOrNo: .maybe)
            case .empress:
                return TarotCard(name: LocalizedStrings.empress,
                                 imageName: "The Empress",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.empressNeutral,
                                 uprightKeywords: LocalizedStrings.empressPositive,
                                 reversedKeywords: LocalizedStrings.empressNegative,
                                 yesOrNo: .yes)
            case .emperor:
                return TarotCard(name: LocalizedStrings.emperor,
                                 imageName: "The Emperor",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.emperorNeutral,
                                 uprightKeywords: LocalizedStrings.emperorPositive,
                                 reversedKeywords: LocalizedStrings.emperorNegative,
                                 yesOrNo: .maybe)
            case .hierophant:
                return TarotCard(name: LocalizedStrings.hierophant,
                                 imageName: "The Hierophant",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.hierophantNeutral,
                                 uprightKeywords: LocalizedStrings.hierophantPositive,
                                 reversedKeywords: LocalizedStrings.hierophantNegative,
                                 yesOrNo: .maybe)
            case .lovers:
                return TarotCard(name: LocalizedStrings.lovers,
                                 imageName: "The Lovers",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.loversNeutral,
                                 uprightKeywords: LocalizedStrings.loversPositive,
                                 reversedKeywords: LocalizedStrings.loversNegative,
                                 yesOrNo: .yes)
            case .chariot:
                return TarotCard(name: LocalizedStrings.chariot,
                                 imageName: "The Chariot",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.chariotNeutral,
                                 uprightKeywords: LocalizedStrings.chariotPositive,
                                 reversedKeywords: LocalizedStrings.chariotNegative,
                                 yesOrNo: .yes)
            case .strength:
                return TarotCard(name: LocalizedStrings.strength,
                                 imageName: "Strength",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.strengthNeutral,
                                 uprightKeywords: LocalizedStrings.strengthPositive,
                                 reversedKeywords: LocalizedStrings.strengthNegative,
                                 yesOrNo: .yes)
            case .hermit:
                return TarotCard(name: LocalizedStrings.hermit,
                                 imageName: "The Hermit",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.hermitNeutral,
                                 uprightKeywords: LocalizedStrings.hermitPositive,
                                 reversedKeywords: LocalizedStrings.hermitNegative,
                                 yesOrNo: .maybe)
            case .wheelOfFortune:
                return TarotCard(name: LocalizedStrings.wheelOfFortune,
                                 imageName: "Wheel Of Fortune",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.wheelOfFortuneNeutral,
                                 uprightKeywords: LocalizedStrings.wheelOfFortunePositive,
                                 reversedKeywords: LocalizedStrings.wheelOfFortuneNegative,
                                 yesOrNo: .yes)
            case .justice:
                return TarotCard(name: LocalizedStrings.justice,
                                 imageName: "Justice",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.justiceNeutral,
                                 uprightKeywords: LocalizedStrings.justicePositive,
                                 reversedKeywords: LocalizedStrings.justiceNegative,
                                 yesOrNo: .maybe)
            case .hangedMan:
                return TarotCard(name: LocalizedStrings.hangedMan,
                                 imageName: "The Hanged Man",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.hangedManNeutral,
                                 uprightKeywords: LocalizedStrings.hangedManPositive,
                                 reversedKeywords: LocalizedStrings.hangedManNegative,
                                 yesOrNo: .maybe)
            case .death:
                return TarotCard(name: LocalizedStrings.death,
                                 imageName: "Death",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.deathNeutral,
                                 uprightKeywords: LocalizedStrings.deathPositive,
                                 reversedKeywords: LocalizedStrings.deathNegative,
                                 yesOrNo: .no)
            case .temperance:
                return TarotCard(name: LocalizedStrings.temperance,
                                 imageName: "Temperance",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.temperanceNeutral,
                                 uprightKeywords: LocalizedStrings.temperancePositive,
                                 reversedKeywords: LocalizedStrings.temperanceNegative,
                                 yesOrNo: .yes)
            case .devil:
                return TarotCard(name: LocalizedStrings.devil,
                                 imageName: "The Devil",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.devilNeutral,
                                 uprightKeywords: LocalizedStrings.devilPositive,
                                 reversedKeywords: LocalizedStrings.devilNegative,
                                 yesOrNo: .no)
            case .tower:
                return TarotCard(name: LocalizedStrings.tower,
                                 imageName: "The Tower",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.towerNeutral,
                                 uprightKeywords: LocalizedStrings.towerPositive,
                                 reversedKeywords: LocalizedStrings.towerNegative,
                                 yesOrNo: .no)
            case .star:
                return TarotCard(name: LocalizedStrings.star,
                                 imageName: "The Star",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.starNeutral,
                                 uprightKeywords: LocalizedStrings.starPositive,
                                 reversedKeywords: LocalizedStrings.starNegative,
                                 yesOrNo: .yes)
            case .moon:
                return TarotCard(name: LocalizedStrings.moon,
                                 imageName: "The Moon",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.moonNeutral,
                                 uprightKeywords: LocalizedStrings.moonPositive,
                                 reversedKeywords: LocalizedStrings.moonNegative,
                                 yesOrNo: .no)
            case .sun:
                return TarotCard(name: LocalizedStrings.sun,
                                 imageName: "The Sun",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.sunNeutral,
                                 uprightKeywords: LocalizedStrings.sunPositive,
                                 reversedKeywords: LocalizedStrings.sunNegative,
                                 yesOrNo: .yes)
            case .judgement:
                return TarotCard(name: LocalizedStrings.judgement,
                                 imageName: "Judgement",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.judgementNeutral,
                                 uprightKeywords: LocalizedStrings.judgementPositive,
                                 reversedKeywords: LocalizedStrings.judgementNegative,
                                 yesOrNo: .yes)
            case .world:
                return TarotCard(name: LocalizedStrings.world,
                                 imageName: "The World",
                                 arcana: .major,
                                 neutralKeywords: LocalizedStrings.worldNeutral,
                                 uprightKeywords: LocalizedStrings.worldPositive,
                                 reversedKeywords: LocalizedStrings.worldNegative,
                                 yesOrNo: .yes)
            case .aceOfWands:
                return TarotCard(name: LocalizedStrings.aceOfWands,
                                 imageName: "Ace of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.aceOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.aceOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.aceOfWandsNegative,
                                 yesOrNo: .yes)
            case .twoOfWands:
                return TarotCard(name: LocalizedStrings.twoOfWands,
                                 imageName: "Two of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.twoOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.twoOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.twoOfWandsNegative,
                                 yesOrNo: .yes)
            case .threeOfWands:
                return TarotCard(name: LocalizedStrings.threeOfWands,
                                 imageName: "Three of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.threeOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.threeOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.threeOfWandsNegative,
                                 yesOrNo: .yes)
            case .fourOfWands:
                return TarotCard(name: LocalizedStrings.fourOfWands,
                                 imageName: "Four of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fourOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.fourOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.fourOfWandsNegative,
                                 yesOrNo: .yes)
            case .fiveOfWands:
                return TarotCard(name: LocalizedStrings.fiveOfWands,
                                 imageName: "Five of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fiveOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.fiveOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.fiveOfWandsNegative,
                                 yesOrNo: .no)
            case .sixOfWands:
                return TarotCard(name: LocalizedStrings.sixOfWands,
                                 imageName: "Six of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sixOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.sixOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.sixOfWandsNegative,
                                 yesOrNo: .yes)
            case .sevenOfWands:
                return TarotCard(name: LocalizedStrings.sevenOfWands,
                                 imageName: "Seven of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sevenOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.sevenOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.sevenOfWandsNegative,
                                 yesOrNo: .no)
            case .eightOfWands:
                return TarotCard(name: LocalizedStrings.eightOfWands,
                                 imageName: "Eight of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.eightOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.eightOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.eightOfWandsNegative,
                                 yesOrNo: .yes)
            case .nineOfWands:
                return TarotCard(name: LocalizedStrings.nineOfWands,
                                 imageName: "Nine of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.nineOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.nineOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.nineOfWandsNegative,
                                 yesOrNo: .yes)
            case .tenOfWands:
                return TarotCard(name: LocalizedStrings.tenOfWands,
                                 imageName: "Ten of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.tenOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.tenOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.tenOfWandsNegative,
                                 yesOrNo: .no)
            case .pageOfWands:
                return TarotCard(name: LocalizedStrings.pageOfWands,
                                 imageName: "Page of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.pageOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.pageOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.pageOfWandsNegative,
                                 yesOrNo: .yes)
            case .knightOfWands:
                return TarotCard(name: LocalizedStrings.knightOfWands,
                                 imageName: "Knight of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.knightOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.knightOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.knightOfWandsNegative,
                                 yesOrNo: .yes)
            case .queenOfWands:
                return TarotCard(name: LocalizedStrings.queenOfWands,
                                 imageName: "Queen of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.queenOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.queenOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.queenOfWandsNegative,
                                 yesOrNo: .yes)
            case .kingOfWands:
                return TarotCard(name: LocalizedStrings.kingOfWands,
                                 imageName: "King of Wands",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.kingOfWandsNeutral,
                                 uprightKeywords: LocalizedStrings.kingOfWandsPositive,
                                 reversedKeywords: LocalizedStrings.kingOfWandsNegative,
                                 yesOrNo: .yes)
            case .aceOfPentacles:
                return TarotCard(name: LocalizedStrings.aceOfPentacles,
                                 imageName: "Ace of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.aceOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.aceOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.aceOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .twoOfPentacles:
                return TarotCard(name: LocalizedStrings.twoOfPentacles,
                                 imageName: "Two of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.twoOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.twoOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.twoOfPentaclesNegative,
                                 yesOrNo: .maybe)
            case .threeOfPentacles:
                return TarotCard(name: LocalizedStrings.threeOfPentacles,
                                 imageName: "Three of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.threeOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.threeOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.threeOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .fourOfPentacles:
                return TarotCard(name: LocalizedStrings.fourOfPentacles,
                                 imageName: "Four of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fourOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.fourOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.fourOfPentaclesNegative,
                                 yesOrNo: .no)
            case .fiveOfPentacles:
                return TarotCard(name: LocalizedStrings.fiveOfPentacles,
                                 imageName: "Five of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fiveOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.fiveOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.fiveOfPentaclesNegative,
                                 yesOrNo: .no)
            case .sixOfPentacles:
                return TarotCard(name: LocalizedStrings.sixOfPentacles,
                                 imageName: "Six of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sixOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.sixOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.sixOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .sevenOfPentacles:
                return TarotCard(name: LocalizedStrings.sevenOfPentacles,
                                 imageName: "Seven of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sevenOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.sevenOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.sevenOfPentaclesNegative,
                                 yesOrNo: .maybe)
            case .eightOfPentacles:
                return TarotCard(name: LocalizedStrings.eightOfPentacles,
                                 imageName: "Eight of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.eightOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.eightOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.eightOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .nineOfPentacles:
                return TarotCard(name: LocalizedStrings.nineOfPentacles,
                                 imageName: "Nine of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.nineOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.nineOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.nineOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .tenOfPentacles:
                return TarotCard(name: LocalizedStrings.tenOfPentacles,
                                 imageName: "Ten of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.tenOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.tenOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.tenOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .pageOfPentacles:
                return TarotCard(name: LocalizedStrings.pageOfPentacles,
                                 imageName: "Page of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.pageOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.pageOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.pageOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .knightOfPentacles:
                return TarotCard(name: LocalizedStrings.knightOfPentacles,
                                 imageName: "Knight of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.knightOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.knightOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.knightOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .queenOfPentacles:
                return TarotCard(name: LocalizedStrings.queenOfPentacles,
                                 imageName: "Queen of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.queenOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.queenOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.queenOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .kingOfPentacles:
                return TarotCard(name: LocalizedStrings.kingOfPentacles,
                                 imageName: "King of Pentacles",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.kingOfPentaclesNeutral,
                                 uprightKeywords: LocalizedStrings.kingOfPentaclesPositive,
                                 reversedKeywords: LocalizedStrings.kingOfPentaclesNegative,
                                 yesOrNo: .yes)
            case .aceOfCups:
                return TarotCard(name: LocalizedStrings.aceOfCups,
                                 imageName: "Ace of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.aceOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.aceOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.aceOfCupsNegative,
                                 yesOrNo: .yes)
            case .twoOfCups:
                return TarotCard(name: LocalizedStrings.twoOfCups,
                                 imageName: "Two of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.twoOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.twoOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.twoOfCupsNegative,
                                 yesOrNo: .yes)
            case .threeOfCups:
                return TarotCard(name: LocalizedStrings.threeOfCups,
                                 imageName: "Three of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.threeOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.threeOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.threeOfCupsNegative,
                                 yesOrNo: .yes)
            case .fourOfCups:
                return TarotCard(name: LocalizedStrings.fourOfCups,
                                 imageName: "Four of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fourOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.fourOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.fourOfCupsNegative,
                                 yesOrNo: .maybe)
            case .fiveOfCups:
                return TarotCard(name: LocalizedStrings.fiveOfCups,
                                 imageName: "Five of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fiveOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.fiveOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.fiveOfCupsNegative,
                                 yesOrNo: .no)
            case .sixOfCups:
                return TarotCard(name: LocalizedStrings.sixOfCups,
                                 imageName: "Six of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sixOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.sixOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.sixOfCupsNegative,
                                 yesOrNo: .yes)
            case .sevenOfCups:
                return TarotCard(name: LocalizedStrings.sevenOfCups,
                                 imageName: "Seven of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sevenOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.sevenOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.sevenOfCupsNegative,
                                 yesOrNo: .maybe)
            case .eightOfCups:
                return TarotCard(name: LocalizedStrings.eightOfCups,
                                 imageName: "Eight of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.eightOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.eightOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.eightOfCupsNegative,
                                 yesOrNo: .no)
            case .nineOfCups:
                return TarotCard(name: LocalizedStrings.nineOfCups,
                                 imageName: "Nine of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.nineOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.nineOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.nineOfCupsNegative,
                                 yesOrNo: .yes)
            case .tenOfCups:
                return TarotCard(name: LocalizedStrings.tenOfCups,
                                 imageName: "Ten of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.tenOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.tenOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.tenOfCupsNegative,
                                 yesOrNo: .yes)
            case .pageOfCups:
                return TarotCard(name: LocalizedStrings.pageOfCups,
                                 imageName: "Page of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.pageOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.pageOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.pageOfCupsNegative,
                                 yesOrNo: .yes)
            case .knightOfCups:
                return TarotCard(name: LocalizedStrings.knightOfCups,
                                 imageName: "Knight of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.knightOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.knightOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.knightOfCupsNegative,
                                 yesOrNo: .yes)
            case .queenOfCups:
                return TarotCard(name: LocalizedStrings.queenOfCups,
                                 imageName: "Queen of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.queenOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.queenOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.queenOfCupsNegative,
                                 yesOrNo: .yes)
            case .kingOfCups:
                return TarotCard(name: LocalizedStrings.kingOfCups,
                                 imageName: "King of Cups",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.kingOfCupsNeutral,
                                 uprightKeywords: LocalizedStrings.kingOfCupsPositive,
                                 reversedKeywords: LocalizedStrings.kingOfCupsNegative,
                                 yesOrNo: .yes)
            case .aceOfSwords:
                return TarotCard(name: LocalizedStrings.aceOfSwords,
                                 imageName: "Ace of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.aceOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.aceOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.aceOfSwordsNegative,
                                 yesOrNo: .no)
            case .twoOfSwords:
                return TarotCard(name: LocalizedStrings.twoOfSwords,
                                 imageName: "Two of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.twoOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.twoOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.twoOfSwordsNegative,
                                 yesOrNo: .maybe)
            case .threeOfSwords:
                return TarotCard(name: LocalizedStrings.threeOfSwords,
                                 imageName: "Three of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.threeOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.threeOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.threeOfSwordsNegative,
                                 yesOrNo: .no)
            case .fourOfSwords:
                return TarotCard(name: LocalizedStrings.fourOfSwords,
                                 imageName: "Four of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fourOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.fourOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.fourOfSwordsNegative,
                                 yesOrNo: .maybe)
            case .fiveOfSwords:
                return TarotCard(name: LocalizedStrings.fiveOfSwords,
                                 imageName: "Five of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.fiveOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.fiveOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.fiveOfSwordsNegative,
                                 yesOrNo: .no)
            case .sixOfSwords:
                return TarotCard(name: LocalizedStrings.sixOfSwords,
                                 imageName: "Six of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sixOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.sixOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.sixOfSwordsNegative,
                                 yesOrNo: .maybe)
            case .sevenOfSwords:
                return TarotCard(name: LocalizedStrings.sevenOfSwords,
                                 imageName: "Seven of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.sevenOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.sevenOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.sevenOfSwordsNegative,
                                 yesOrNo: .no)
            case .eightOfSwords:
                return TarotCard(name: LocalizedStrings.eightOfSwords,
                                 imageName: "Eight of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.eightOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.eightOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.eightOfSwordsNegative,
                                 yesOrNo: .no)
            case .nineOfSwords:
                return TarotCard(name: LocalizedStrings.nineOfSwords,
                                 imageName: "Nine of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.nineOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.nineOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.nineOfSwordsNegative,
                                 yesOrNo: .no)
            case .tenOfSwords:
                return TarotCard(name: LocalizedStrings.tenOfSwords,
                                 imageName: "Ten of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.tenOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.tenOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.tenOfSwordsNegative,
                                 yesOrNo: .no)
            case .pageOfSwords:
                return TarotCard(name: LocalizedStrings.pageOfSwords,
                                 imageName: "Page of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.pageOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.pageOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.pageOfSwordsNegative,
                                 yesOrNo: .yes)
            case .knightOfSwords:
                return TarotCard(name: LocalizedStrings.knightOfSwords,
                                 imageName: "Knight of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.knightOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.knightOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.knightOfSwordsNegative,
                                 yesOrNo: .yes)
            case .queenOfSwords:
                return TarotCard(name: LocalizedStrings.queenOfSwords,
                                 imageName: "Queen of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.queenOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.queenOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.queenOfSwordsNegative,
                                 yesOrNo: .maybe)
            case .kingOfSwords:
                return TarotCard(name: LocalizedStrings.kingOfSwords,
                                 imageName: "King of Swords",
                                 arcana: .minor,
                                 neutralKeywords: LocalizedStrings.kingOfSwordsNeutral,
                                 uprightKeywords: LocalizedStrings.kingOfSwordsPositive,
                                 reversedKeywords: LocalizedStrings.kingOfSwordsNegative,
                                 yesOrNo: .maybe)
        }
    }
}
