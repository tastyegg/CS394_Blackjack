//
//  ViewController.swift
//  Blackjack CS2214
//
//  Created by Kevin Zeng on 9/21/14.
//  Copyright (c) 2014 Kevin Zeng. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var scoreCount: UITextField!
    @IBOutlet weak var playerHandView: UITextView!
    @IBOutlet weak var dealerHandView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newGame(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newGame(shuffleDeck: Bool) {
        if (shuffleDeck) {
            deck = Deck()
        }
        
        dealerHand = Hand()
        playerHand = Hand()
        
        dealerHand.drawCard(deck.drawCard())
        dealerHand.drawCard(deck.drawCard())
        playerHand.drawCard(deck.drawCard())
        playerHand.drawCard(deck.drawCard())
        
        revealDealer = false
        displayDealerHand()
        displayPlayerHand()
    }
    
    @IBAction func didStand(AnyObject) {
        while (dealerHand.determineValue() < 17) {
            dealerHand.drawCard(deck.drawCard())
        }
        revealDealer = true
        displayDealerHand()
    }
    
    @IBAction func didHit(AnyObject) {
        playerHand.drawCard(deck.drawCard())
        displayPlayerHand()
    }
    
    func displayPlayerHand() {
        playerHandView.text = "Player's Hand:\n"
        for card in playerHand.cards {
            playerHandView.text = "\(playerHandView.text)\(card.suit) Suit \(card.rank)\n"
        }
        playerHandView.text = "\(playerHandView.text)Total Value: \(playerHand.determineValue())\n"
        if (playerHand.determineValue() > 21) {
            playerHandView.text = "\(playerHandView.text)Busted!\n"
        }
    }
    func displayDealerHand() {
        dealerHandView.text = "Dealer's Hand:\n"
        dealerHandView.text = "\(dealerHandView.text)The first card is faced down.\n"
        
        var i: Int
        if (revealDealer == true) {
            i = 0;
        }
        else {
            i = 1;
        }
        for ; i < dealerHand.cards.count; i++ {
            var card = dealerHand.cards[i]
            dealerHandView.text = "\(dealerHandView.text)\(card.suit) Suit \(card.rank)\n"
        }
        dealerHandView.text = "\(dealerHandView.text)Total Value: \(dealerHand.determineValue())\n"
        if (dealerHand.determineValue() > 21) {
            dealerHandView.text = "\(dealerHandView.text)Busted!\n"
        }
    }
    
    func endGame() {
        revealDealer = true
        displayPlayerHand()
        displayDealerHand()
        
        var playerBust = playerHand.determineValue() > 21
        var dealerBust = dealerHand.determineValue() > 21
        
        if (playerBust & !dealerBust) {
            money -= 50
        }
        else if ((!playerBust & dealerBust) || playerHand.determineValue() > dealerHand.determineValue()) {
            money += 50
        }
        
        scoreCount.text = "\(money)"
        if (money > 0) {
            newGame(false)
        }
    }
    
    var deck: Deck!
    var playerHand: Hand!
    var dealerHand: Hand!
    var revealDealer: Bool!
    var money = 100
}

class Hand {
    var cards = [Card]()
    
    func drawCard(card: Card) {
        cards.append(card)
    }
    
    func determineValue() -> Int {
        var sumValue: Int = 0
        var softHand: Int = 0
        
        for card in cards {
            if (card.rank == 1) {
                softHand++
                sumValue += 11
            }
            else {
                sumValue += card.getValue()
            }
        }
        
        while (sumValue > 21 && softHand > 0) {
            softHand--
            sumValue -= 10
        }
        
        return sumValue
    }
}

class Card {
    var rank: Int = 0
    var suit: Int = 0
    
    init(rank: Int, suit: Int) {
        self.rank = rank
        self.suit = suit
    }
    
    func getValue() -> Int {
        if (rank > 9) {
            return 10
        }
        else {
            return rank
        }
    }
    
    func getId() -> String {
        return "Suit: \(suit), Rank: \(rank)"
    }
}

class Deck {
    var cards = [Card]()
    var index: Int = 0
    
    init() {
        while (cards.count < 52) {
            for var i = 1; i < 5; i++ {
                //Spade, Heart, Club, Diamond
                for var j = 1; j < 14; j++ {
                    //Ace-King
                    cards.append(Card(rank: j, suit: i))
                }
            }
        }
        shuffleDeck()
    }
    
    func drawCard() -> Card {
        //If deck runs out of cards, alert player and make a new game
        //if (index == 51) {
        //    newGame(true) //has no permission to access this method
        //}
        
        index = (index + 1) % 52
        return cards[index - 1]
    }
    
    func swapCard(index1: Int, index2: Int) {
        var card = cards[index1]
        cards[index1] = cards[index2]
        cards[index2] = card
    }
    
    func shuffleDeck() {
        for var t = 0; t < 4; t++ {
            //Does t shuffles
            for var i = 0; i < 51; i++ {
                swapCard(i, index2: i + Int(arc4random()) % (51 - i))
            }
        }
    }
    
    func printOut() {
        for card in cards {
            println(card.getId())
        }
    }
}



















