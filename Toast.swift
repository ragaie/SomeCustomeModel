//
//  Extension+UIView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/30/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit




class Toast: NSObject {
    
    
    private var toastView : UITextView!
    override init(){
        
        super.init()
        
        
    }
    
    
    
    
    
    init(_  message : String){
        
        
        
        
        toastView = UITextView.init()
        toastView.text = message
        toastView.textAlignment = .center
        toastView.font = UIFont.boldSystemFont(ofSize: 20)
        
        toastView.sizeToFit()
        
        var hight : CGFloat! = 0.0
        var width : CGFloat! = 0.0
        var x : CGFloat! = 0.0
        var y : CGFloat! = 0.0
        
        
        
        /// figure size of toast ..
        if toastView.frame.width > UIScreen.main.bounds.width * 0.8 {
            
            width = UIScreen.main.bounds.width * 0.8
            
            
            
            /// fix hight depend on
            var temp: CGFloat = toastView.frame.width / width
            var aStr = String(format: "%f", temp)
            
            var arr: [String]! = aStr.components(separatedBy: ".")
            
            var tempInt: Int! = Int(arr.last!)!
            var number : CGFloat! = CGFloat.init(Float.init(arr[0])!)
            
            
            if tempInt > 0 {
                number = number + 1.0
            }
            
            
            hight = toastView.frame.height * number
            if hight > UIScreen.main.bounds.height {
                
                hight = UIScreen.main.bounds.height * 0.8
            }
            
        }else{
            width = toastView.frame.width
            hight = toastView.frame.height
        }
        
        
        
        y = UIScreen.main.bounds.height - (hight )
        
        x = UIScreen.main.bounds.width * 0.1
        
        
        
        toastView = UITextView.init(frame: CGRect.init(x: x, y: y , width: width, height: hight))
        toastView.center = CGPoint.init(x: UIScreen.main.bounds.width / 2, y: y)
        
        toastView.text = message
        toastView.textAlignment = .center
        toastView.font = UIFont.boldSystemFont(ofSize: 20)
        
        toastView.textColor = UIColor.white
        
        toastView.backgroundColor = UIColor.black
        
        toastView.layer.cornerRadius  = 18.0
        
        
    }
    
    
    func Show(){
        
        
        
        if toastView != nil {
            UIApplication.shared.keyWindow?.addSubview(toastView)
            
            UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
                
                self.toastView.alpha = 0.0
                
            }, completion: nil)
            
            
            
        }
    }
    
}
