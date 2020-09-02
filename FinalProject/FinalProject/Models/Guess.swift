//
//  Round.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/27/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import Foundation

class Guess: Codable {
 
    var guessedNumber:Int16
    var playerNumber: Int16
    var guessId:Int16

    init(
             guessedNumber:Int16,
             playerNumber: Int16,
             guessId:Int16
    )

    {
        self.guessedNumber = guessedNumber
        self.playerNumber = playerNumber
        self.guessId = guessId
    }

}
