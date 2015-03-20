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
    
    func testFuelGaugeInstantiated() {
        XCTAssertNotNil(self.fuelGauge, "FuelGaugeView not instantiated")
    }
    
    func testBackgroundViewCreated() {
        XCTAssertNotNil(fuelGauge.backgroundView, "Background view not created.")
    }
    
    func testNumberOfSubviews() {
        let numberOfSubviews = fuelGauge.subviews.count
        let expectedNumber = 3
        XCTAssert(numberOfSubviews == expectedNumber,"Number of subviews s/b \(expectedNumber) but is \(numberOfSubviews)")
    }
    
    func testBackgroundSubviewSizedToBounds() {
        let bgrect = fuelGauge.backgroundView.frame
        let expectedRect = fuelGauge.frame
        XCTAssertEqual(bgrect, expectedRect, "Background frame expected to be \(expectedRect) but is \(bgrect)")
    }
    
    func testBackgroundImageLoaded() {
        let bgimage = fuelGauge.backgroundView.image
        XCTAssertNotNil(bgimage, "Background image not loaded")
    }
    
    func testNeedleViewCreated() {
        XCTAssertNotNil(fuelGauge.needleView, "Needle view not created.")
    }
    
    func testNeedleSubviewSizedToBounds() {
        let needleRect = fuelGauge.needleView.frame
        let expectedRect = fuelGauge.frame
        XCTAssertEqual(needleRect, expectedRect, "Needle frame expected to be \(expectedRect) but is \(needleRect)")
    }

    func testNeedleImageLoaded() {
        let needleImage = fuelGauge.needleView.image
        XCTAssertNotNil(needleImage, "Needle image not loaded")
    }
    
    func testShadowViewCreated() {
        XCTAssertNotNil(fuelGauge.shadowView, "Shadow view not created.")
    }
    
    func testShadowSubviewSizedToBounds() {
        let shadowRect = fuelGauge.shadowView.frame
        let expectedRect = fuelGauge.frame
        XCTAssertEqual(shadowRect, expectedRect, "Shadow frame expected to be \(expectedRect) but is \(shadowRect)")
    }
    
    func testShadowImageLoaded() {
        let shadowImage = fuelGauge.shadowView.image
        XCTAssertNotNil(shadowImage, "Shadow image not loaded")
    }
    
    func testFuelLevelInitially0() {
        let level = fuelGauge.fuelLevel
        XCTAssertEqual(level, Float(0.0), "Initial fuel level expected to be 0 but is \(level)")
    }
    
    func testCalculateRotationRadiansForFuelLevelHalfIsZero() {
        let level: Float = 0.5
        let angle = fuelGauge.calculateRotationRadiansForFuelLevel(level)
        let expectedAngle: Float = 0.0
        XCTAssertEqualWithAccuracy(angle, expectedAngle, 0.0001, "Angle: \(angle) not equal to expected \(expectedAngle)")
    }
}
