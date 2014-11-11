//
//  Card.swift
//  BlackJack GUI
//
//  Created by Abus on 11/10/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import Foundation

class Card {
    init(cardSuit:String, cardFace:String, ext:String = "") {
        self.cardSuit = cardSuit
        self.cardFace = cardFace
        cardName = "\(cardFace)_of_\(cardSuit)\(ext)"
    }
    var cardName:String
    var cardSuit:String
    var cardFace:String
}