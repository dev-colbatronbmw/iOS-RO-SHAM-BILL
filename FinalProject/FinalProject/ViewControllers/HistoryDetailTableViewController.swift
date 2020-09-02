//
//  HistoryDetailTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/29/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit
import CoreData

class HistoryDetailTableViewController: UITableViewController {
    @IBOutlet weak var detailNavigationHeader: UINavigationItem!
     var appDelegate:AppDelegate!
    var game: Game?
    var guesses: [History] = []
    var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
          appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        guesses = retrieveHistory()
        
//        detailNavigationHeader.title = "Game: \(game!.gameId)  Played on \(game!.date)"
//        print(((game?.history!.count)!))
    }
    
    func retrieveHistory() -> [History]{
          
          let context = appDelegate.persistentContainer.viewContext
          do{
            return try context.fetch(History.fetchRequest()) as! [History]
          }catch let err as NSError{
              fatalError("Unable to Fetch game \(err.description)")
          }
          
      }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return ((game?.history!.count)!)
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Here is how the game went"
        }else{
            return ""
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCellIdentifier", for: indexPath) as! TopTableViewCell
            cell.update(game: game!)
                 return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHistoryCellIdentifier", for: indexPath) as! DetailsTableViewCell
            
            if ((indexPath.row % 2) == 0){
                cell.backgroundColor = #colorLiteral(red: 0.5976806955, green: 1, blue: 0.6850179537, alpha: 1)
            }else {
            cell.backgroundColor = #colorLiteral(red: 0.7785107493, green: 0.9457229972, blue: 0.861798048, alpha: 1)
            }
//            let guess = ()
            cell.update(with: guesses[indexPath.row])
                 return cell
            }
        }
}
