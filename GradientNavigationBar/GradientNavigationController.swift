//
//  GradientNavigationController.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/6/19.
//  Copyright © 2019 Canopy. All rights reserved.
//

import UIKit

struct GradientNavigationDefaults {
    static let headerFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let titleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    static let foregroundColor = UIColor.white
    static let gradientColors: [GradientNavigationBarColor] = [GradientNavigationBarColor(color: UIColor.red, location: 0.0),
                                                               GradientNavigationBarColor(color: UIColor.orange, location: 1.0)]
}

/// UINavigationController subclass which supports gradient backgrounds, bleeds into the status bar, and supports safeAreaLayoutGuide
open class GradientNavigationBar: UINavigationController {
    // The font of the header label
    public var headerFont: UIFont = GradientNavigationDefaults.headerFont {
        didSet {
            reloadAttributes()
        }
    }

    // The font of the title label
    public var titleFont: UIFont = GradientNavigationDefaults.titleFont {
        didSet {
            reloadAttributes()
        }
    }

    // The foreground color of text and tint
    public var foregroundColor: UIColor = GradientNavigationDefaults.foregroundColor {
        didSet {
            reloadAttributes()
        }
    }

    // The components of the gradient to be drawn in the background
    public var gradientColors: [GradientNavigationBarColor] = GradientNavigationDefaults.gradientColors {
        didSet {
            reloadAttributes()
        }
    }

    // The style for the status bar
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

     override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        reloadAttributes()
    }

    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        reloadAttributes()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        reloadAttributes()
    }

    // Configures the navigation bar based on the public properties
    private func reloadAttributes() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.font: titleFont]
        navigationBar.titleTextAttributes = titleTextAttributes

        navigationBar.tintColor = foregroundColor

        navigationBar.applyNavigationGradient(colors: gradientColors)
    }
}
