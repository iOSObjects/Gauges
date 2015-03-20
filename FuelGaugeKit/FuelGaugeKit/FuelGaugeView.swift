//
//  FuelGaugeView.swift
//  FuelGaugeKit
//
//  Created by Ron Lisle on 3/19/15.
//  Copyright (c) 2015 Ron Lisle. All rights reserved.
//

import UIKit

class FuelGaugeView: UIView {

    var backgroundImage:UIImageView!
    var needleImage:UIImageView!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if backgroundImage == nil {
            backgroundImage = createSubviewWithImageNamed("FuelGaugeBG")
        }
        if needleImage == nil {
            needleImage = createSubviewWithImageNamed("FuelGaugeNeedle")
        }
    }
    
    func createSubviewWithImageNamed(name: String) -> UIImageView {
        let newImageView = UIImageView()
        newImageView.frame = self.bounds
        newImageView.image = UIImage(named: name, inBundle: NSBundle(forClass: FuelGaugeView.self), compatibleWithTraitCollection: nil)
        addSubview(newImageView)
        return newImageView
    }
}
