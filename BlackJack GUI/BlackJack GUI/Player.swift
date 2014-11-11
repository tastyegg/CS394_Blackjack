//
//  Player.swift
//  BlackJack GUI
//
//  Created by Abus on 11/10/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import Foundation

class Player {
    init(playerName:String) {
        self.playerName = playerName
        playerBet = 0
        playerPocket = 100
        notPlaying = true
    }
    
    var playerName:String
    var playerBet:Int
    var playerPocket:Int
    var notPlaying:Bool
}