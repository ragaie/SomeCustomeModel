//
//  UIImageExtender.swift
//  Amadeus
//
//  Created by Orchtech on 11/7/16.
//  Copyright © 2016 Orchtech. All rights reserved.
//

import UIKit

 @IBDesignable class UIImageExtender: UIImageView{

//    
//    Border Color
//    Border Width
//    Corner Radius
    @IBInspectable var borderColor: UIColor = UIColor.white{
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true

        }
    }
    

    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    

    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
      
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      
    }
    
    
    
    
    
    
    
    
}
