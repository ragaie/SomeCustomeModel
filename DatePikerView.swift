//
//  DatePikerView.swift
//  Amadeus
//
//  Created by Orchtech on 11/6/16.
//  Copyright © 2016 Orchtech. All rights reserved.
//

import UIKit

@IBDesignable class DatePikerView: UIView {
var view:UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var cancel: UIButton!
    
    @IBOutlet weak var GetDate: UIButton!
    @IBOutlet weak var pickerDateView: UIDatePicker!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
//        
//        UIView.animateWithDuration(0.7, delay: 0, options: .AllowAnimatedContent, animations: {
//            var basketTopFrame = self.view.frame
//            basketTopFrame.origin.y -= basketTopFrame.size.height
//            
//            var basketBottomFrame = self.view.frame
//            basketBottomFrame.origin.y += basketBottomFrame.size.height
//            
//            self.view.frame = basketTopFrame
//            self.view.frame = basketBottomFrame
//            //  self.view.backgroundColor = UIColor.greenColor()
//            
//            //            self.view.backgroundColor = UIColor.greenColor()
//            //
//            //            self.view.frame.size.height = self.frameHight
//            
//            }, completion: { finished in
//                print("Basket doors opened!")
//        })
//
//        
   
        
    }
    
 
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
 
        
    }


}
