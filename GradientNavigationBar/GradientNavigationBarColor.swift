//
//  GradientNavigationBarColor.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/7/19.
//  Copyright © 2019 Canopy Tax, Inc. All rights reserved.
//

import UIKit

/// Used to indicate a single component of a gradient
public struct GradientNavigationBarColor {
    let color: UIColor
    let location: CGFloat

    public init(color: UIColor, location: CGFloat) {
        self.color = color
        self.location = location
    }
}
