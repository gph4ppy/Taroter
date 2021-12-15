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
        let preferredLanguage      = Locale.preferredLanguages[0] as String
        let isPolishLanguage: Bool = preferredLanguage == "pl-PL" ? true : false
        
        switch self {
            case .fool:
                return TarotCard(name: LocalizedStrings.fool,
                                 imageName: "The Fool",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.foolUpright,
                                 reversedKeywords: LocalizedStrings.foolReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Błazen"] : [])
            case .magician:
                return TarotCard(name: LocalizedStrings.magician,
                                 imageName: "The Magician",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.magicianUpright,
                                 reversedKeywords: LocalizedStrings.magicianReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Magik", "Kuglarz", "Czarownik", "Czarodziej", "Alchemik", "Sztukmistrz"] : [])
            case .highPriestess:
                return TarotCard(name: LocalizedStrings.highPriestess,
                                 imageName: "The High Priestess",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.highPriestessUpright,
                                 reversedKeywords: LocalizedStrings.highPriestessReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Papieżyca", "Arcykapłanka", "Hierofantka"] : [])
            case .empress:
                return TarotCard(name: LocalizedStrings.empress,
                                 imageName: "The Empress",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.empressUpright,
                                 reversedKeywords: LocalizedStrings.empressReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Władczyni", "Natura"] : [])
            case .emperor:
                return TarotCard(name: LocalizedStrings.emperor,
                                 imageName: "The Emperor",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.emperorUpright,
                                 reversedKeywords: LocalizedStrings.emperorReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Władca"] : [])
            case .hierophant:
                return TarotCard(name: LocalizedStrings.hierophant,
                                 imageName: "The Hierophant",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hierophantUpright,
                                 reversedKeywords: LocalizedStrings.hierophantReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Arcykapłan", "Papież", "Hierofant"] : [])
            case .lovers:
                return TarotCard(name: LocalizedStrings.lovers,
                                 imageName: "The Lovers",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.loversUpright,
                                 reversedKeywords: LocalizedStrings.loversReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Zakochani"] : [])
            case .chariot:
                return TarotCard(name: LocalizedStrings.chariot,
                                 imageName: "The Chariot",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.chariotUpright,
                                 reversedKeywords: LocalizedStrings.chariotReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Wóz", "Powóz"] : [])
            case .strength:
                return TarotCard(name: LocalizedStrings.strength,
                                 imageName: "Strength",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.strengthUpright,
                                 reversedKeywords: LocalizedStrings.strengthReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Moc", "Potęga"] : [])
            case .hermit:
                return TarotCard(name: LocalizedStrings.hermit,
                                 imageName: "The Hermit",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hermitUpright,
                                 reversedKeywords: LocalizedStrings.hermitReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Mędrzec", "Starzec", "Eremita"] : [])
            case .wheelOfFortune:
                return TarotCard(name: LocalizedStrings.wheelOfFortune,
                                 imageName: "Wheel Of Fortune",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.wheelOfFortuneUpright,
                                 reversedKeywords: LocalizedStrings.wheelOfFortuneReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Los", "Fatum", "Koło szczęścia", "Koło losu"] : [])
            case .justice:
                return TarotCard(name: LocalizedStrings.justice,
                                 imageName: "Justice",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.justiceUpright,
                                 reversedKeywords: LocalizedStrings.justiceReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Karma", "Prawo"] : [])
            case .hangedMan:
                return TarotCard(name: LocalizedStrings.hangedMan,
                                 imageName: "The Hanged Man",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.hangedManUpright,
                                 reversedKeywords: LocalizedStrings.hangedManReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: [])
            case .death:
                return TarotCard(name: LocalizedStrings.death,
                                 imageName: "Death",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.deathUpright,
                                 reversedKeywords: LocalizedStrings.deathReversed,
                                 yesOrNo: .no,
                                 searchKeywords: [])
            case .temperance:
                return TarotCard(name: LocalizedStrings.temperance,
                                 imageName: "Temperance",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.temperanceUpright,
                                 reversedKeywords: LocalizedStrings.temperanceReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Umiar", "Powściągliwość", "Równowaga", "Roztropność"] : [])
            case .devil:
                return TarotCard(name: LocalizedStrings.devil,
                                 imageName: "The Devil",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.devilUpright,
                                 reversedKeywords: LocalizedStrings.devilReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Demon", "Szatan"] : [])
            case .tower:
                return TarotCard(name: LocalizedStrings.tower,
                                 imageName: "The Tower",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.towerUpright,
                                 reversedKeywords: LocalizedStrings.towerReversed,
                                 yesOrNo: .no,
                                 searchKeywords: [])
            case .star:
                return TarotCard(name: LocalizedStrings.star,
                                 imageName: "The Star",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.starUpright,
                                 reversedKeywords: LocalizedStrings.starReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: [])
            case .moon:
                return TarotCard(name: LocalizedStrings.moon,
                                 imageName: "The Moon",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.moonUpright,
                                 reversedKeywords: LocalizedStrings.moonReversed,
                                 yesOrNo: .no,
                                 searchKeywords: [])
            case .sun:
                return TarotCard(name: LocalizedStrings.sun,
                                 imageName: "The Sun",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.sunUpright,
                                 reversedKeywords: LocalizedStrings.sunReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: [])
            case .judgement:
                return TarotCard(name: LocalizedStrings.judgement,
                                 imageName: "Judgement",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.judgementUpright,
                                 reversedKeywords: LocalizedStrings.judgementReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Osąd"] : [])
            case .world:
                return TarotCard(name: LocalizedStrings.world,
                                 imageName: "The World",
                                 arcana: .major,
                                 uprightKeywords: LocalizedStrings.worldUpright,
                                 reversedKeywords: LocalizedStrings.worldReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Wszechświat"] : [])
            case .aceOfWands:
                return TarotCard(name: LocalizedStrings.aceOfWands,
                                 imageName: "Ace of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["As pałek", "As kijów", "Jedynka buław", "Jedynka pałek", "Jedynka kijów", "1 buława", "1 pałka", "1 kij"] : ["1 wand", "1 of wands"])
            case .twoOfWands:
                return TarotCard(name: LocalizedStrings.twoOfWands,
                                 imageName: "Two of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dwie pałki", "Dwa kije", "Dwójka buław", "Dwójka pałek", "Dwójka kijów", "2 buławy", "2 pałki", "2 kije"] : ["2 wands", "2 of wands"])
            case .threeOfWands:
                return TarotCard(name: LocalizedStrings.threeOfWands,
                                 imageName: "Three of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Trzy pałki", "Trzy kije", "Trójka buław", "Trójka pałek", "Trójka kijów", "3 buławy", "3 pałki", "3 kije"] : ["3 wands", "3 of wands"])
            case .fourOfWands:
                return TarotCard(name: LocalizedStrings.fourOfWands,
                                 imageName: "Four of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Cztery pałki", "Cztery kije", "Czwórka buław", "Czwórka pałek", "Czwórka kijów", "4 buławy", "4 pałki", "4 kije"] : ["4 wands", "4 of wands"])
            case .fiveOfWands:
                return TarotCard(name: LocalizedStrings.fiveOfWands,
                                 imageName: "Five of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfWandsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Pięć pałek", "Pięć kijów", "Piątka buław", "Piątka pałek", "Piątka kijów", "5 buław", "5 pałek", "5 kijów"] : ["5 wands", "5 of wands"])
            case .sixOfWands:
                return TarotCard(name: LocalizedStrings.sixOfWands,
                                 imageName: "Six of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Sześć pałek", "Sześć kijów", "Szóstka buław", "Szóstka pałek", "Szóstka kijów", "6 buław", "6 pałek", "6 kijów"] : ["6 wands", "6 of wands"])
            case .sevenOfWands:
                return TarotCard(name: LocalizedStrings.sevenOfWands,
                                 imageName: "Seven of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfWandsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Siedem pałek", "Siedem kijów", "Siódemka buław", "Siódemka pałek", "Siódemka kijów", "7 buław", "7 pałek", "7 kijów"] : ["7 wands", "7 of wands"])
            case .eightOfWands:
                return TarotCard(name: LocalizedStrings.eightOfWands,
                                 imageName: "Eight of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Osiem pałek", "Osiem kijów", "Ósemka buław", "Ósemka pałek", "Ósemka kijów", "8 buław", "8 pałek", "8 kijów"] : ["8 wands", "8 of wands"])
            case .nineOfWands:
                return TarotCard(name: LocalizedStrings.nineOfWands,
                                 imageName: "Nine of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dziewięć pałek", "Dziewięć kijów", "Dziewiątka buław", "Dziewiątka pałek", "Dziewiątka kijów", "9 buław", "9 pałek", "9 kijów"] : ["9 wands", "9 of wands"])
            case .tenOfWands:
                return TarotCard(name: LocalizedStrings.tenOfWands,
                                 imageName: "Ten of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfWandsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Dziesięć pałek", "Dziesięć kijów", "Dziesiątka buław", "Dziesiątka pałek", "Dziesiątka kijów", "10 buław", "10 pałek", "10 kijów"] : ["10 wands", "10 of wands"])
            case .pageOfWands:
                return TarotCard(name: LocalizedStrings.pageOfWands,
                                 imageName: "Page of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Paź pałek", "Paź kijów", "Paź salamander", "Giermek buław", "Giermek pałek", "Giermek kijów", "Giermek salamander"] : [])
            case .knightOfWands:
                return TarotCard(name: LocalizedStrings.knightOfWands,
                                 imageName: "Knight of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Rycerz pałek", "Rycerz kijów", "Rycerz salamander"] : [])
            case .queenOfWands:
                return TarotCard(name: LocalizedStrings.queenOfWands,
                                 imageName: "Queen of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Królowa pałek", "Królowa kijów"] : [])
            case .kingOfWands:
                return TarotCard(name: LocalizedStrings.kingOfWands,
                                 imageName: "King of Wands",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfWandsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfWandsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Król pałek", "Król kijów", "Król salamander"] : [])
            case .aceOfPentacles:
                return TarotCard(name: LocalizedStrings.aceOfPentacles,
                                 imageName: "Ace of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.aceOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["As pentakli", "As monet", "Jedynka denarów", "Jedynka pentakli", "Jedynka monet", "1 denar", "1 pentakl", "1 moneta"] : ["1 pentacle", "1 of pentacles"])
            case .twoOfPentacles:
                return TarotCard(name: LocalizedStrings.twoOfPentacles,
                                 imageName: "Two of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.twoOfPentaclesReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Dwa pentakle", "Dwie monety", "Dwójka denarów", "Dwójka pentakli", "Dwójka monet", "2 denary", "2 pentakle", "2 monety"] : ["2 pentacles", "2 of pentacles"])
            case .threeOfPentacles:
                return TarotCard(name: LocalizedStrings.threeOfPentacles,
                                 imageName: "Three of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.threeOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Trzy pentakle", "Trzy monety", "Trójka denarów", "Trójka pentakli", "Trójka monet", "3 denary", "3 pentakle", "3 monety"] : ["3 pentacles", "3 of pentacles"])
            case .fourOfPentacles:
                return TarotCard(name: LocalizedStrings.fourOfPentacles,
                                 imageName: "Four of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.fourOfPentaclesReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Cztery pentakle", "Cztery monety", "Czwórka denarów", "Czwórka pentakli", "Czwórka monet", "4 denary", "4 pentakle", "4 monety"] : ["4 pentacles", "4 of pentacles"])
            case .fiveOfPentacles:
                return TarotCard(name: LocalizedStrings.fiveOfPentacles,
                                 imageName: "Five of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfPentaclesReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Pięć pentakli", "Pięć monet", "Piątka denarów", "Piątka pentakli", "Piątka monet", "5 denarów", "5 pentakli", "5 monet"] : ["5 pentacles", "5 of pentacles"])
            case .sixOfPentacles:
                return TarotCard(name: LocalizedStrings.sixOfPentacles,
                                 imageName: "Six of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.sixOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Sześć pentakli", "Sześć monet", "Szóstka denarów", "Szóstka pentakli", "Szóstka monet", "6 denarów", "6 pentakli", "6 monet"] : ["6 pentacles", "6 of pentacles"])
            case .sevenOfPentacles:
                return TarotCard(name: LocalizedStrings.sevenOfPentacles,
                                 imageName: "Seven of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfPentaclesReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Siedem pentakli", "Siedem monet", "Siódemka denarów", "Siódemka pentakli", "Siódemka monet", "7 denarów", "7 pentakli", "7 monet"] : ["7 pentacles", "7 of pentacles"])
            case .eightOfPentacles:
                return TarotCard(name: LocalizedStrings.eightOfPentacles,
                                 imageName: "Eight of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.eightOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Osiem pentakli", "Osiem monet", "Ósemka denarów", "Ósemka pentakli", "Ósemka monet", "8 denarów", "8 pentakli", "8 monet"] : ["8 pentacles", "8 of pentacles"])
            case .nineOfPentacles:
                return TarotCard(name: LocalizedStrings.nineOfPentacles,
                                 imageName: "Nine of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.nineOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dziewięć pentakli", "Dziewięć monet", "Dziewiątka denarów", "Dziewiątka pentakli", "Dziewiątka monet", "9 denarów", "9 pentakli", "9 monet"] : ["9 pentacles", "9 of pentacles"])
            case .tenOfPentacles:
                return TarotCard(name: LocalizedStrings.tenOfPentacles,
                                 imageName: "Ten of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.tenOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dziesięć pentakli", "Dziesięć monet", "Dziesiątka denarów", "Dziesiątka pentakli", "Dziesiątka monet", "10 denarów", "10 pentakli", "10 monet"] : ["10 pentacles", "10 of pentacles"])
            case .pageOfPentacles:
                return TarotCard(name: LocalizedStrings.pageOfPentacles,
                                 imageName: "Page of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.pageOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Paź pentakli", "Paź monet", "Giermek denarów", "Giermek pentakli", "Giermek monet"] : [])
            case .knightOfPentacles:
                return TarotCard(name: LocalizedStrings.knightOfPentacles,
                                 imageName: "Knight of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.knightOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Rycerz pentakli", "Rycerz monet"] : [])
            case .queenOfPentacles:
                return TarotCard(name: LocalizedStrings.queenOfPentacles,
                                 imageName: "Queen of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.queenOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Królowa pentakli", "Królowa monet"] : [])
            case .kingOfPentacles:
                return TarotCard(name: LocalizedStrings.kingOfPentacles,
                                 imageName: "King of Pentacles",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfPentaclesUpright,
                                 reversedKeywords: LocalizedStrings.kingOfPentaclesReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Król pentakli", "Król monet"] : [])
            case .aceOfCups:
                return TarotCard(name: LocalizedStrings.aceOfCups,
                                 imageName: "Ace of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["As pucharów", "Jedynka kielichów", "Jedynka pucharów", "1 kielich", "1 puchar"] : ["1 cup", "1 of cups"])
            case .twoOfCups:
                return TarotCard(name: LocalizedStrings.twoOfCups,
                                 imageName: "Two of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dwa puchary", "Dwójka kielichów", "Dwójka pucharów", "2 kielichy", "2 puchary"] : ["2 cups", "2 of cups"])
            case .threeOfCups:
                return TarotCard(name: LocalizedStrings.threeOfCups,
                                 imageName: "Three of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Trzy puchary", "Trójka kielichów", "Trójka pucharów", "3 kielichy", "3 puchary"] : ["2 cups", "2 of cups"])
            case .fourOfCups:
                return TarotCard(name: LocalizedStrings.fourOfCups,
                                 imageName: "Four of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfCupsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Cztery puchary", "Czwórka kielichów", "Czwórka pucharów", "4 kielichy", "4 puchary"] : ["4 cups", "4 of cups"])
            case .fiveOfCups:
                return TarotCard(name: LocalizedStrings.fiveOfCups,
                                 imageName: "Five of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfCupsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Pięć pucharów", "Piątka kielichów", "Piątka pucharów", "5 kielichów", "5 pucharów"] : ["5 cups", "5 of cups"])
            case .sixOfCups:
                return TarotCard(name: LocalizedStrings.sixOfCups,
                                 imageName: "Six of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Sześć pucharów", "Szóstka kielichów", "Szóstka pucharów", "6 kielichów", "6 pucharów"] : ["6 cups", "6 of cups"])
            case .sevenOfCups:
                return TarotCard(name: LocalizedStrings.sevenOfCups,
                                 imageName: "Seven of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfCupsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Siedem pucharów", "Siódemka kielichów", "Siódemka pucharów", "7 kielichów", "7 pucharów"] : ["7 cups", "7 of cups"])
            case .eightOfCups:
                return TarotCard(name: LocalizedStrings.eightOfCups,
                                 imageName: "Eight of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfCupsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Osiem pucharów", "Ósemka kielichów", "Ósemka pucharów", "8 kielichów", "8 pucharów"] : ["8 cups", "8 of cups"])
            case .nineOfCups:
                return TarotCard(name: LocalizedStrings.nineOfCups,
                                 imageName: "Nine of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dziewięć pucharów", "Dziewiątka kielichów", "Dziewiątka pucharów", "9 kielichów", "9 pucharów"] : ["9 cups", "9 of cups"])
            case .tenOfCups:
                return TarotCard(name: LocalizedStrings.tenOfCups,
                                 imageName: "Ten of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Dziesięć pucharów", "Dziesiątka kielichów", "Dziesiątka pucharów", "10 kielichów", "10 pucharów"] : ["10 cups", "10 of cups"])
            case .pageOfCups:
                return TarotCard(name: LocalizedStrings.pageOfCups,
                                 imageName: "Page of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Paź pucharów", "Giermek kielichów", "Giermek pucharów"] : [])
            case .knightOfCups:
                return TarotCard(name: LocalizedStrings.knightOfCups,
                                 imageName: "Knight of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Rycerz pucharów"] : [])
            case .queenOfCups:
                return TarotCard(name: LocalizedStrings.queenOfCups,
                                 imageName: "Queen of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Królowa pucharów"] : [])
            case .kingOfCups:
                return TarotCard(name: LocalizedStrings.kingOfCups,
                                 imageName: "King of Cups",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfCupsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfCupsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Król pucharów"] : [])
            case .aceOfSwords:
                return TarotCard(name: LocalizedStrings.aceOfSwords,
                                 imageName: "Ace of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.aceOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.aceOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Jedynka mieczy", "1 miecz"] : ["1 sword", "1 of swords"])
            case .twoOfSwords:
                return TarotCard(name: LocalizedStrings.twoOfSwords,
                                 imageName: "Two of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.twoOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.twoOfSwordsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Dwójka mieczy", "2 miecze"] : ["2 swords", "2 of swords"])
            case .threeOfSwords:
                return TarotCard(name: LocalizedStrings.threeOfSwords,
                                 imageName: "Three of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.threeOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.threeOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Trójka mieczy", "3 miecze"] : ["3 swords", "3 of swords"])
            case .fourOfSwords:
                return TarotCard(name: LocalizedStrings.fourOfSwords,
                                 imageName: "Four of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fourOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.fourOfSwordsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Czwórka mieczy", "4 miecze"] : ["4 swords", "4 of swords"])
            case .fiveOfSwords:
                return TarotCard(name: LocalizedStrings.fiveOfSwords,
                                 imageName: "Five of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.fiveOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.fiveOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Piątka mieczy", "5 mieczy"] : ["5 swords", "5 of swords"])
            case .sixOfSwords:
                return TarotCard(name: LocalizedStrings.sixOfSwords,
                                 imageName: "Six of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sixOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.sixOfSwordsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Szóstka mieczy", "6 mieczy"] : ["6 swords", "6 of swords"])
            case .sevenOfSwords:
                return TarotCard(name: LocalizedStrings.sevenOfSwords,
                                 imageName: "Seven of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.sevenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.sevenOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Siódemka mieczy", "7 mieczy"] : ["7 swords", "7 of swords"])
            case .eightOfSwords:
                return TarotCard(name: LocalizedStrings.eightOfSwords,
                                 imageName: "Eight of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.eightOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.eightOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Ósemka mieczy", "8 mieczy"] : ["8 swords", "8 of swords"])
            case .nineOfSwords:
                return TarotCard(name: LocalizedStrings.nineOfSwords,
                                 imageName: "Nine of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.nineOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.nineOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Dziewięć mieczy", "9 mieczy"] : ["9 swords", "9 of swords"])
            case .tenOfSwords:
                return TarotCard(name: LocalizedStrings.tenOfSwords,
                                 imageName: "Ten of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.tenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.tenOfSwordsReversed,
                                 yesOrNo: .no,
                                 searchKeywords: isPolishLanguage ? ["Dziesiątka mieczy", "10 mieczy"] : ["10 swords", "10 of swords"])
            case .pageOfSwords:
                return TarotCard(name: LocalizedStrings.pageOfSwords,
                                 imageName: "Page of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.pageOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.pageOfSwordsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Giermek mieczy"] : [])
            case .knightOfSwords:
                return TarotCard(name: LocalizedStrings.knightOfSwords,
                                 imageName: "Knight of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.knightOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.knightOfSwordsReversed,
                                 yesOrNo: .yes,
                                 searchKeywords: isPolishLanguage ? ["Rycerz mieczy"] : [])
            case .queenOfSwords:
                return TarotCard(name: LocalizedStrings.queenOfSwords,
                                 imageName: "Queen of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.queenOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.queenOfSwordsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Królowa mieczy"] : [])
            case .kingOfSwords:
                return TarotCard(name: LocalizedStrings.kingOfSwords,
                                 imageName: "King of Swords",
                                 arcana: .minor,
                                 uprightKeywords: LocalizedStrings.kingOfSwordsUpright,
                                 reversedKeywords: LocalizedStrings.kingOfSwordsReversed,
                                 yesOrNo: .maybe,
                                 searchKeywords: isPolishLanguage ? ["Król mieczy"] : [])
        }
    }
}
