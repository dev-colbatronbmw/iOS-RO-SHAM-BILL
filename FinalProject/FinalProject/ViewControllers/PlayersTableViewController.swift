//
//  PlayersTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 1/19/20.
//  Copyright © 2020 Colby Holmstead. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
       var settings: Settings?
       var numberOfPlayers: Int?
       var serverSetNumber: Int?
       
    @IBOutlet var playerNumTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
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
       func checkForNum(){
           guard let playerNumberText = playerNumTextField.text, !playerNumberText.isEmpty else {
               errorLabel.isHidden = false
               return
           }
           if let playerNumber = Int(playerNumberText){
               if playerNumber < 2 || playerNumber > 50 {
                   errorLabel.isHidden = false
               } else {
                   performSegue(withIdentifier: "playerToServer", sender: nil)
               }
           }else{
               errorLabel.isHidden = false
           }
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "playerToServer"{
                 let serverTableViewController = segue.destination as! ServerTableViewController
            serverTableViewController.numberOfPlayers = Int16(playerNumTextField.text!)
             }
         }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         checkForNum()
    }
}
