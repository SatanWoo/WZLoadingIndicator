//
//  ViewController.swift
//  WZHud
//
//  Created by z on 15/9/21.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        
        let hud = WZHUD(frame: CGRectMake(self.view.center.x, self.view.center.y, 100, 100))
        
        //hud.backgroundColor = UIColor.grayColor()
        self.view.addSubview(hud)
        
        hud.startLoading()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            hud.stopLoading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

