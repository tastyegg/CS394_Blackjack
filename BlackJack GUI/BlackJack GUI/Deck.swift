//
//  Deck.swift
//  BlackJack GUI
//
//  Created by Abus on 11/10/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import Foundation

class Deck {
    init() {
        for i in 1...4 {
            var suit:String
            switch(i) {
            case 1:
                suit = "clubs"
            case 2:
                suit = "spades"
            case 3:
                suit = "diamonds"
            default:
                suit = "hearts"
            }
            for j in 1...13 {
                switch(j) {
                case 1:
                    cards.append(Card(cardSuit: suit, cardFace: "ace"))
                case 11:
                    cards.append(Card(cardSuit: suit, cardFace: "jack", ext: "2"))
                case 12:
                    cards.append(Card(cardSuit: suit, cardFace: "queen", ext: "2"))
                case 13:
                    cards.append(Card(cardSuit: suit, cardFace: "king", ext: "2"))
                default:
                    cards.append(Card(cardSuit: suit, cardFace: "\(j)"))
                }
            }
        }
    }

    var cards = [Card]()
}