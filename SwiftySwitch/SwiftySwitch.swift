//
//  SwiftySwitch.swift
//  SwiftySwitch
//
//  Created by Seth Rininger on 1/5/17.
//  Copyright © 2017 Seth Rininger. All rights reserved.
//

import UIKit

@IBDesignable
public class SwiftySwitch: UIView {

    private var ball: SwitchBall!
    internal var delegate: SwiftySwitchDelegate?
    private var shouldSkip: Bool = false
    
    @IBInspectable public var isOn: Bool = false {
        willSet {
            if newValue == isOn {
                shouldSkip = true
            }
        }
        didSet {
            if !shouldSkip {
                if isOn {
                    isMoving = true
                    DispatchQueue.main.async { [weak self] in
                        self?.ball.turnOn {
                            self?.isMoving = false
                            self?.config()
                        }
                    }
                } else {
                    isMoving = true
                    DispatchQueue.main.async { [weak self] in
                        self?.ball.turnOff {
                            self?.isMoving = false
                            self?.config()
                        }
                    }
                }
            }
            shouldSkip = false
        }
    }
    @IBInspectable public var mySize: CGSize = CGSize(width: 66, height: 29) {
        didSet {
            config()
        }
    }
    @IBInspectable public var corners0to1: CGFloat = 0.5 {
        didSet {
            if corners0to1 > 1 || corners0to1 < 0 {
                corners0to1 = 0.5
            }
            config()
        }
    }
    @IBInspectable public var mainColor: UIColor = UIColor(red: 35/255, green: 110/255, blue: 129/255, alpha: 1/1) {
        didSet {
            config()
        }
    }
    @IBInspectable public var dotOffColor: UIColor = UIColor(red: 0/255, green: 66/255, blue: 99/255, alpha: 1/1) {
        didSet {
            config()
        }
    }
    @IBInspectable public var dotOnColor: UIColor = UIColor(red: 0/255, green: 199/255, blue: 170/255, alpha: 1/1) {
        didSet {
            config()
        }
    }
    @IBInspectable public var dotColor: UIColor = UIColor(red: 227/255, green: 49/255, blue: 67/255, alpha: 1/1) {
        didSet {
            config()
        }
    }
    @IBInspectable public var dotSpacer: Int = 2 {
        didSet {
            config()
        }
    }
    @IBInspectable public var smallDot0to1: CGFloat = 0.36 {
        didSet {
            if smallDot0to1 > 0.99 || smallDot0to1 < 0 {
                smallDot0to1 = 0.36
            }
            config()
        }
    }
    
    private var isMoving: Bool = false
    private var tapRecognizer: UITapGestureRecognizer!
    
    override public init(frame: CGRect) {
        print(frame)
        super.init(frame: frame)
        config()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    override public class var layerClass: AnyClass {
        get {
            return CALayer.self
        }
    }
    
    private func config() {
        let myFrame = CGRect(x: 0, y: 0, width: mySize.width, height: mySize.height)
        if CGFloat(dotSpacer) > (myFrame.height / 2) - 2 {
            dotSpacer = 2
        }
        self.backgroundColor = mainColor
        self.layer.cornerRadius = myFrame.height * corners0to1
        var oldBall = ball
        ball = SwitchBall(dotOnColor, dotOffColor, dotColor, isOn, myFrame, dotSpacer, smallDot0to1)
        self.addSubview(ball)
        oldBall?.removeFromSuperview()
        oldBall = nil
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        self.addGestureRecognizer(tapRecognizer)
        self.isAccessibilityElement = true
        self.accessibilityLabel = "CustomSwitch"
        self.accessibilityTraits = UIAccessibilityTraitButton
        self.isUserInteractionEnabled = true
    }
    
    func onTap(_ recognizer: UITapGestureRecognizer) {
        if !isMoving {
            if !isOn {
                isOn = true
                delegate?.valueChanged(sender: self)
            } else {
                isOn = false
                delegate?.valueChanged(sender: self)
            }
        }
    }
}

fileprivate class SwitchBall: UIView {
    
    private var centerBall: UIView!
    private var offColor: UIColor!
    private var onColor: UIColor!
    private var ballDiameter: CGFloat!
    private var dotSpacer: CGFloat!
    private var myFrame: CGRect!
    private var smallDotMultiplier: CGFloat!
    
    fileprivate init(_ onColor: UIColor, _ offColor: UIColor, _ dotColor: UIColor, _ isOn: Bool, _ myFrame: CGRect, _ dotSpace: Int, _ smallDotMultiplier: CGFloat) {
        self.myFrame = myFrame
        self.smallDotMultiplier = smallDotMultiplier
        dotSpacer = CGFloat(dotSpace)
        ballDiameter = myFrame.height - (dotSpacer * 2)
        if isOn {
            super.init(frame: CGRect(x: myFrame.width - ballDiameter - dotSpacer, y: dotSpacer, width: ballDiameter, height: ballDiameter))
            self.backgroundColor = onColor
        } else {
            super.init(frame: CGRect(x: dotSpacer, y: dotSpacer, width: ballDiameter, height: ballDiameter))
            self.backgroundColor = offColor
        }
        
        self.offColor = offColor
        self.onColor = onColor
        
        self.layer.cornerRadius = ballDiameter / 2
        
        let centerBallDiameter = ballDiameter * smallDotMultiplier
        let centerBallSpacer = (ballDiameter - centerBallDiameter) / 2
        centerBall = UIView(frame: CGRect(x: centerBallSpacer, y: centerBallSpacer, width: centerBallDiameter, height: centerBallDiameter))
        centerBall.backgroundColor = dotColor
        centerBall.layer.cornerRadius = centerBallDiameter / 2
        centerBall.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centerBall)
        NSLayoutConstraint(item: centerBall, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: centerBallDiameter).isActive = true
        NSLayoutConstraint(item: centerBall, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: centerBallDiameter).isActive = true
        NSLayoutConstraint(item: centerBall, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: centerBall, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        if isOn {
            centerBall.alpha = 1.0
        } else {
            centerBall.alpha = 0.0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func turnOn(completion: @escaping () -> Void) {
        let tempView = UIView(frame: CGRect(x: ballDiameter / 2, y: ballDiameter / 2, width: 0, height: 0))
        tempView.backgroundColor = onColor
        tempView.layer.cornerRadius = ballDiameter / 2
        self.addSubview(tempView)
        
        UIView.animate(withDuration: 1, animations: { [weak self] in
            if self != nil {
                tempView.frame = CGRect(x: 0, y: 0, width: self!.ballDiameter, height: self!.ballDiameter)
                tempView.layer.cornerRadius = self!.ballDiameter / 2
            }
            self?.frame.origin.x = self!.dotSpacer + (self!.myFrame.width - self!.ballDiameter - (self!.dotSpacer * 2))
            self?.layoutIfNeeded()
        }) { [weak self] _ in
            self?.backgroundColor = self!.onColor
            tempView.removeFromSuperview()
            completion()
        }
        
        UIView.animate(withDuration: 1 - Double(smallDotMultiplier!), delay: Double(smallDotMultiplier!), options: [.transitionCrossDissolve], animations: { [weak self] in
            self?.centerBall.alpha = 1
            self?.bringSubview(toFront: self!.centerBall)
            self?.layoutIfNeeded()
            }, completion: nil)
    }
    
    func turnOff(completion: @escaping () -> Void) {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: ballDiameter, height: ballDiameter))
        tempView.backgroundColor = onColor
        self.addSubview(tempView)
        self.backgroundColor = offColor
        UIView.animate(withDuration: 1, animations: { [weak self] in
            if self != nil {
                tempView.frame = CGRect(x: self!.ballDiameter / 2, y: self!.ballDiameter / 2, width: 0, height: 0)
                tempView.layer.cornerRadius = self!.ballDiameter / 2
            }
            self?.frame = CGRect(x: self!.dotSpacer, y: self!.dotSpacer, width: self!.ballDiameter, height: self!.ballDiameter)
            self?.layoutIfNeeded()
        }) { _ in
            tempView.removeFromSuperview()
            completion()
        }
        
        UIView.animate(withDuration: 1 - Double(smallDotMultiplier!)) { [weak self] in
            self?.centerBall.alpha = 0.0
            self?.bringSubview(toFront: self!.centerBall)
            self?.layoutIfNeeded()
        }
    }
}

protocol SwiftySwitchDelegate {
    func valueChanged(sender: SwiftySwitch)
}
