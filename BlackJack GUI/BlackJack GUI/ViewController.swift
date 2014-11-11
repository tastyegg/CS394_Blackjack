//
//  ViewController.swift
//  BlackJack GUI
//
//  Created by Abus on 11/2/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player1BetAmount: UITextField!
    @IBOutlet weak var player1MaxAmount: UITextField!
    @IBOutlet weak var player1JoinButton: UIButton!
    @IBOutlet weak var player1LeaveButton: UIButton!
    @IBOutlet weak var player1ZeroBet: UIButton!
    @IBOutlet weak var player1IncrementBet: UIButton!
    @IBOutlet weak var player1Increment10Bet: UIButton!
    @IBOutlet weak var player1Increment100Bet: UIButton!
    @IBOutlet weak var player1MaxBet: UIButton!
    @IBAction func player1ZeroBet(sender: AnyObject) {
        players[0].playerBet = 0
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
    }
    @IBAction func player1IncrementBet(sender: AnyObject) {
        players[0].playerBet += 1
        if players[0].playerBet > players[0].playerPocket{
            players[0].playerBet = players[0].playerPocket
        }
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
    }
    @IBAction func player1Increment10Bet(sender: AnyObject) {
        players[0].playerBet += 10
        if players[0].playerBet > players[0].playerPocket{
            players[0].playerBet = players[0].playerPocket
        }
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
    }
    @IBAction func player1Increment100Bet(sender: AnyObject) {
        players[0].playerBet += 100
        if players[0].playerBet > players[0].playerPocket{
            players[0].playerBet = players[0].playerPocket
        }
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
    }
    @IBAction func player1MaxBet(sender: AnyObject) {
        players[0].playerBet = players[0].playerPocket
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
    }
    @IBAction func player1Join(sender: AnyObject) {
        players[0].notPlaying = false
        
        toggleHidden()
        checkPlayers()
    }
    @IBAction func player1Leave(sender: AnyObject) {
        players[0].playerBet = 0
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
        players[0].notPlaying = true
        
        toggleHidden()
        checkPlayers()
    }
    
    @IBOutlet weak var player2Name: UITextField!
    @IBOutlet weak var player2BetAmount: UITextField!
    @IBOutlet weak var player2MaxAmount: UITextField!
    @IBOutlet weak var player2JoinButton: UIButton!
    @IBOutlet weak var player2LeaveButton: UIButton!
    @IBOutlet weak var player2ZeroBet: UIButton!
    @IBOutlet weak var player2IncrementBet: UIButton!
    @IBOutlet weak var player2Increment10Bet: UIButton!
    @IBOutlet weak var player2Increment100Bet: UIButton!
    @IBOutlet weak var player2MaxBet: UIButton!
    @IBAction func player2ZeroBet(sender: AnyObject) {
        players[1].playerBet = 0
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
    }
    @IBAction func player2IncrementBet(sender: AnyObject) {
        players[1].playerBet += 1
        if players[1].playerBet > players[1].playerPocket{
            players[1].playerBet = players[1].playerPocket
        }
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
    }
    @IBAction func player2Increment10Bet(sender: AnyObject) {
        players[1].playerBet += 10
        if players[1].playerBet > players[1].playerPocket{
            players[1].playerBet = players[1].playerPocket
        }
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
    }
    @IBAction func player2Increment100Bet(sender: AnyObject) {
        players[1].playerBet += 100
        if players[1].playerBet > players[1].playerPocket{
            players[1].playerBet = players[1].playerPocket
        }
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
    }
    @IBAction func player2MaxBet(sender: AnyObject) {
        players[1].playerBet = players[1].playerPocket
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
    }
    @IBAction func player2Join(sender: AnyObject) {
        players[1].notPlaying = false
        
        toggleHidden()
        checkPlayers()
    }
    @IBAction func player2Leave(sender: AnyObject) {
        players[1].playerBet = 0
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
        players[1].notPlaying = true
        
        toggleHidden()
        checkPlayers()
    }
    
    @IBOutlet weak var player3Name: UITextField!
    @IBOutlet weak var player3BetAmount: UITextField!
    @IBOutlet weak var player3MaxAmount: UITextField!
    @IBOutlet weak var player3JoinButton: UIButton!
    @IBOutlet weak var player3LeaveButton: UIButton!
    @IBOutlet weak var player3ZeroBet: UIButton!
    @IBOutlet weak var player3IncrementBet: UIButton!
    @IBOutlet weak var player3Increment10Bet: UIButton!
    @IBOutlet weak var player3Increment100Bet: UIButton!
    @IBOutlet weak var player3MaxBet: UIButton!
    @IBAction func player3ZeroBet(sender: AnyObject) {
        players[2].playerBet = 0
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
    }
    @IBAction func player3IncrementBet(sender: AnyObject) {
        players[2].playerBet += 1
        if players[2].playerBet > players[2].playerPocket{
            players[2].playerBet = players[2].playerPocket
        }
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
    }
    @IBAction func player3Increment10Bet(sender: AnyObject) {
        players[2].playerBet += 10
        if players[2].playerBet > players[2].playerPocket{
            players[2].playerBet = players[2].playerPocket
        }
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
    }
    @IBAction func player3Increment100Bet(sender: AnyObject) {
        players[2].playerBet += 100
        if players[2].playerBet > players[2].playerPocket{
            players[2].playerBet = players[2].playerPocket
        }
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
    }
    @IBAction func player3MaxBet(sender: AnyObject) {
        players[2].playerBet = players[2].playerPocket
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
    }
    @IBAction func player3Join(sender: AnyObject) {
        players[2].notPlaying = false
		
        toggleHidden()
        checkPlayers()
    }
    @IBAction func player3Leave(sender: AnyObject) {
        players[2].playerBet = 0
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
        players[2].notPlaying = true
		
        toggleHidden()
        checkPlayers()
    }
    
    @IBOutlet weak var player4Name: UITextField!
    @IBOutlet weak var player4BetAmount: UITextField!
    @IBOutlet weak var player4MaxAmount: UITextField!
    @IBOutlet weak var player4JoinButton: UIButton!
    @IBOutlet weak var player4LeaveButton: UIButton!
    @IBOutlet weak var player4ZeroBet: UIButton!
    @IBOutlet weak var player4IncrementBet: UIButton!
    @IBOutlet weak var player4Increment10Bet: UIButton!
    @IBOutlet weak var player4Increment100Bet: UIButton!
    @IBOutlet weak var player4MaxBet: UIButton!
    @IBAction func player4ZeroBet(sender: AnyObject) {
        players[3].playerBet = 0
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"

    }
    @IBAction func player4IncrementBet(sender: AnyObject) {
        players[3].playerBet += 1
        if players[3].playerBet > players[3].playerPocket{
            players[3].playerBet = players[3].playerPocket
        }
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
    }
    @IBAction func player4Increment10Bet(sender: AnyObject) {
        players[3].playerBet += 10
        if players[3].playerBet > players[3].playerPocket{
            players[3].playerBet = players[3].playerPocket
        }
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
    }
    @IBAction func player4Increment100Bet(sender: AnyObject) {
        players[3].playerBet += 100
        if players[3].playerBet > players[3].playerPocket{
            players[3].playerBet = players[3].playerPocket
        }
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
    }
    @IBAction func player4MaxBet(sender: AnyObject) {
        players[3].playerBet = players[3].playerPocket
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
    }
    @IBAction func player4Join(sender: AnyObject) {
        players[3].notPlaying = false
		
        toggleHidden()
        checkPlayers()
    }
    @IBAction func player4Leave(sender: AnyObject) {
        players[3].playerBet = 0
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
        players[3].notPlaying = true
		
        toggleHidden()
        checkPlayers()
    }
	
	func toggleHidden() {
        player1Name.hidden = players[0].notPlaying
        player1BetAmount.hidden = players[0].notPlaying
        player1MaxAmount.hidden = players[0].notPlaying
        player1JoinButton.hidden = !players[0].notPlaying
        player1LeaveButton.hidden = players[0].notPlaying
        player1ZeroBet.hidden = players[0].notPlaying
        player1IncrementBet.hidden = players[0].notPlaying
        player1Increment10Bet.hidden = players[0].notPlaying
        player1Increment100Bet.hidden = players[0].notPlaying
        player1MaxBet.hidden = players[0].notPlaying
        player2Name.hidden = players[1].notPlaying
        player2BetAmount.hidden = players[1].notPlaying
        player2MaxAmount.hidden = players[1].notPlaying
        player2JoinButton.hidden = !players[1].notPlaying
        player2LeaveButton.hidden = players[1].notPlaying
        player2ZeroBet.hidden = players[1].notPlaying
        player2IncrementBet.hidden = players[1].notPlaying
        player2Increment10Bet.hidden = players[1].notPlaying
        player2Increment100Bet.hidden = players[1].notPlaying
        player2MaxBet.hidden = players[1].notPlaying
		player3Name.hidden = players[2].notPlaying
		player3BetAmount.hidden = players[2].notPlaying
		player3MaxAmount.hidden = players[2].notPlaying
		player3JoinButton.hidden = !players[2].notPlaying
		player3LeaveButton.hidden = players[2].notPlaying
		player3ZeroBet.hidden = players[2].notPlaying
		player3IncrementBet.hidden = players[2].notPlaying
		player3Increment10Bet.hidden = players[2].notPlaying
		player3Increment100Bet.hidden = players[2].notPlaying
		player3MaxBet.hidden = players[2].notPlaying
		player4Name.hidden = players[3].notPlaying
		player4BetAmount.hidden = players[3].notPlaying
		player4MaxAmount.hidden = players[3].notPlaying
		player4JoinButton.hidden = !players[3].notPlaying
		player4LeaveButton.hidden = players[3].notPlaying
		player4ZeroBet.hidden = players[3].notPlaying
		player4IncrementBet.hidden = players[3].notPlaying
		player4Increment10Bet.hidden = players[3].notPlaying
		player4Increment100Bet.hidden = players[3].notPlaying
		player4MaxBet.hidden = players[3].notPlaying
	}
	
    @IBOutlet weak var startPlayButton: UIButton!
    func checkPlayers() {
        var playerNumber = 0
        for index in 0...3 {
            if !players[index].notPlaying {
                playerNumber++
            }
        }
        startPlayButton.hidden = playerNumber == 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player1BetAmount.text = "Bet: $\(players[0].playerBet)"
        player1MaxAmount.text = "Max: $\(players[0].playerPocket)"
        player2BetAmount.text = "Bet: $\(players[1].playerBet)"
        player2MaxAmount.text = "Max: $\(players[1].playerPocket)"
        player3BetAmount.text = "Bet: $\(players[2].playerBet)"
        player3MaxAmount.text = "Max: $\(players[2].playerPocket)"
        player4BetAmount.text = "Bet: $\(players[3].playerBet)"
        player4MaxAmount.text = "Max: $\(players[3].playerPocket)"
		
		toggleHidden()
		checkPlayers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var gvc:GameViewController = segue.destinationViewController as GameViewController
        players[0].playerName = player1Name.text
        players[1].playerName = player2Name.text
        players[2].playerName = player3Name.text
        players[3].playerName = player4Name.text

        gvc.players = players
    }
    
    
    var players = [Player(playerName: "Player 1"), Player(playerName: "Player 2"), Player(playerName: "Player 3"), Player(playerName: "Player 4")]
}

