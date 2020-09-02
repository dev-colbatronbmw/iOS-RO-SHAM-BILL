//
//  History+CoreDataProperties.swift
//  Game
//
//  Created by Colby Holmstead on 3/18/20.
//  Copyright © 2020 Colby Holmstead. All rights reserved.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var guessedNumber: Int16
    @NSManaged public var id: Int16
    @NSManaged public var playerNumber: Int16
    @NSManaged public var game: Game?

}
