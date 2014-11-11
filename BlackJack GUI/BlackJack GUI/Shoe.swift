//
//  Shoe.swift
//  BlackJack GUI
//
//  Created by Abus on 11/10/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import Foundation

class Shoe {
    init(deckCount:Int? = 4) {
        for var i = 0; i < deckCount; i++ {
            var d = Deck()
            for x in 0 ... d.cards.count - 1 {
                cards.append(d.cards[x])
            }
        }
        shuffle()
    }
    
    func shuffle() {
        for x in 0 ... cards.count - 2 {
            var i = cards.count - x
            var j = x + Int(arc4random_uniform(UInt32(i)))
            
            var temp = cards[x]
            cards[x] = cards[j]
            cards[j] = temp
        }
    }
    
    func draw() -> Card {
        var card = cards[idx]
        idx = (idx + 1) % cards.count
        if idx == 0 {
            shuffle()
        }
        return card
    }
    
    var idx = 0
    var cards = [Card]()
}