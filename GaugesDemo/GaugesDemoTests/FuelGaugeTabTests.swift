//
//  FuelGaugeTabTests.swift
//  GaugesDemo
//
//  Created by Ron Lisle on 4/5/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit
import XCTest

class FuelGaugeTabTests: XCTestCase {

    var vc: FirstViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("FuelVC") as! FirstViewController
        
        let dummy = vc.view // force loading subviews and setting outlets
        
        vc.viewDidLoad()
    }
    
    func testFirstViewControllerLoaded() {
        XCTAssertNotNil(vc, "FirstViewController not found")
    }
    
    func testSliderCreated() {
        let slider = vc.slider
        XCTAssertNotNil(slider, "Slider not created or connected")
    }
    
    func testEmptyButtonCreated() {
        let emptyButton = vc.emptyButton
        XCTAssertNotNil(emptyButton, "Empty button not created or connected")
    }

    func testFullButtonCreated() {
        let fullButton = vc.fullButton
        XCTAssertNotNil(fullButton, "Full button not created or connected")
    }
    
    func testEmptyButtonSetsSliderToZero() {
        vc.emptyPressed(vc.emptyButton)
        let level = vc.slider.value
        XCTAssertEqualWithAccuracy(level, 0.0, 0.0001, "Slider s/b zero but is \(level)")
    }
    
}
