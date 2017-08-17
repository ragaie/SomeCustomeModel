//
//  Animator.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 8/15/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class Animator: UIView {

 
    @IBOutlet weak var FirstOne: UIView!
    
    
    @IBOutlet weak var secandView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        
    }
    //////
  
    
    
    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "Animator", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        addSubview(view)
        
        // custom initialization logic
        
    }
    
    
    
    
    
    func Show(){
        
        
        
        if self != nil {
            UIApplication.shared.keyWindow?.addSubview(self)
            
       
//            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.repeat, animations: {
//                // Rotate the image here
//                // cx, cy is center of screen
//                // move (cx,cy) to (0,0)
//                var  transform : CGAffineTransform! = CGAffineTransform(translationX: -20, y: -20);
//                
//                // roate around (0,0)
//                transform = transform.rotated(by: CGFloat.pi);
//                
//                // mov e (0,0) back to (cx,cy)  
//                transform = transform.translatedBy(x: 20,y: 20);
//                
//                
//                self.FirstOne.transform = transform //CGAffineTransform(rotationAngle: CGFloat.pi)
//                //self.secandView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//                
//            }, completion: nil)
//     
//           
            
            
            //The code is within viewDidLoad method
            let circlePath = UIBezierPath(arcCenter: CGPoint.init(x: self.frame.midX, y: self.frame.midY), radius: 40, startAngle: 20, endAngle:CGFloat(M_PI)*2, clockwise: true)
            
            let animation = CAKeyframeAnimation(keyPath: "position");
            animation.duration = 1.8
            animation.repeatCount = MAXFLOAT
            animation.path = circlePath.cgPath
            
            
            
            
            let circlePath1 = UIBezierPath(arcCenter: CGPoint.init(x: self.frame.midX, y: self.frame.midY), radius: 40, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: true)
            
            let animation1 = CAKeyframeAnimation(keyPath: "position");
            animation1.duration = 1
            animation1.repeatCount = MAXFLOAT
            animation1.path = circlePath1.cgPath
            
            
            
            
            
            
            let squareView = UIView()
            //whatever the value of origin for squareView will not affect the animation
            squareView.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
            squareView.backgroundColor = UIColor.lightGray
            self.addSubview(squareView)
            squareView.layer.add(animation, forKey: nil)
            
            
            
            
            let squareView1 = UIView()
            //whatever the value of origin for squareView will not affect the animation
            squareView1.frame = CGRect.init(x: 0, y: 0, width: 10, height: 10)
            squareView1.backgroundColor = UIColor.lightGray
            
            self.addSubview(squareView1)
            squareView1.layer.add(animation1, forKey: nil)

            
            
           
            // You can also pass any unique string value for key
           // FirstOne.layer.add(animation, forKey: nil)
            //secandView.layer.add(animation1, forKey: nil)
            // circleLayer is only used to locate the circle animation path
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = UIColor.black.cgColor
            circleLayer.fillColor = UIColor.clear.cgColor
            self.layer.addSublayer(circleLayer)
            
            
            
            
            
            
            
            
        }
    }

    
    
    
    
    
}
