//
//  GameViewController.swift
//  BlackJack GUI
//
//  Created by Abus on 11/2/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerCard5: UIImageView!
    @IBOutlet weak var dealerCard6: UIImageView!
    @IBOutlet weak var computerCard1: UIImageView!
    @IBOutlet weak var computerCard2: UIImageView!
    @IBOutlet weak var computerCard3: UIImageView!
    @IBOutlet weak var computerCard4: UIImageView!
    @IBOutlet weak var computerCard5: UIImageView!
    @IBOutlet weak var computerCard6: UIImageView!
    @IBOutlet weak var player1Card1: UIImageView!
    @IBOutlet weak var player1Card2: UIImageView!
    @IBOutlet weak var player1Card3: UIImageView!
    @IBOutlet weak var player1Card4: UIImageView!
    @IBOutlet weak var player1Card5: UIImageView!
    @IBOutlet weak var player1Card6: UIImageView!
    @IBOutlet weak var player2Card1: UIImageView!
    @IBOutlet weak var player2Card2: UIImageView!
    @IBOutlet weak var player2Card3: UIImageView!
    @IBOutlet weak var player2Card4: UIImageView!
    @IBOutlet weak var player2Card5: UIImageView!
    @IBOutlet weak var player2Card6: UIImageView!
    @IBOutlet weak var player3Card1: UIImageView!
    @IBOutlet weak var player3Card2: UIImageView!
    @IBOutlet weak var player3Card3: UIImageView!
    @IBOutlet weak var player3Card4: UIImageView!
    @IBOutlet weak var player3Card5: UIImageView!
    @IBOutlet weak var player3Card6: UIImageView!
    @IBOutlet weak var player4Card1: UIImageView!
    @IBOutlet weak var player4Card2: UIImageView!
    @IBOutlet weak var player4Card3: UIImageView!
    @IBOutlet weak var player4Card4: UIImageView!
    @IBOutlet weak var player4Card5: UIImageView!
    @IBOutlet weak var player4Card6: UIImageView!
    
    @IBAction func player1Hit(sender: UIButton) {
        hands[0].take(shoe)
        switch(hands[0].cards.count) {
        case 6...12:
            player1Card6.image = UIImage(named:hands[0].cards[5].cardName)
            fallthrough
        case 5...12:
            player1Card5.image = UIImage(named:hands[0].cards[4].cardName)
            fallthrough
        case 4...12:
            player1Card4.image = UIImage(named:hands[0].cards[3].cardName)
            fallthrough
        case 3...12:
            player1Card3.image = UIImage(named:hands[0].cards[2].cardName)
        default:
            break
        }
        
    }
    @IBAction func player1Stand(sender: UIButton) {
		stands[0] = true
		dealerHit()
    }
    @IBAction func player2Hit(sender: UIButton) {
        hands[1].take(shoe)
        switch(hands[1].cards.count) {
        case 6...12:
            player2Card6.image = UIImage(named:hands[1].cards[5].cardName)
            fallthrough
        case 5...12:
            player2Card5.image = UIImage(named:hands[1].cards[4].cardName)
            fallthrough
        case 4...12:
            player2Card4.image = UIImage(named:hands[1].cards[3].cardName)
            fallthrough
        case 3...12:
            player2Card3.image = UIImage(named:hands[1].cards[2].cardName)
        default:
            break
        }
    }
	@IBAction func player2Stand(sender: UIButton) {
		stands[1] = true
		dealerHit()
    }
    @IBAction func player3Hit(sender: UIButton) {
        hands[2].take(shoe)
        switch(hands[2].cards.count) {
        case 6...12:
            player3Card6.image = UIImage(named:hands[2].cards[5].cardName)
            fallthrough
        case 5...12:
            player3Card5.image = UIImage(named:hands[2].cards[4].cardName)
            fallthrough
        case 4...12:
            player3Card4.image = UIImage(named:hands[2].cards[3].cardName)
            fallthrough
        case 3...12:
            player3Card3.image = UIImage(named:hands[2].cards[2].cardName)
        default:
            break
        }
    }
	@IBAction func player3Stand(sender: UIButton) {
		stands[2] = true
		dealerHit()
    }
    @IBAction func player4Hit(sender: UIButton) {
        hands[3].take(shoe)
        switch(hands[3].cards.count) {
        case 6...12:
            player4Card6.image = UIImage(named:hands[3].cards[5].cardName)
            fallthrough
        case 5...12:
            player4Card5.image = UIImage(named:hands[3].cards[4].cardName)
            fallthrough
        case 4...12:
            player4Card4.image = UIImage(named:hands[3].cards[3].cardName)
            fallthrough
        case 3...12:
            player4Card3.image = UIImage(named:hands[3].cards[2].cardName)
        default:
            break
        }
    }
	@IBAction func player4Stand(sender: UIButton) {
		stands[3] = true
		dealerHit()
    }
	func computerHit() {
		if hands[4].determineValue() < 18 {
			
			hands[4].take(shoe)
			switch(hands[4].cards.count) {
			case 6...12:
				computerCard6.image = UIImage(named:hands[4].cards[5].cardName)
				fallthrough
			case 5...12:
				computerCard5.image = UIImage(named:hands[4].cards[4].cardName)
				fallthrough
			case 4...12:
				computerCard4.image = UIImage(named:hands[4].cards[3].cardName)
				fallthrough
			case 3...12:
				computerCard3.image = UIImage(named:hands[4].cards[2].cardName)
			default:
				break
			}
		}
	}
	func dealerHit() {
		computerHit()
		var everyoneDealed = true
		for n in 0...3 {
			if !stands[n] {
				everyoneDealed = false
			}
		}
		if everyoneDealed {
			while hands[5].determineValue() < 17 {
				hands[5].take(shoe)
			}
			switch(hands[5].cards.count) {
			case 6...12:
				dealerCard6.image = UIImage(named:hands[5].cards[5].cardName)
				fallthrough
			case 5...12:
				dealerCard5.image = UIImage(named:hands[5].cards[4].cardName)
				fallthrough
			case 4...12:
				dealerCard4.image = UIImage(named:hands[5].cards[3].cardName)
				fallthrough
			case 3...12:
				dealerCard3.image = UIImage(named:hands[5].cards[2].cardName)
				fallthrough
			case 1...12:
				dealerCard1.image = UIImage(named:hands[5].cards[0].cardName)
			default:
				break
			}
			endGameButton.hidden = false
		}
	}
	
    @IBOutlet weak var player1Tag: UITextField!
    @IBOutlet weak var player2Tag: UITextField!
    @IBOutlet weak var player3Tag: UITextField!
    @IBOutlet weak var player4Tag: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		stands = [false, false, false, false]
		
        player1Tag.text = players[0].playerName
		player1Tag.hidden = players[0].notPlaying
		stands[0] = players[0].notPlaying
        player2Tag.text = players[1].playerName
		player2Tag.hidden = players[1].notPlaying
		stands[1] = players[1].notPlaying
        player3Tag.text = players[2].playerName
		player3Tag.hidden = players[2].notPlaying
		stands[2] = players[2].notPlaying
        player4Tag.text = players[3].playerName
		player4Tag.hidden = players[3].notPlaying
		stands[3] = players[3].notPlaying
		
        for n in 0...1 {
            for m in 0...5 {
				if m > 3 || m < 4 && !players[m].notPlaying {
					hands[m].take(shoe)
				}
			}
		}
		
		if !players[0].notPlaying {
			player1Card1.image = UIImage(named:hands[0].cards[0].cardName)
			player1Card2.image = UIImage(named:hands[0].cards[1].cardName)
		}
		if !players[1].notPlaying {
			player2Card1.image = UIImage(named:hands[1].cards[0].cardName)
			player2Card2.image = UIImage(named:hands[1].cards[1].cardName)
		}
		if !players[2].notPlaying {
			player3Card1.image = UIImage(named:hands[2].cards[0].cardName)
			player3Card2.image = UIImage(named:hands[2].cards[1].cardName)
		}
		if !players[3].notPlaying {
			player4Card1.image = UIImage(named:hands[3].cards[0].cardName)
			player4Card2.image = UIImage(named:hands[3].cards[1].cardName)
		}
		computerCard1.image = UIImage(named:hands[4].cards[0].cardName)
		computerCard2.image = UIImage(named:hands[4].cards[1].cardName)
		dealerCard1.image = UIImage(named:"red_joker")
		dealerCard2.image = UIImage(named:hands[5].cards[1].cardName)
	}
	
	@IBOutlet weak var endGameButton: UIButton!
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		var vc:ViewController = segue.destinationViewController as ViewController
		var dealerValue = hands[5].determineValue()
		for n in 0...3 {
			var playerValue = hands[n].determineValue()
			if (playerValue == 21 && hands[n].cards.count == 2) && !(hands[5].cards.count == 2 && dealerValue == 21) {
				players[n].playerPocket += players[n].playerBet * 1.5
			}
			if playerValue < 22 && (playerValue < dealerValue || dealerValue > 21) {
				players[n].playerPocket += players[n].playerBet
			}
			else if dealerValue < 22 && (dealerValue < playerValue || playerValue > 21) {
				players[n].playerPocket -= players[n].playerBet
			}
		}
		
		vc.players = players
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	var stands = [Bool]()
    var hands = [Hand(), Hand(), Hand(), Hand(), Hand(), Hand()]
    var shoe = Shoe()
    var players = [Player]()
}