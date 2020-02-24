//
//  Cat.swift
//  catRatingsForGreatGood
//
//  Created by Amy Shackles on 2/22/20.
//  Copyright © 2020 Amy Shackles. All rights reserved.
//

import UIKit
import os.log


// NSObject is a base class that defines a basic interface to the runtime system
// In order to conform to NSCoding, need to also subclass NSObject
class Cat: NSObject, NSCoding {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    
    // Uses the file manager's urls method to look for this app's documents directory.  This is a directory where an app can save data for the user
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL =  DocumentsDirectory.appendingPathComponent("cats")
    
    // MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required.  If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Cat object", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Cat, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
}
