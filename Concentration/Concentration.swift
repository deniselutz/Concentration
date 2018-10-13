//
//  Concentration.swift
//  Concentration
//
//  Created by Denise Lutz on 30.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    // computed property
    private var indexOfOneAndOnlyFasceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                // if isFaceUp = true
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // game logic
    func chooseCards(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): Chosen index not in the Cards Array!")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFasceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFasceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): You must have at least one pair of cards!")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // Shuffle the cards
    }
}
