//
//  FuelGaugeKitTests.swift
//  FuelGaugeKitTests
//
//  Created by Ron Lisle on 3/19/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit
import XCTest

class FuelGaugeKitTests: XCTestCase {
    
    var fuelGauge: FuelGaugeView!
    
    override func setUp() {
        super.setUp()
        fuelGauge = FuelGaugeView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFuelGaugeInstantiated() {
        XCTAssertNotNil(self.fuelGauge, "FuelGaugeView not instantiated")
    }
    
    func testBackgroundImageLoaded() {
        XCTAssertNotNil(fuelGauge.backgroundImage, "Background image not loaded.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
