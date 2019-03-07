//
//  GradientNavigationController.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/6/19.
//  Copyright © 2019 Canopy. All rights reserved.
//

import UIKit

/// UINavigationController subclass which supports gradient backgrounds, bleeds into the status bar, and supports safeAreaLayoutGuide
public class GradientNavigationBar: UINavigationController {
    // The font of the header label
    public var headerFont: UIFont {
        get {
            return FontManager.shared.headerFont
        }
        set {
            FontManager.shared.headerFont = newValue
            reloadAttributes()
        }
    }

    // The font of the title label
    public var titleFont: UIFont {
        get {
            return FontManager.shared.titleFont
        }
        set {
            FontManager.shared.titleFont = newValue
            reloadAttributes()
        }
    }

    // The foreground color of text and button tint
    public var foregroundColor: UIColor = UIColor.white {
        didSet {
            FontManager.shared.color = foregroundColor
            reloadAttributes()
        }
    }

    // The components of the gradient to be drawn in the background
    public var gradientColors: [GradientNavigationBarColor] = [GradientNavigationBarColor(color: UIColor.red, location: 0.0),
                                                               GradientNavigationBarColor(color: UIColor.orange, location: 1.0)] {
        didSet {
            reloadAttributes()
        }
    }

    // The style for the status bar
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        reloadAttributes()
    }

    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        reloadAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
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
