//
//  RoundedCornersViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class RoundedCornersViewController: TapToCloseViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        let center = view.center

        // Create CAShapeLayerS
        let rectShape1 = CAShapeLayer()
        rectShape1.bounds = bounds
        rectShape1.position = CGPoint(x: center.x, y: center.y - 120)
        view.layer.addSublayer(rectShape1)
        let rectShape2 = CAShapeLayer()
        rectShape2.bounds = bounds
        rectShape2.position = center
        view.layer.addSublayer(rectShape2)
        let rectShape3 = CAShapeLayer()
        rectShape3.bounds = bounds
        rectShape3.position = CGPoint(x: center.x, y: center.y + 120)
        view.layer.addSublayer(rectShape3)

        // Apply effects here
        // 1
        rectShape1.backgroundColor = UIColor.red.cgColor
        rectShape1.cornerRadius = 20
        // 2
        rectShape2.fillColor = UIColor.green.cgColor
        rectShape2.path = UIBezierPath(roundedRect: rectShape2.bounds, cornerRadius: 20).cgPath
        // 3
        rectShape3.fillColor = UIColor.blue.cgColor
//        rectShape3.path = UIBezierPath(roundedRect: rectShape3.bounds, byRoundingCorners: .BottomLeft | .TopRight, cornerRadii: CGSize(width: 20, height: 20)).CGPath
    }

}
