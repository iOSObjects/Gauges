//
//  FuelGaugeView.swift
//  FuelGaugeKit
//
//  Created by Ron Lisle on 3/19/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit

@IBDesignable public
class FuelGaugeView: UIView {

    @IBInspectable public var level: Float = 0.0 {
        didSet {
            updateGauge(oldValue)
        }
    }
    
    @IBInspectable public var duration: Float = 0.0
    @IBInspectable public var damping: Float = 0.4
    
    var backgroundView:UIImageView!
    var needleView:UIImageView!
    var shadowView:UIImageView!

    public override func layoutSubviews() {
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
        rotateView(newView, angle: angleForEmpty, duration: 0, damping: 0, velocity: 0)
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
        newImageView.contentMode = UIViewContentMode.ScaleAspectFit
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

    func rotateNeedleAndShadow(angle: Float) {
        if angleInRadiansIsEqualToOrGreaterThan180Degrees(angle) {

            rotateViewIn2Parts(needleView, angle: angle, duration:duration, damping: damping, velocity: 0)
            rotateViewIn2Parts(shadowView, angle: angle, duration: duration, damping: damping, velocity: 0)
            
        }else{
            
            rotateView(needleView, angle: angle, duration:duration, damping: damping, velocity: 0)
            rotateView(shadowView, angle: angle, duration: duration, damping: damping, velocity: 0)
            
        }
    }
    
    func rotateView(view: UIView, angle: Float, duration: Float, damping: Float, velocity: Float) {
        
        UIView.animateWithDuration(NSTimeInterval(duration), delay: 0, usingSpringWithDamping: CGFloat(damping), initialSpringVelocity: CGFloat(velocity), options: nil, animations: {
                view.transform = CGAffineTransformRotate(view.transform, CGFloat(angle))
            }, completion: nil )
    }
    
    func rotateViewIn2Parts(view: UIView, angle: Float, duration: Float, damping: Float, velocity: Float) {
        
        let secondVelocity = (angle / 2.0) / Float(duration*0.2)
        
        UIView.animateWithDuration(NSTimeInterval(duration*0.2), delay: NSTimeInterval(0), options: UIViewAnimationOptions.CurveLinear, animations: {
            
            view.transform = CGAffineTransformRotate(view.transform, CGFloat(angle/2))
            
            }, completion: { _ in
                
                UIView.animateWithDuration(NSTimeInterval(duration*0.8), delay: NSTimeInterval(0.0), usingSpringWithDamping: CGFloat(damping), initialSpringVelocity: CGFloat(secondVelocity), options: nil, animations: {
                    
                    view.transform = CGAffineTransformRotate(view.transform, CGFloat(angle/2))
                    return
                    
                    }, completion: nil)
                return
        })
        
    }
    
    func updateGauge(oldValue: Float) {
        let deltaAngle = calculateDeltaAngleForFuelLevel(level, oldValue: oldValue)
        rotateNeedleAndShadow(deltaAngle)
    }
    
    func calculateDeltaAngleForFuelLevel(value: Float, oldValue: Float) -> Float {
        let previousRotation = calculateRotationRadiansForFuelLevel(oldValue)
        let newRotation = calculateRotationRadiansForFuelLevel(level)
        return newRotation - previousRotation
    }
    
    func angleInRadiansIsEqualToOrGreaterThan180Degrees(angle: Float) -> Bool {
        let isGreaterThan180degrees: Bool = angle >= Float(M_PI) || angle <= Float(-M_PI)
        return isGreaterThan180degrees
    }
    
}
