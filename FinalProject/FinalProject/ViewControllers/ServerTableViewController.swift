//
//  ServerTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 1/19/20.
//  Copyright © 2020 Colby Holmstead. All rights reserved.
//

import UIKit

class ServerTableViewController: UITableViewController {
    @IBOutlet var startNumLabel: UILabel!
    @IBOutlet var endNumLabel: UILabel!
    @IBOutlet var serverNumTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    var settings: Settings?
    var numberOfPlayers: Int16?
    var serverSetNumber: Int16?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedSettings = Settings.loadFromFile() {
               settings = savedSettings
           } else {
               settings = Settings.loadSampleSettings()
           }
           
           startNumLabel.text = String(settings!.startingNumber)
           endNumLabel.text = String(settings!.endingNumber)
           
           errorLabel.text = "You must enter a number between \(String(settings!.startingNumber)) and \(String(settings!.endingNumber))"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
       }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         /// pass settings and the server set number to the guess screen

         if segue.identifier == "ServerToGuess"{
         
         let  guessTableViewController = segue.destination as! GuessTableViewController
         guessTableViewController.numberOfPlayers = numberOfPlayers
         guessTableViewController.settings = settings
         guessTableViewController.serverSetNumber = serverSetNumber
         }
     }
    func checkForNum(){
        guard let setNumberText = serverNumTextField.text, !setNumberText.isEmpty else {
            errorLabel.isHidden = false
            return
        }
        if let setNumber = Int(setNumberText){
            if setNumber < settings!.startingNumber || setNumber > settings!.endingNumber {
                errorLabel.isHidden = false
            } else {
                serverSetNumber = Int16(serverNumTextField.text!)
                performSegue(withIdentifier: "ServerToGuess", sender: nil)
            }
        }else{
            errorLabel.isHidden = false
        }
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
