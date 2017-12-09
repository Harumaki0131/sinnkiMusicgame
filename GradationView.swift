//
//  File.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2017/09/30.
//  Copyright © 2017年 EriyaMurakami. All rights reserved.
//

import UIKit

@IBDesignable
class Gradation: UIView {
    
    
    
    //今回はボタンの枠線の色、太さ、ボタンの角を丸める設定絵をいじってみる
    //以下の変数宣言でこれらがデフォルトの値になる
    @IBInspectable var borderColor : UIColor = UIColor.clear
    @IBInspectable var borderWidth : CGFloat = 1.0
    @IBInspectable var cornerRadius : CGFloat = 5.0
//    
//    @IBInspectable var startPoint : CGPoint = CGPoint(x: 0.0, y: 0.0)
//    @IBInspectable var endPoint :CGPoint = CGPoint(x: 1.0, y: 1.0)

    
    
    //  Attributes Inspectorで設定した値を反映
    override func draw(_ rect: CGRect)  {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    
    
}
    
    var gradentLayer: CAGradientLayer?
    
    @IBInspectable var topColor: UIColor = UIColor.white{
        didSet{
            setGradation()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.black {
        didSet {
            setGradation()
        }
    }
    
    @IBInspectable var startPoint: CGPoint =  CGPoint(x: 0.0, y: 0.0) {
        didSet {
            setGradation()
        }
    }
    
    @IBInspectable var endPoint: CGPoint =  CGPoint(x: 1.0, y: 1.0) {
        didSet {
            setGradation()
        }
    }
    
    
    
    private func setGradation() {
        gradentLayer?.removeFromSuperlayer()
        gradentLayer = CAGradientLayer()
        gradentLayer?.startPoint = startPoint
        gradentLayer?.endPoint = endPoint
        gradentLayer!.colors = [topColor.cgColor, bottomColor.cgColor]
        gradentLayer!.frame.size = frame.size
        layer.addSublayer(gradentLayer!)
        layer.masksToBounds = true
    }
}



















