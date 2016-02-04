//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class ClockView: UIView {
    
    var shapeLayer: CAShapeLayer
    
    override init (frame : CGRect) {
        shapeLayer = CAShapeLayer()
        super.init(frame : frame)
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func addCircle() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 160,y: 240), radius: CGFloat(100), startAngle: CGFloat(-M_PI_2), endAngle:CGFloat(2*M_PI-M_PI_2), clockwise: true)
        
        shapeLayer.path = circlePath.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func setLabelText(labelText: String) {
        let label = UILabel(frame: CGRect(x: 72, y: 220, width: 200, height: 40))
        
        label.font = UIFont(name: label.font.fontName, size: 40)
        label.text = labelText
        label.textColor = UIColor.redColor()
        
        self.addSubview(label)
    }
    
    func startAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 10
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        
        shapeLayer.addAnimation(animation, forKey: "ani")
    }
    
    func setTimer(timerValue: Int) {
        let str = String(format:"%02d:%02d:%02d", (timerValue/6000)%100, (timerValue/100)%60, timerValue%100)
        self.addCircle()
        self.setLabelText(str)
    }
}

let view = ClockView()
view.backgroundColor = UIColor.whiteColor()
view.frame = CGRect(x:0, y: 0, width: 320, height: 480)

view.setTimer(900)
view.startAnimation()

XCPlaygroundPage.currentPage.liveView = view
