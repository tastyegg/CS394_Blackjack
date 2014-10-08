//
//  ViewController.swift
//  testAbus
//
//  Created by Abus on 10/7/14.
//  Copyright (c) 2014 Abus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    var gametable: GameTable?
    
    @IBOutlet weak var mainText: UITextView!
    @IBOutlet weak var deckCounter: UILabel!
    @IBOutlet weak var deckCountStepper: UIStepper!
    @IBOutlet weak var p1bet: UITextField!
    @IBOutlet weak var p2bet: UITextField!
    @IBOutlet weak var p3bet: UITextField!
    @IBOutlet weak var p4bet: UITextField!
    @IBOutlet weak var p5bet: UITextField!
    @IBOutlet weak var p6bet: UITextField!
    @IBOutlet weak var playerCountStepper: UIStepper!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    @IBAction func hit(sender: UIButton) {
        gametable!.hit()
    }
    
    @IBAction func stand(sender: UIButton) {
        gametable!.stand()
    }
    
    @IBAction func playersChange(sender: UIStepper) {
        p1bet.hidden = sender.value < 1
        p2bet.hidden = sender.value < 2
        p3bet.hidden = sender.value < 3
        p4bet.hidden = sender.value < 4
        p5bet.hidden = sender.value < 5
        p6bet.hidden = sender.value < 6
    }
    @IBAction func deckChange(sender: UIStepper) {
        deckCounter.text = "\(sender.value) Decks"
    }
    
    @IBAction func beginGame(sender: UIButton) {
        hitButton.hidden = false
        standButton.hidden = false
        deckCountStepper.hidden = true
        deckCounter.hidden = true
        playerCountStepper.hidden = true
        
        gametable = GameTable(numberOfPlayers: Int(playerCountStepper.value), deckCount: Int(deckCountStepper.value), textOption: mainText, masterUI: self)
        
        //Transfer bet value to player
        var playerCount = gametable!.players.count
        if playerCount >= 1 {
            gametable!.players[0].bet = p1bet.text.toInt()!
            if playerCount >= 2 {
                gametable!.players[1].bet = p2bet.text.toInt()!
                if playerCount >= 3 {
                    gametable!.players[2].bet = p3bet.text.toInt()!
                    if playerCount >= 4 {
                        gametable!.players[3].bet = p4bet.text.toInt()!
                        if playerCount >= 5 {
                            gametable!.players[4].bet = p5bet.text.toInt()!
                            if playerCount >= 6 {
                                gametable!.players[5].bet = p6bet.text.toInt()!
                            }
                        }
                    }
                }
            }
        }
    }
    
    func gameOver() {
        var playerCount = gametable!.players.count
        if playerCount >= 1 {
            p1bet.placeholder = "P1 : $\(gametable!.players[0].money)"
            if playerCount >= 2 {
                p2bet.placeholder = "P1 : $\(gametable!.players[1].money)"
                if playerCount >= 3 {
                    p2bet.placeholder = "P1 : $\(gametable!.players[2].money)"
                    if playerCount >= 4 {
                        p3bet.placeholder = "P1 : $\(gametable!.players[3].money)"
                        if playerCount >= 5 {
                            p4bet.placeholder = "P1 : $\(gametable!.players[4].money)"
                            if playerCount >= 6 {
                                p5bet.placeholder = "P1 : $\(gametable!.players[5].money)"
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after load8ing the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

