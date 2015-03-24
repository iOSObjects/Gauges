//
//  FuelGaugeView.swift
//  FuelGaugeKit
//
//  Created by Ron Lisle on 3/19/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit

class FuelGaugeView: UIView {

    var fuelLevel: Float = 0.0 {
        didSet {
            updateGauge(oldValue)
        }
    }
    
    var backgroundView:UIImageView!
    var needleView:UIImageView!
    var shadowView:UIImageView!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if backgroundView == nil {
            backgroundView = createSubviewWithImageNamed("FuelGaugeBG")
        }
        if needleView == nil {
            needleView = createAndRotateSubviewWithImageNamed("FuelGaugeNeedle")
        }
        if shadowView == nil {
            shadowView = createAndRotateSubviewWithImageNamed("FuelGaugeShadow")
        }
    }
    
    func createAndRotateSubviewWithImageNamed(name: String) -> UIImageView {
        let newView = createSubviewWithImageNamed(name)
        let angleForEmpty = calculateRotationRadiansForFuelLevel(0.0)
        rotateView(newView, angle: angleForEmpty)
        return newView
    }
    
    func createSubviewWithImageNamed(name: String) -> UIImageView {
        let newImageView = createImageViewWithImageNamed(name)
        addSubview(newImageView)
        return newImageView
    }
    
    func createImageViewWithImageNamed(name: String) -> UIImageView {
        let newImageView = UIImageView()
        newImageView.frame = self.bounds
        newImageView.image = loadImageNamed(name)
        return newImageView
    }
    
    func loadImageNamed(name: String) -> UIImage? {
        let newImage = UIImage(named: name, inBundle: NSBundle(forClass: FuelGaugeView.self), compatibleWithTraitCollection: nil)
        return newImage
    }
    
    func calculateRotationRadiansForFuelLevel(level: Float) -> Float {
        let fullRotation = Float(M_PI * 4 / 3)
        return (fullRotation * level) - (fullRotation / 2)
    }
    
    func rotateView(view: UIView, angle: Float) {
        view.transform = CGAffineTransformRotate(view.transform, CGFloat(angle))
    }
    
    func updateGauge(oldValue: Float) {
        let previousRotation = calculateRotationRadiansForFuelLevel(oldValue)
        let newRotation = calculateRotationRadiansForFuelLevel(fuelLevel)
        rotateView(needleView, angle: newRotation - previousRotation)
        rotateView(shadowView, angle: newRotation - previousRotation)
    }
}
