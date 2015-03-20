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
            backgroundImage = UIImageView()
            backgroundImage.frame = self.bounds
            backgroundImage.image = UIImage(named: "FuelGaugeBG", inBundle: NSBundle(forClass: FuelGaugeView.self), compatibleWithTraitCollection: nil)
            addSubview(backgroundImage)
        }
        if needleImage == nil {
            needleImage = UIImageView()
        }
    }
}
