////
////  PlayersViewController.swift
////  FinalProject
////
////  Created by Colby Holmstead on 11/3/19.
////  Copyright © 2019 Colby Holmstead. All rights reserved.
////
//
//import UIKit
//
//class PlayersViewController: UIViewController {
//    
//    @IBOutlet var playersCancelButton: UIBarButtonItem!
//    @IBOutlet var playerNumTextField: UITextField!
//    @IBOutlet var okButton: UIButton!
//    @IBOutlet var errorLabel: UILabel!
//    
//
//    var numberOfActualPlayers:Int = 0
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    @IBAction func playNumButtonTapped(_ sender: UIButton) {
//        checkForNum()
//    }
//    
//    
//    
//    func checkForNum(){
//        guard let playerNumberText = playerNumTextField.text, !playerNumberText.isEmpty else {
//            errorLabel.isHidden = false
//            return
//        }
//        if let playerNumber = Int(playerNumberText){
//            if playerNumber < 2 || playerNumber > 50 {
//                errorLabel.isHidden = false
//            } else {
//                performSegue(withIdentifier: "playerToServer", sender: nil)
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
//        if segue.identifier == "playerToServer"{
//            let serverViewController = segue.destination as! ServerViewController
//            serverViewController.numberOfPlayers = Int(playerNumTextField.text!)
//            
//        }
//        
//        
//    }
//    
//    
//    
//    
//}
