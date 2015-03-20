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
        fuelGauge.layoutSubviews()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFuelGaugeInstantiated() {
        XCTAssertNotNil(self.fuelGauge, "FuelGaugeView not instantiated")
    }
    
    func testBackgroundImageLazyCreated() {
        XCTAssertNotNil(fuelGauge.backgroundImage, "Background image not loaded.")
    }
    
    func testNumberOfSubviews() {
        let numberOfSubviews = fuelGauge.subviews.count
        let expectedNumber = 1
        XCTAssert(numberOfSubviews == expectedNumber,"Number of subviews s/b \(expectedNumber) but is \(numberOfSubviews)")
    }
    
}
