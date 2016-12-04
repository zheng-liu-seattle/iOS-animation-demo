//
//  PathViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class PathViewController: TapToCloseViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = view.center
        rectShape.cornerRadius = bounds.width / 2
        view.layer.addSublayer(rectShape)

        // Apply effects here

        // fill with yellow
        rectShape.fillColor = UIColor.yellow.cgColor

        // 1
        // begin with a circle with a 50 points radius
        let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 50).cgPath
        // animation end with a large circle with 500 points radius
        let endShape = UIBezierPath(roundedRect: CGRect(x: -450, y: -450, width: 1000, height: 1000), cornerRadius: 500).cgPath

        // set initial shape
        rectShape.path = startShape

        // 2
        // animate the `path`
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = 1 // duration is 1 sec
        // 3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        // 4
        rectShape.add(animation, forKey: animation.keyPath)
    }

}
