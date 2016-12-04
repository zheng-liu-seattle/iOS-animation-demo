//
//  DrawRectangleViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class DrawRectangleViewController: TapToCloseViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

      let width: CGFloat = 100
      let height: CGFloat = 200
      let radius: CGFloat = 10
      let x: CGFloat = 200
      let y: CGFloat = 100

      let animation = CABasicAnimation(keyPath: "strokeEnd")

      animation.duration = 15

      animation.fromValue = 0
      animation.toValue = 1

      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

      drawLeftSideRectangle(x: x,
                            y: y, width: width, height: height, radius: radius, animation: animation)

      drawRightSideRectangle(x: x,
                             y: y, width: width, height: height, radius: radius, animation: animation)
    }


  /// draw left side of the rectangle
  private func drawLeftSideRectangle(x: CGFloat,
                                 y: CGFloat,
                                 width: CGFloat,
                                 height: CGFloat,
                                 radius: CGFloat,
                                 animation: CABasicAnimation) {

    let sidePath: CGMutablePath = CGMutablePath()

    sidePath.move(to: CGPoint(x:x, y:y))
    sidePath.addLine(to: CGPoint(x:x - width + radius, y:y))



    sidePath.addArc(center: CGPoint(x: x - width + radius, y: y + radius),
                    radius: radius,
                    startAngle: CGFloat(3 * M_PI / 2),
                    endAngle: CGFloat(M_PI),
                    clockwise: true)
    sidePath.addLine(to: CGPoint(x: x - width, y: y + height - 2 * radius))
    sidePath.addArc(center: CGPoint(x: x - width + radius, y:y + height -  radius),
                    radius: radius,
                    startAngle: CGFloat(M_PI),
                    endAngle: CGFloat(0.5 * M_PI),
                    clockwise: true)
    sidePath.addLine(to: CGPoint(x:x, y: y + height))

    let sideLayer = CAShapeLayer()
    sideLayer.path = sidePath
    sideLayer.fillColor = UIColor.clear.cgColor
    sideLayer.strokeColor = UIColor.red.cgColor
    sideLayer.lineWidth = 5.0;


    self.view.layer.addSublayer(sideLayer)
    sideLayer.strokeEnd = 1.0

    sideLayer.add(animation, forKey: "leftSideLayer")
  }

  /// draw right side of the rectangle
  private func drawRightSideRectangle(x: CGFloat,
                                     y: CGFloat,
                                     width: CGFloat,
                                     height: CGFloat,
                                     radius: CGFloat,
                                     animation: CABasicAnimation) {

    let sidePath: CGMutablePath = CGMutablePath()

    sidePath.move(to: CGPoint(x:x, y:y))
    sidePath.addLine(to: CGPoint(x:x + width - radius, y:y))



    sidePath.addArc(center: CGPoint(x: x + width - radius, y: y + radius),
                    radius: radius,
                    startAngle: CGFloat(3 * M_PI / 2),
                    endAngle: CGFloat(2 * M_PI),
                    clockwise: false)
    sidePath.addLine(to: CGPoint(x: x + width, y: y + height - 2 * radius))
    sidePath.addArc(center: CGPoint(x: x + width - radius, y:y + height -  radius),
                    radius: radius,
                    startAngle: CGFloat(2 * M_PI),
                    endAngle: CGFloat(0.5 * M_PI),
                    clockwise: false)
    sidePath.addLine(to: CGPoint(x:x, y: y + height))

    let sideLayer = CAShapeLayer()
    sideLayer.path = sidePath
    sideLayer.fillColor = UIColor.clear.cgColor
    sideLayer.strokeColor = UIColor.red.cgColor
    sideLayer.lineWidth = 5.0;


    self.view.layer.addSublayer(sideLayer)
    sideLayer.strokeEnd = 1.0

    sideLayer.add(animation, forKey: "rightSideLayer")
  }

}
