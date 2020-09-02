//
//  HistoryTableViewCell.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/29/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit
import CoreData
class HistoryTableViewCell: UITableViewCell {

    @IBOutlet var gameNumberLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with game: Game){
        
        
        
        gameNumberLabel!.text = String(game.id)
       let formatter = DateFormatter()
   
       
       formatter.dateFormat = "MM-dd-yyyy"

        let myString = formatter.string(from: game.date ?? Date()) // string purpose I add here
       // convert your string to date
//       let yourDate = formatnoter.date(from: myString)
//       //then again set the date format whhich type of output you need
//       // again convert your date to string
//       let myStringafd = formatter.string(from: yourDate!)

    
        dateLabel!.text = myString
        
        
        
        
    }
}
