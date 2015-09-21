//
//  WZHud.swift
//  WZHud
//
//  Created by z on 15/9/21.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import Foundation
import UIKit

class WZHUD: UIView {
    let indicatorLayer:CAShapeLayer = CAShapeLayer()
    let maskLayer:CAGradientLayer = CAGradientLayer()
    
    let animationKey = "com.satanwoo.loading"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupIndicator()
    }
    
    internal required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupIndicator() {
        let radius = min(self.bounds.height/2, self.bounds.width/2) * 0.75
        let path = CGRectMake(self.bounds.width/2 - radius, self.bounds.height/2 - radius, radius * 2, radius * 2)
        
        indicatorLayer.path = UIBezierPath(ovalInRect: path).CGPath
        indicatorLayer.strokeColor = UIColor.whiteColor().CGColor
        indicatorLayer.fillColor = UIColor.clearColor().CGColor
        indicatorLayer.lineWidth = 5
        indicatorLayer.strokeEnd = 0.9
        
        indicatorLayer.lineCap = kCALineCapRound
        
        self.layer.addSublayer(indicatorLayer)
    }
    
    func startLoading() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.duration = 1.5
        rotate.fromValue = 0
        rotate.toValue = 2 * M_PI
        rotate.repeatCount = HUGE
        self.layer.addAnimation(rotate, forKey: animationKey)
    }
    
    func stopLoading(){
        self.layer.removeAnimationForKey(animationKey)
    }
}
