//
//  DetailsTableViewCell.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/30/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var playerNumberLabel: UILabel!
    @IBOutlet var gussedNumberLabel: UILabel!
    @IBOutlet var highLowLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(with guess: History){
        playerNumberLabel.text = String(guess.playerNumber)
        gussedNumberLabel.text = String(guess.guessedNumber)
    }
}
