//
//  Card.swift
//  Concentration
//
//  Created by Denise Lutz on 30.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
