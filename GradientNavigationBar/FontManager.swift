//
//  FontManager.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/7/19.
//  Copyright © 2019 Canopy Tax, Inc. All rights reserved.
//

import UIKit

/// Used internally to share preferred Fonts between GradientNavigationController and the NavigationItem extension.
internal class FontManager {
    static let shared = FontManager()

    internal var headerFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .regular)

    internal var titleFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .bold)

    internal var color: UIColor = UIColor.white
}
