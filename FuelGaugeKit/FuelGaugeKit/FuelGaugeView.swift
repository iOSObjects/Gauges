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

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if backgroundImage == nil {
            backgroundImage = UIImageView()
            addSubview(backgroundImage)
        }
    }
}
