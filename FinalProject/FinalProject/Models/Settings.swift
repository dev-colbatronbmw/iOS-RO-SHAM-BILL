//
//  Game.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/26/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import Foundation


struct Settings: Codable {
    
    var startingNumber: Int
    var endingNumber: Int
    
    init(startingNumber: Int, endingNumber: Int){
        self.startingNumber = startingNumber
        self.endingNumber = endingNumber
    }
    
    
    
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = documentDirectory.appendingPathComponent("settings").appendingPathExtension("plist")
    
    
    
    
    
    static func loadSampleSettings() -> Settings{
        
        return Settings(startingNumber: 1, endingNumber: 1000)
        
    }
        
        
        
     static func saveToFile(settings: Settings){
            
            let propertyListEncoder = PropertyListEncoder()
            let codedSettings = try? propertyListEncoder.encode(settings)
            
            try? codedSettings?.write(to: ArchiveURL, options: .noFileProtection)
            
            
        }
        
        
       static func loadFromFile() -> Settings? {
            
            guard let codedSettings = try? Data(contentsOf: ArchiveURL) else { return nil }
            
            let propertyListDecoder = PropertyListDecoder()
            
            return try? propertyListDecoder.decode(Settings.self, from: codedSettings)
            
            
        }
        
        
        
    }
    
    
    


