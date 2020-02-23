//
//  catRatingsForGreatGoodTests.swift
//  catRatingsForGreatGoodTests
//
//  Created by Amy Shackles on 2/21/20.
//  Copyright © 2020 Amy Shackles. All rights reserved.
//

import XCTest
@testable import catRatingsForGreatGood

class catRatingsForGreatGoodTests: XCTestCase {
    //MARK: Cat Class Tests
    
    // Confirm that the Cat initializer returns a Cat object when passed valid parameters.
    func testCatInitializationSucceeds() {
        // Zero rating
        let zeroRatingCat = Cat.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingCat)
        
        // Highest positive rating
        let positiveRatingCat = Cat.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingCat)
    }
    
    // Confirm that the Cat initialier returns nil when passed a negative rating or an empty name.
    func testCatInitializationFails() {
        // Negative rating
        let negativeRatingCat = Cat.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingCat)
        
        // Rating exceeds maximum
        let largeRatingCat = Cat.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingCat)
         
        // Empty String
        let emptyStringCat = Cat.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringCat)
    }
}
