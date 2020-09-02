////
////  GuessViewController.swift
////  FinalProject
////
////  Created by Colby Holmstead on 11/3/19.
////  Copyright © 2019 Colby Holmstead. All rights reserved.
////
//
//import UIKit
//
//class GuessViewController: UIViewController {
//    
//    @IBOutlet var guessCancelButton: UIBarButtonItem!
//    
//    var settings: Settings?
//    var numberOfPlayers: Int?
//    var serverSetNumber: Int?
//    
//    
//    
//    @IBOutlet var replyLabel: UILabel!
//    @IBOutlet var errorLabel: UILabel!
//    @IBOutlet var playerNumberLabel: UILabel!
//    @IBOutlet var startingNumberLabel: UILabel!
//    @IBOutlet var endingNumberLabel: UILabel!
//    @IBOutlet var guessNumTextFeild: UITextField!
//    
//    //    var game: Game?
//    var games: [Game] = []
//    var playerNumber: Int = 1
//    var startingNumber: Int?
//    var endingNumber: Int?
//    var guesses: [Guess] = []
//    var guess: Guess?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        startingNumber = settings!.startingNumber
//        endingNumber = settings!.endingNumber
//        startingNumberLabel.text = String(startingNumber!)
//        endingNumberLabel.text = String(endingNumber!)
//        errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
//        
//        
//    }
//    
//    
//    @IBAction func okButtonTapped(_ sender: Any) {
//        
//        
//        
//        
//        
//        
//        checkForNum()
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//            self.playerNumberLabel.text = String(self.playerNumber)
//            
//        })
//        
//        
//        errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    func checkForNum() {
//        
//        
//        playerNumberLabel.text = String(playerNumber)
//        
//        guard let guessedNumberText = guessNumTextFeild.text, !guessedNumberText.isEmpty else {
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//                self.errorLabel.isHidden = true
//            })
//            self.errorLabel.isHidden = false
//            guessNumTextFeild.text = nil
//            return
//            
//            
//        }
//        if let guessedNumber = Int(guessedNumberText){
//            
//            
//            
//            if guessedNumber < startingNumber! || guessedNumber > endingNumber! {
//                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//                    self.errorLabel.isHidden = true
//                })
//                self.errorLabel.isHidden = false
//                guessNumTextFeild.text = nil
//                
//                
//            } else {
//                
//                
//                
//                print(" server set number \(serverSetNumber!)")
//                print(" number of players \(numberOfPlayers!)")
//                print(" guessed number  \(guessedNumber)")
//                
//                
//                if guessedNumber == serverSetNumber {
//                    
//                    print(" number of players   \(numberOfPlayers!)")
//                    print(" winner \(playerNumber)")
//                    print(" correct number \(serverSetNumber!)")
//                    print(Date())
//                    for g in guesses{
//                        print("player: \(g.playerNumber) guessed \(g.guessedNumber)")
//                    }
//                    let df = DateFormatter()
//                    df.dateFormat =  "MM-dd-yyy"
//                    let now = df.string(from: Date())
//                    
//                    
//                    //                    load in all the games
//                    //                    append the array with the new game
//                    //                    save all the data
//                    
//                    if let savedGames = Game.loadFromFile() {
//                        games = savedGames
//                    } else {
//                        games = Game.loadSampleGame()
//                    }
//                    print("number of games saved is \(games.count)")
//                    //append
//                    let gameId: Int = games.count + 1
//                    let thisGame = Game(serverNumber: serverSetNumber, numberOfPlayers: numberOfPlayers!, playerThatWon: playerNumber, gameId: gameId, gameHistory: guesses, date: now)
//                    games.append(thisGame)
//                    Game.saveToFile(games: games)
//                    // collect all of the information here
//                    // save the whole thing
//                    performSegue(withIdentifier: "WinnerSegue", sender: nil)
//                    
//                }else if guessedNumber > serverSetNumber! {
//                    //first save what just happened
//                    guess = Guess(guessedNumber: guessedNumber, playerNumber: playerNumber)
//                    guesses.append(guess!)
//                    endingNumber = guessedNumber
//                    errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
//                    endingNumberLabel.text = String(endingNumber!)
//                    if playerNumber < numberOfPlayers!{
//                        playerNumber += 1
//                    }else {
//                        playerNumber = 1
//                    }
//                    
//                    replyLabel.text = "Too High, hand phone to player \(playerNumber)"
//                    
//                    replyLabel.isHidden = false
//                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//                        self.replyLabel.isHidden = true
//                    })
//                    
//                    guessNumTextFeild.text = nil
//                    self.guessNumTextFeild.isHidden = false
//                    for g in guesses{
//                        print("player \(g.playerNumber) guessed \(g.guessedNumber)")
//                    }
//                }else {
//                    //first save what just happened
//                    guess = Guess(guessedNumber: guessedNumber, playerNumber: playerNumber)
//                    guesses.append(guess!)
//                    startingNumber = guessedNumber
//                    errorLabel.text = "You must enter a number between \(String(startingNumber!)) and \(String(endingNumber!))"
//                    startingNumberLabel.text = String(startingNumber!)
//                    if playerNumber < numberOfPlayers!{
//                        playerNumber += 1
//                    }else {
//                        playerNumber = 1
//                    }
//                    replyLabel.text = "Too Low, hand phone to player \(playerNumber)"
//                    
//                    replyLabel.isHidden = false
//                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//                        self.replyLabel.isHidden = true
//                    })
//                    guessNumTextFeild.text = nil
//                    self.guessNumTextFeild.isHidden = false
//                    
//                    for g in guesses{
//                        print("player \(g.playerNumber) guessed \(g.guessedNumber)")
//                    }
//                }
//            }
//        } else{
//            
//            
//            
//            errorLabel.isHidden = false
//            
//        }
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//    
//    
//}
