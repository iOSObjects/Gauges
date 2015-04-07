//
//  FirstViewController.swift
//  GaugesDemo
//
//  Created by Ron Lisle on 4/5/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit

class FuelGaugeViewController: UIViewController {

    @IBOutlet weak var fuelGauge: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var emptyButton: UIButton!
    @IBOutlet weak var fullButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func emptyPressed(sender: AnyObject) {
        slider.value = 0.0
    }

    @IBAction func fullPressed(sender: AnyObject) {
        slider.value = 1.0
    }
}

