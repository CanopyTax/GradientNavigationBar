//
//  ViewController.swift
//  GradientNavigationBarExample
//
//  Created by Seth Porter on 3/7/19.
//  Copyright © 2019 Canopy. All rights reserved.
//

import UIKit
import GradientNavigationBar

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        self.navigationItem.setTitle(title: "Title", header: "Header")

        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let randomBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(randomButtonPressed))

        self.navigationItem.setRightBarButtonItems([addBarButtonItem, randomBarButtonItem], animated: true)
    }
}

// MARK: - Button Targets
extension ViewController {
    @objc func addButtonPressed() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

    @objc func randomButtonPressed() {
        let numberOfElements = Int.random(in: 2...4)

        var gradientColors: [GradientNavigationBarColor] = []

        for i in 0 ..< numberOfElements {
            gradientColors.append(GradientNavigationBarColor(color: randomColor(), location: (CGFloat(i) * 1.0 / CGFloat(numberOfElements - 1))))
        }

        (navigationController as? GradientNavigationBar)?.gradientColors = gradientColors
    }

    func randomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}
