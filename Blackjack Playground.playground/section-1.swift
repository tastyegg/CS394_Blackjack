import Foundation
import UIKit

class Card {
    enum Rank:Int {
        case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    }
    enum Suit:Int {
        case Spade = 1, Heart, Diamond, Club
    }
    
    var rank:Rank
    var suit:Suit
    
    init(rank:Rank, suit:Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    func getName() -> String {
        var str : String
        switch(suit) {
        case .Spade:
            str = "♠"
        case .Heart:
            str = "♥"
        case .Diamond:
            str = "♦"
        case .Club:
            str = "♣"
        }
        switch(rank) {
        case .Ace:
            return "\(str) Ace"
        case .Jack:
            return "\(str) Jack"
        case .Queen:
            return "\(str) Queen"
        case .King:
            return "\(str) King"
        default:
            return "\(str) \(rank.toRaw())"
        }
    }
    
    func getValue() -> Int {
        switch(rank) {
        case .Jack, .Queen, .King:
            return 10
        case .Ace:
            return 11
        default:
            return rank.toRaw()
        }
    }
}

class Deck {
    var cards = [Card]()
    
    init() {
        for y in Card.Suit.Spade.toRaw() ... Card.Suit.Diamond.toRaw() {
            for x in Card.Rank.Ace.toRaw() ... Card.Rank.King.toRaw() {
                cards.append( Card(rank: Card.Rank.fromRaw(x)!, suit: Card.Suit.fromRaw(y)!) )
            }
        }       
    }
}

class Shoe {
    var cards = [Card]()
    var idx = 0
    
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
    
    func kick() -> Card {
        if idx >= cards.count { //After deck empties out, add 5 new decks
            shuffle()
            idx = 0
        }
        var c = cards[idx]
        idx++
        
        return c
    }
}

class Hand {
    var cards = [Card]()
    var shoe:Shoe
    
    var aces = 0
    var total = 0
    
    init(shoe:Shoe) {
        self.shoe = shoe
    }
    
    func hit() {
        cards.append(shoe.kick())
        if cards.last!.rank == Card.Rank.Ace {
            aces++
        }
        total += cards.last!.getValue()
        
        while total > 21 && aces > 0 {
            aces--
            total -= 10
        }
        
        if total >= 21 {
            stand()
        }
    }
    
    func stand() {
        
    }
    
    func clear() {
        cards.removeAll(keepCapacity: false)
        total = 0
    }
}

class Player:Hand {
    var gametable:GameTable
    var money = 100
    var bet = 1
    
    init(shoe:Shoe, gametable:GameTable) {
        self.gametable = gametable
        super.init(shoe: shoe)
    }
    
    override func stand() {
        gametable.nextTurn()
    }
}

class Dealer:Hand {
    func play() {
        //reveal second card
        while total < 17 {
            hit()
        }
        if total < 21 {
            stand() //because the dealer haven't stood yet since he didn't stand while hitting 
        }
    }
}

class GameTable {
    var players = [Player]()
    var dealer:Dealer
    var playerIdx = 0
    var shoe:Shoe
    var gameNumber = 1
    
    init(numberOfPlayers:Int = 3) {
        shoe = Shoe()
        dealer = Dealer(shoe: shoe)
        for x in 0 ... numberOfPlayers - 1 {
            players.append(Player(shoe: shoe, gametable: self))
        }
        
        startGame()
        statDisplay()
    }
    
    func startGame() {
        //Prompt each player how much they're betting this game
        //"How much is player[x] betting this game?"
        
        for x in 0 ... 1 {  //Pick a card for each player
            dealer.hit()
            for x in 0 ... players.count - 1 {
                players[x].hit()
            }
        }
    }
    
    func nextTurn() {
        playerIdx++
        while(playerIdx < players.count && players[playerIdx].money <= 0) {
            playerIdx++
        }
        if (playerIdx >= players.count) {
            dealer.play()
            statDisplay()
            endGame()
        }
    }
    
    func hit() {
        println("(Hit)")
        players[playerIdx].hit()
        statDisplay()
    }
    
    func stand() {
        println("(Stand)")
        players[playerIdx].stand()
        statDisplay()
    }
    
    func statDisplay() {
        print("Dealer has: ")
        for var x = 0; x < dealer.cards.count; x++ {
            if !(x == 0 && playerIdx != players.count) {
                print("\(dealer.cards[x].getName()), ")
            }
            else {
                print("N/A, ")
            }
        }
        println("in total: \(dealer.total)")
        
        for var y = 0; y < players.count; y++ {
            print("Player \(y + 1) has: ")
            for var x = 0; x < players[y].cards.count; x++ {
                print("\(players[y].cards[x].getName()), ")
            }
            println("in total: \(players[y].total) | $\(players[y].bet) / $\(players[y].money)")
        }
        if playerIdx == players.count {
            println("Game End")
        }
        else {
            print("Player \(playerIdx + 1)’s Turn: ")
        }
    }
    
    func endGame() {
        for x in 0 ... players.count - 1 {
            if players[x].total <= 21 && (players[x].total > dealer.total || dealer.total > 21) {
                players[x].money += players[x].bet
                if players[x].cards.count == 2 && players[x].total == 21 {
                    players[x].money += players[x].bet/2
                }
            }
            else if dealer.total <= 21 && (dealer.total > players[x].total || players[x].total > 21) {
                players[x].money -= players[x].bet
                if dealer.cards.count == 2 && dealer.total == 21 {
                    players[x].money -= players[x].bet/2
                }
            }
        }
        
        for x in 0 ... players.count - 1 {
            players[x].clear()
        }
        dealer.clear()
        
        gameNumber++
        if gameNumber%5 == 1 {
            shoe.shuffle()
        }
        
        playerIdx = 0
        startGame()
    }
}

var gametable = GameTable(numberOfPlayers: 1)

func hit() {
    gametable.hit()
}

func stand() {
    gametable.stand()
}

hit()
stand()