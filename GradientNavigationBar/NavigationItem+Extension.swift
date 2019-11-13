//
//  NavigationItem+Extension.swift
//  GradientNavigationBar
//
//  Created by Seth Porter on 3/7/19.
//  Copyright © 2019 Canopy Tax, Inc. All rights reserved.
//

import UIKit

extension UINavigationItem {
    /// Sets the titleView property of the navigation item to include a header and a title
    ///
    /// - Parameters:
    ///   - title: The title text to use
    ///   - header: The header text to use
    ///   - navigationController: If you pass in the navigation controller, it will be unwrapped and cast to a CanopyNavigationBar.
    ///                           If the unwrapping or cast fails, default values will be used.
    public func setTitle(title: String? = nil, header: String? = nil, navigationController: UINavigationController? = nil) {
        var headerFont = GradientNavigationDefaults.headerFont
        var titleFont = GradientNavigationDefaults.titleFont
        var textColor = GradientNavigationDefaults.foregroundColor

        if let gradientNavigationBar = navigationController as? GradientNavigationBar {
            headerFont = gradientNavigationBar.headerFont
            titleFont = gradientNavigationBar.titleFont
            textColor = gradientNavigationBar.foregroundColor
        }

        // Header Label
        let headerLabel = UILabel()
        headerLabel.text = header
        headerLabel.font = headerFont
        headerLabel.textColor = textColor
        headerLabel.textAlignment = .center
        headerLabel.lineBreakMode = .byTruncatingMiddle
        headerLabel.sizeToFit()

        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = titleFont
        titleLabel.textColor = textColor
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byTruncatingMiddle
        titleLabel.sizeToFit()

        // Add elements to the stack view, if one is nil, the other will be centered within the navbar
        let stackView = UIStackView(arrangedSubviews: [titleLabel, headerLabel])
        stackView.distribution = .equalCentering
        stackView.spacing = -5
        stackView.axis = .vertical

        // TODO: get intrinsic content sizes of labels and use those for the stackview frame height

        let width = max(titleLabel.frame.size.width, headerLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 30)

        titleLabel.sizeToFit()
        headerLabel.sizeToFit()

        self.titleView = stackView
    }
}
