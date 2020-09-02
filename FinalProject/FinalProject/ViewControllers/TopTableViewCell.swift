//
//  TopTableViewCell.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/30/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {

    @IBOutlet var gameNumberLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var numberOfPlayersLabel: UILabel!
    @IBOutlet var guessedNumberLabel: UILabel!
    @IBOutlet var winnerNumber: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(game: Game){
        guessedNumberLabel.text = String(game.serverNumber)
        numberOfPlayersLabel.text = String(game.numberOfPlayers)
        winnerNumber.text = String(game.winner)
         }
        
        
    
    

}
