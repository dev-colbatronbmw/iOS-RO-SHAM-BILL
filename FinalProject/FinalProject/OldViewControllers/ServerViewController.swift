////
////  ServerViewController.swift
////  FinalProject
////
////  Created by Colby Holmstead on 11/3/19.
////  Copyright © 2019 Colby Holmstead. All rights reserved.
////
//
//import UIKit
//
//class ServerViewController: UIViewController {
//    
//    @IBOutlet var errorLabel: UILabel!
//    @IBOutlet var serverNumTextField: UITextField!
//    @IBOutlet var serverOKButton: UIButton!
//    @IBOutlet var serverCancelButton: UIBarButtonItem!
//    @IBOutlet var startNumberLabel: UILabel!
//    @IBOutlet var endNumberLabel: UILabel!
//    
//    var settings: Settings?
//    var numberOfPlayers: Int?
//    var serverSetNumber: Int?
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        if let savedSettings = Settings.loadFromFile() {
//            settings = savedSettings
//        } else {
//            settings = Settings.loadSampleSettings()
//        }
//        
//        startNumberLabel.text = String(settings!.startingNumber)
//        endNumberLabel.text = String(settings!.endingNumber)
//        
//        errorLabel.text = "You must enter a number between \(String(settings!.startingNumber)) and \(String(settings!.endingNumber))"
//        
//        
//    }
//    @IBAction func serverOkButtonTapped(_ sender: UIButton) {
//        checkForNum()
//    }
//    func checkForNum(){
//        guard let setNumberText = serverNumTextField.text, !setNumberText.isEmpty else {
//            errorLabel.isHidden = false
//            return
//        }
//        if let setNumber = Int(setNumberText){
//            if setNumber < settings!.startingNumber || setNumber > settings!.endingNumber {
//                errorLabel.isHidden = false
//            } else {
//                serverSetNumber = Int(serverNumTextField.text!)
//                performSegue(withIdentifier: "ServerToGuess", sender: nil)
//            }
//        }else{
//            errorLabel.isHidden = false
//        }
//    }
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        
//        /// pass settings and the server set number to the guess screen
//
//        if segue.identifier == "ServerToGuess"{
//        
//        let  guessViewController = segue.destination as! GuessViewController
//        guessViewController.numberOfPlayers = numberOfPlayers
//        guessViewController.settings = settings
//        guessViewController.serverSetNumber = serverSetNumber
//        }
//
//
//        
//    }
//    
//    
//    
//    
//}
