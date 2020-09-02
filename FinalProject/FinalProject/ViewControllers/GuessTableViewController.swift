//
//  GuessTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 1/19/20.
//  Copyright © 2020 Colby Holmstead. All rights reserved.
//

import UIKit
import CoreData

class GuessTableViewController: UITableViewController {
    var appDelegate:AppDelegate!
    var settings: Settings?
    var numberOfPlayers: Int16?
    var serverSetNumber: Int16?
    var games: [Game] = []
    var game: Game?
    var playerNumber: Int16 = 1
    var startingNumber: Int16?
    var endingNumber: Int16?
    var guesses: [Guess] = []
    var guess: Guess?
    var historyArray:[History] = []
    var historyId: Int16 = 0
    
    
    
    
    @IBOutlet var replyLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var playerNumberLabel: UILabel!
    @IBOutlet var startingNumberLabel: UILabel!
    @IBOutlet var endingNumberLabel: UILabel!
    @IBOutlet var guessNumTextFeild: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        games = retrieveGames()
        startingNumber = Int16(settings!.startingNumber)
        endingNumber = Int16(settings!.endingNumber)
        
        startingNumberLabel.text = String(startingNumber!)
        endingNumberLabel.text = String(endingNumber!)
        //        print(games.count)
        errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
    }
    
    
    
    func retrieveGames() -> [Game]{
        
        let context = appDelegate.persistentContainer.viewContext
        do{
            return try context.fetch(Game.fetchRequest())
        }catch let err as NSError{
            fatalError("Unable to Fetch game \(err.description)")
        }
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkForNum()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.playerNumberLabel.text = String(self.playerNumber)
        })
        errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
    }
    func checkForNum() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No AppDelegate Access!")
        }
        let context = appDelegate.persistentContainer.viewContext
        
      
        playerNumberLabel.text = String(playerNumber)
        guard let guessedNumberText = guessNumTextFeild.text, !guessedNumberText.isEmpty else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.errorLabel.isHidden = true
            })
            self.errorLabel.isHidden = false
            guessNumTextFeild.text = nil
            return
        }
        if let guessedNumber = Int(guessedNumberText){
            if guessedNumber < startingNumber! || guessedNumber > endingNumber! {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.errorLabel.isHidden = true
                })
                self.errorLabel.isHidden = false
                guessNumTextFeild.text = nil
            } else {
                //                print(" server set number \(serverSetNumber!)")
                //                print(" number of players \(numberOfPlayers!)")
                //                print(" guessed number  \(guessedNumber)")
                
                if Int16(guessedNumber) == serverSetNumber {
                    
                    //                    print(" number of players   \(numberOfPlayers!)")
                    //                    print(" winner \(playerNumber)")
                    //                    print(" correct number \(serverSetNumber!)")
                    //                    print(Date())
                    //                    for g in guesses{
                    //                        print("player: \(g.playerNumber) guessed \(g.guessedNumber)")
                    //                    }
                    //                    print("number of games saved is \(games.count)")
                    
                          let game = Game(entity: Game.entity(), insertInto: context)
                          
                    let gameId: Int16 = Int16(games.count + 1)
                    
                    // TODO: save game here
                    game.id = gameId
                    game.date = Date()
                    game.numberOfPlayers = numberOfPlayers!
                    game.serverNumber = serverSetNumber!
                    game.winner = playerNumber
                    // loop through the history array and add it to the history of the game.
                    guesses.forEach { guess in
                        let history = History(entity: History.entity(), insertInto: context)
                        history.id = guess.guessId
                        history.guessedNumber = guess.guessedNumber
                        history.playerNumber = guess.playerNumber
                        history.game = game
                        game.addToHistory(history)
                    }
                    appDelegate.saveContext()
                    performSegue(withIdentifier: "WinnerSegue", sender: nil)
                }else if guessedNumber > serverSetNumber! {
                    guess = Guess(guessedNumber: Int16(guessedNumber), playerNumber: playerNumber, guessId: Int16(guesses.count + 1))
//                    print(guesses.count + 1)
                    guesses.append(guess!)
                    endingNumber = Int16(guessedNumber)
                    errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
                    endingNumberLabel.text = String(endingNumber!)
                    if playerNumber < numberOfPlayers!{
                        playerNumber += 1
                    }else {
                        playerNumber = 1
                    }
                    
                    replyLabel.text = "Too High, hand phone to player \(playerNumber)"
                    
                    replyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                        self.replyLabel.isHidden = true
                    })
                    
                    guessNumTextFeild.text = nil
                    self.guessNumTextFeild.isHidden = false
                    //                    for g in guesses{
                    //                        print("player \(g.playerNumber) guessed \(g.guessedNumber)")
                    //                    }
                }else {
                    //first save what just happened
                    
                    guess = Guess(guessedNumber: Int16(guessedNumber), playerNumber: playerNumber, guessId: Int16(guesses.count + 1))
                    guesses.append(guess!)
                    startingNumber = Int16(guessedNumber)
                    errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
                    startingNumberLabel.text = String(startingNumber!)
                    if playerNumber < numberOfPlayers!{
                        playerNumber += 1
                    }else {
                        playerNumber = 1
                    }
                    replyLabel.text = "Too Low, hand phone to player \(playerNumber)"
                    
                    replyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                        self.replyLabel.isHidden = true
                    })
                    guessNumTextFeild.text = nil
                    self.guessNumTextFeild.isHidden = false
                    
                    //                    for g in guesses{
                    //                        print("player \(g.playerNumber) guessed \(g.guessedNumber)")
                    //                    }
                }
            }
        } else{
            errorLabel.isHidden = false
        }
        
    }
    
}
