//
//  Notification.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 8/2/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class Notify: NSObject {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var notifyView : UITextView!

    override init(){
        
        super.init()
        
        
    }
    
    
    
    
    
    init(_  message : String){
        
        
        
        
     
        
      
        var hight : CGFloat! = UIScreen.main.bounds.height / 13//notifyView.frame.height
        var width : CGFloat! = UIScreen.main.bounds.width
        var x : CGFloat! = 0.0
        var y : CGFloat! =  0 - hight
        
      
        
        notifyView = UITextView.init(frame: CGRect.init(x: x, y: y, width: width, height: hight))
      
        notifyView.text = message
        notifyView.textAlignment = .center
        
        notifyView.layer.borderColor = UIColor.lightGray.cgColor
        notifyView.layer.borderWidth = 4
        //Papyrus
        notifyView.font =  UIFont.init(name: "Andalus", size: 20)//UIFont.boldSystemFont(ofSize: 20)
        
        
        
        notifyView.textColor = UIColor.white
        
        notifyView.backgroundColor = UIColor.black
        
        notifyView.layer.cornerRadius  = 10.0
        
        
 
       
        
        
    }
    
    
    
    func Show(){
        
        
        
        if notifyView != nil {
            UIApplication.shared.keyWindow?.addSubview(notifyView)
   
            UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
                var basketTopFrame = self.notifyView.frame
                
                basketTopFrame.origin.y = 16
                
                
                self.notifyView.frame = basketTopFrame
                
                alignTextVerticalInTextView(textView: self.notifyView)

            }, completion: { finished in
                print("Ragaie doors opened!")
            })
            
            
            
            UIView.animate(withDuration: 1.0, delay: 2.5, options: .curveEaseOut, animations: {
                var basketTopFrame = self.notifyView.frame
                
                basketTopFrame.origin.y -= basketTopFrame.height + 16
                
                
                self.notifyView.frame = basketTopFrame
            }, completion: { finished in
                print("Ragaie doors opened!")
            })
            
            
            
            
        }
    }

}


func alignTextVerticalInTextView(textView :UITextView) {
    
    let size = textView.sizeThatFits(CGSize.init(width: textView.bounds.width, height: CGFloat(MAXFLOAT)))
    
    var topoffset = (textView.bounds.size.height - size.height * textView.zoomScale) / 2.0
    topoffset = topoffset < 0.0 ? 0.0 : topoffset
    
    textView.contentOffset = CGPoint.init(x: 0, y: -topoffset)
}
