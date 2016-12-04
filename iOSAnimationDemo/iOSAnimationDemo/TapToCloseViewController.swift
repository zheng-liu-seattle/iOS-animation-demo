//
//  TapToCloseViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class TapToCloseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(TapToCloseViewController.onTapGesture))
        view.addGestureRecognizer(tap)

        view.backgroundColor = .white
    }

    func onTapGesture() {
        dismiss(animated: true, completion: nil)
    }

}
