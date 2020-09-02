//
//  HistoryTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/29/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {
    var appDelegate:AppDelegate!
    var games: [Game] = []
    var game: Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        games = retrieveGames()
        //        if let savedGames = Game.loadFromFile() {
        //                                        games = savedGames
        //                                    } else {
        //                              games = Game.loadSampleGame()
        //                                    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return games.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! HistoryTableViewCell
        
        let game = games[indexPath.row]
        
    
        cell.update(with: game)
        
        cell.showsReorderControl = true
        
        if ((indexPath.row % 2) == 0){
            cell.backgroundColor = #colorLiteral(red: 0.5976806955, green: 1, blue: 0.6850179537, alpha: 1)
        }else {
            
            cell.backgroundColor = #colorLiteral(red: 0.7785107493, green: 0.9457229972, blue: 0.861798048, alpha: 1)
        }
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           
            
            let context = appDelegate.persistentContainer.viewContext
                      
                      let game = games[indexPath.row]
                      context.delete(game)
                      
                      
                      appDelegate.saveContext()
                      games.remove(at: indexPath.row)
                                 tableView.deleteRows(at: [indexPath], with: .fade)
                      self.games = retrieveGames()
            //            Game.saveToFile(games: games)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHistoryDetailSegue"{
            let indexPath = tableView.indexPathForSelectedRow!
            let game = games[indexPath.row]
            let historyDetailTableViewController = segue.destination as! HistoryDetailTableViewController
            historyDetailTableViewController.game = game
        }
    }
    
    
     
    
    
}
