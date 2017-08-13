//
//  Loader.swift
//  CallCar
//
//  Created by Ragaie Alfy on 4/24/17.
//  Copyright © 2017 Ragaie Alfy. All rights reserved.
//

import UIKit

@IBDesignable class Loader: UIView {

    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var lableText: UILabel!
    
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
            
        }
    }
    
    
    override init(frame : CGRect) {
        super.init(frame : frame)
       //initSubviews()
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     // initSubviews()
    }

    
    
    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "Loader", bundle: bundle)
        
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
    
}
