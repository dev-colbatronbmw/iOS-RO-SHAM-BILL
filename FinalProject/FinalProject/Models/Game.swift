//
//  Game.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/27/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import Foundation

//
//
//class Game: Codable {
//
//    let serverNumber: Int?
//    var numberOfPlayers: Int
//    var playerThatWon: Int
//    var gameId: Int
//    var gameHistory: [Guess]?
//    var date: String
//
//    init(  serverNumber: Int?,
//           numberOfPlayers: Int,
//           playerThatWon: Int,
//           gameId: Int,
//        gameHistory: [Guess],
//        date: String
//        ){
//
//        self.serverNumber = serverNumber
//        self.numberOfPlayers = numberOfPlayers
//        self.playerThatWon = playerThatWon
//        self.gameId = gameId
//        self.gameHistory = gameHistory
//        self.date = date
//
//
//    }
//
//
//    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//    static let ArchiveURL = documentDirectory.appendingPathComponent("games").appendingPathExtension("plist")
//
//
//    static func loadSampleGame() -> [Game]{
//        return [Game(serverNumber: 50, numberOfPlayers: 2, playerThatWon: 1, gameId: 1, gameHistory: [
//            Guess(guessedNumber: 12, playerNumber: 1),
//            Guess(guessedNumber: 25, playerNumber: 2),
//            Guess(guessedNumber: 50, playerNumber: 1)
//
//        ], date: "11-28-2019")]
//    }
//
//
//
//   static func saveToFile(games: [Game]){
//
//        let propertyListEncoder = PropertyListEncoder()
//        let codedGames = try? propertyListEncoder.encode(games)
//         try? codedGames?.write(to: ArchiveURL, options: .noFileProtection)
//
//
//    }
//
//    static func loadFromFile() -> [Game]? {
//
//        guard let codedGames = try? Data(contentsOf: ArchiveURL) else { return nil }
//
//               let propertyListDecoder = PropertyListDecoder()
//
//               return try? propertyListDecoder.decode(Array<Game>.self, from: codedGames)
//
//
//    }
//
//}
