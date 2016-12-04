//
//  LineWidthViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class LineWidthViewController: TapToCloseViewController {

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

        // setup
        let rect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 1)
        rectShape.bounds = rect
        rectShape.position = view.center
        rectShape.path = UIBezierPath(rect:rect).cgPath

        // 1
        rectShape.lineWidth = 10
        rectShape.strokeColor = UIColor.blue.cgColor

        // animate
        let animation = CABasicAnimation(keyPath: "lineWidth")
        // 2
        animation.toValue = 1000
        animation.duration = 1 // duration is 1 sec
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        rectShape.add(animation, forKey: animation.keyPath)
    }

}
