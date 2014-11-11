//
//  Hand.swift
//  BlackJack GUI
//
//  Created by Abus on 11/10/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import Foundation

class Hand {
    init() {
        
    }
    
    func determineValue() -> Int {
        var total = 0
        var acecount = 0
        for n in 0...cards.count-1 {
            switch (cards[n].cardFace) {
            case "ace":
                acecount++
                total += 11
            case "jack", "queen", "king":
                total += 10
            default:
                total += cards[n].cardFace.toInt()!
            }
        }
        while total > 21 && acecount > 0 {
            total -= 10
            acecount--
        }
        
        return total
    }
    
    func take(shoe:Shoe) {
        cards.append(shoe.draw())
    }
    
    var cards = [Card]()
}