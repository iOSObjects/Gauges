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
    
    func testNeedleSubviewSizedToBoundsAdjustingForMinus120Rotation() {
        let needleRect = fuelGauge.needleView.frame
        let expectedRect = CGRectMake(-18.3013, -18.3013, 136.6025, 136.6025)
        XCTAssertEqualWithAccuracy(needleRect.origin.x, expectedRect.origin.x, 0.0001, "Needle frame x expected to be \(expectedRect.origin.x) but is \(needleRect.origin.x)")
        XCTAssertEqualWithAccuracy(needleRect.origin.y, expectedRect.origin.y, 0.0001, "Needle frame y expected to be \(expectedRect.origin.y) but is \(needleRect.origin.y)")
        XCTAssertEqualWithAccuracy(needleRect.width, expectedRect.width, 0.0001, "Needle frame width expected to be \(expectedRect.width) but is \(needleRect.width)")
        XCTAssertEqualWithAccuracy(needleRect.height, expectedRect.width, 0.0001, "Needle frame width expected to be \(expectedRect.height) but is \(needleRect.height)")
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
    
    func testCalculateRotationRadiansForFuelLevelZero() {
        let level: Float = 0.0
        let expectedAngle = calculateRadiansForDegrees(-120.0)
        let angle = fuelGauge.calculateRotationRadiansForFuelLevel(level)
        XCTAssertEqualWithAccuracy(angle, expectedAngle, 0.0001, "Angle: \(angle) not equal to expected \(expectedAngle)")
    }

    func testCalculateRotationRadiansForFuelLevelFull() {
        let level: Float = 1.0
        let expectedAngle = calculateRadiansForDegrees(120.0)
        let angle = fuelGauge.calculateRotationRadiansForFuelLevel(level)
        XCTAssertEqualWithAccuracy(angle, expectedAngle, 0.0001, "Angle: \(angle) not equal to expected \(expectedAngle)")
    }
    
    func testCalculateRotationRadiansForFuelLevelForOddAngle() {
        let level: Float = 0.4567
        let expectedAngle = calculateRadiansForDegrees(-10.39)
        let angle = fuelGauge.calculateRotationRadiansForFuelLevel(level)
        XCTAssertEqualWithAccuracy(angle, expectedAngle, 0.0001, "Angle: \(angle) not equal to expected \(expectedAngle)")
    }
    
    func testNeedleRotatedMinus120Initially() {
        let view = fuelGauge.needleView
        let a = view.transform.a
        let b = view.transform.b
        let c = view.transform.c
        let d = view.transform.d
        let tx = view.transform.tx
        let ty = view.transform.ty
        XCTAssertEqualWithAccuracy(a, CGFloat(-0.5), 0.0001, "Transform.a expected to be -0.5 but was \(a)")
        XCTAssertEqualWithAccuracy(b, CGFloat(-0.8660), 0.0001, "Transform.b expected to be -0.8860 but was \(b)")
        XCTAssertEqualWithAccuracy(c, CGFloat(0.8660), 0.0001, "Transform.c expected to be 0.8660 but was \(c)")
        XCTAssertEqualWithAccuracy(d, CGFloat(-0.5), 0.0001, "Transform.d expected to be -0.5 but was \(d)")
        XCTAssertEqualWithAccuracy(tx, CGFloat(0.0), 0.0001, "Transform.tx expected to be 0.0 but was \(tx)")
        XCTAssertEqualWithAccuracy(ty, CGFloat(0.0), 0.0001, "Transform.ty expected to be 0.0 but was \(ty)")
    }
    
    //MARK: Helper methods
    func calculateRadiansForDegrees(degrees: Float) -> Float {
        let radians = degrees / 180.0 * Float(M_PI)
        return radians
    }
}
