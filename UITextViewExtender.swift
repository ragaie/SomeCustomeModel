//
//  UITextViewExtender.swift
//  Naos
//
//  Created by Orchtech on 12/27/16.
//  Copyright © 2016 Orchtech. All rights reserved.
//

import UIKit


@IBDesignable class UITextViewExtender: UITextView {

    //
    //    Border Color
    //    Border Width
    //    Corner Radius
    @IBInspectable var borderColor: UIColor = UIColor.white {
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
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        
        
        super.init(frame: frame, textContainer: textContainer)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}
