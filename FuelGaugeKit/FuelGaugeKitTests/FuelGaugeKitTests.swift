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
        fuelGauge.frame = CGRect(x: 0.0, y: 0.0, width: 100, height: 100)
        fuelGauge.layoutSubviews()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFuelGaugeInstantiated() {
        XCTAssertNotNil(self.fuelGauge, "FuelGaugeView not instantiated")
    }
    
    func testBackgroundImageViewCreated() {
        XCTAssertNotNil(fuelGauge.backgroundImage, "Background view not created.")
    }
    
    func testNumberOfSubviews() {
        let numberOfSubviews = fuelGauge.subviews.count
        let expectedNumber = 3
        XCTAssert(numberOfSubviews == expectedNumber,"Number of subviews s/b \(expectedNumber) but is \(numberOfSubviews)")
    }
    
    func testBackgroundSubviewSizedToBounds() {
        let bgrect = fuelGauge.backgroundImage.frame
        let expectedRect = fuelGauge.frame
        XCTAssertEqual(bgrect, expectedRect, "Background frame expected to be \(expectedRect) but is \(bgrect)")
    }
    
    func testBackgroundImageLoaded() {
        let bgimage = fuelGauge.backgroundImage.image
        XCTAssertNotNil(bgimage, "Background image not loaded")
    }
    
    func testNeedleImageViewCreated() {
        XCTAssertNotNil(fuelGauge.needleImage, "Needle view not created.")
    }
    
    func testNeedleSubviewSizedToBounds() {
        let needleRect = fuelGauge.needleImage.frame
        let expectedRect = fuelGauge.frame
        XCTAssertEqual(needleRect, expectedRect, "Needle frame expected to be \(expectedRect) but is \(needleRect)")
    }

    func testNeedleImageLoaded() {
        let needleImage = fuelGauge.needleImage.image
        XCTAssertNotNil(needleImage, "Needle image not loaded")
    }
    
    func testShadowImageViewCreated() {
        XCTAssertNotNil(fuelGauge.shadowView, "Shadow view not created.")
    }
    
}
