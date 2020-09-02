//
//  Game+CoreDataProperties.swift
//  Game
//
//  Created by Colby Holmstead on 3/18/20.
//  Copyright © 2020 Colby Holmstead. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var date: Date?
    @NSManaged public var winner: Int16
    @NSManaged public var serverNumber: Int16
    @NSManaged public var id: Int16
    @NSManaged public var numberOfPlayers: Int16
    @NSManaged public var history: NSSet?

}

// MARK: Generated accessors for history
extension Game {

    @objc(addHistoryObject:)
    @NSManaged public func addToHistory(_ value: History)

    @objc(removeHistoryObject:)
    @NSManaged public func removeFromHistory(_ value: History)

    @objc(addHistory:)
    @NSManaged public func addToHistory(_ values: NSSet)

    @objc(removeHistory:)
    @NSManaged public func removeFromHistory(_ values: NSSet)

}
