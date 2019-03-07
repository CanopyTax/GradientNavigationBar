//
//  NavigationBar+Extension.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/7/19.
//  Copyright © 2019 Canopy Tax, Inc. All rights reserved.
//

import UIKit

extension UINavigationBar {
    /// Applies a background gradient with the given colors
    internal func applyNavigationGradient(colors: [GradientNavigationBarColor]) {
        guard let image = UINavigationBar.gradient(size: CGSize(width: 200, height: 50), colors: colors) else {
            return
        }

        // Set stretchy background
        setBackgroundImage(image.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
    }

    /// Creates a gradient image with the given settings
    ///
    /// - Parameters:
    ///   - size: The size to draw the gradient. This is later used for stretching, so actual bounds aren't important
    ///   - colors: The colors to use for the gradient
    /// - Returns: A UIImage containing the desired gradient, or nil if there was an issue
    static private func gradient(size: CGSize, colors: [GradientNavigationBarColor]) -> UIImage? {
        // Turn the colors into CGColors
        let cgColors = colors.map { $0.color.cgColor }
        let locations = colors.map { $0.location }

        // Begin the graphics context
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)

        // If no context was retrieved, then it failed
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        // From now on, the context gets ended if any return happens
        defer {
            UIGraphicsEndImageContext()
        }

        // Create the CGGradient
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgColors as CFArray, locations: locations)

        let startPoint = CGPoint(x: size.width / 2, y: size.height)
        let radius = 1.2 * size.width / 2

        // Draw the gradient
        context.drawRadialGradient(gradient!, startCenter: startPoint, startRadius: 0.0, endCenter: startPoint, endRadius: radius, options: [])

        // Generate the image (the defer takes care of closing the context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
