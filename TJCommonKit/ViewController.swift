//
//  ViewController.swift
//  TJCommonKit
//
//  Created by tao on 2018/10/19.
//  Copyright © 2018年 tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        TJActivityIndicatorView.sharedInstance.setMessage("载入中")
        TJActivityIndicatorView.sharedInstance.indicatorTransform = 0.7
        TJActivityIndicatorView.sharedInstance.messageSpacing = 0
        TJActivityIndicatorView.sharedInstance.startAnimating(self.view, message: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            TJActivityIndicatorView.sharedInstance.stopAnimating(self.view)
        }
    }

}

