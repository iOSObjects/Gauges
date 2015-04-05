//
//  GaugesDemoTests.swift
//  GaugesDemoTests
//
//  Created by Ron Lisle on 4/5/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit
import XCTest

class GaugesDemoTests: XCTestCase {
    
    var application: UIApplication!
    var window: UIWindow!
    var tabBarController: UITabBarController!
    var tabBar: UITabBar!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        application = UIApplication.sharedApplication()
        window = application.keyWindow
        tabBarController = window.rootViewController as! UITabBarController
        tabBar = tabBarController.tabBar
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApplicationCreated() {
        XCTAssertNotNil(application, "UIApplication not instantiated")
    }
    
    func testWindowCreated() {
        XCTAssertNotNil(window, "UIWindow not instantiated")
    }
    
    func testTabBarControllerCreated() {
        XCTAssertNotNil(tabBarController, "UITabBarController not instantiated")
    }
    
    func testTabBarCreated() {
        XCTAssertNotNil(tabBar, "UITabBar not instantiated")
    }
    
    //MARK: Fuel Gauge tests
    func testFirstItemIsFuelGauge() {
        let items = tabBar.items as! [UITabBarItem]
        let firstItem = items[0]
        let firstTitle = firstItem.title!
        XCTAssertEqual(firstTitle, "Fuel", "First item title expected to be Fuel but is \(firstTitle)")
    }
    
    func testSliderCreated() {
        let fuelVC = tabBarController.viewControllers?.first as? FirstViewController
        let slider = fuelVC?.slider
        XCTAssertNotNil(slider, "Fuel tab slider not created")
    }
    
}
