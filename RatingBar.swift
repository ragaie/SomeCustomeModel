//
//  RatingBar.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit


protocol RatingBarDelegate {
    
    func RatingBar(_ ratingBar: RatingBar, didChangeValue value : Int)

    
}


// viewcontroller that contain this view
//extension UIResponder {
//    func owningViewController() -> UIViewController? {
//        var nextResponser = self
//        while let next = nextResponser.next {
//            nextResponser = next
//            if let vc = nextResponser as? UIViewController {
//                return vc
//            }
//        }
//        return nil
//    }
//}


@IBDesignable class RatingBar: UIView {

   
    @IBOutlet weak var rate1: UIButton!
    
    @IBOutlet weak var rate2: UIButton!
    @IBOutlet weak var rate3: UIButton!
    
    @IBOutlet weak var rate4: UIButton!
    
    @IBOutlet weak var rate5: UIButton!
    
    var delegate : RatingBarDelegate!
    private var rateImage : UIImage! =  UIImage.init(named: "rate")
    private var unrateImage : UIImage! =  UIImage.init(named: "unrate")
    
    public var ID : String! = "DropDown"
    @IBInspectable var RestorationId : String!{
        didSet {
            
            ID = RestorationId
            
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
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var rateIamge: UIImage?   = UIImage.init(named: "rate"){
        didSet {
            
            rateImage = rateIamge
        }
    }
    @IBInspectable var unRateImage: UIImage? =  UIImage.init(named: "unrate") {
        didSet {
            
            unrateImage = unRateImage
            rate1.setImage(unRateImage, for: .normal)
            rate2.setImage(unRateImage, for: .normal)
            rate3.setImage(unRateImage, for: .normal)
            rate4.setImage(unRateImage, for: .normal)
            rate5.setImage(unRateImage, for: .normal)

        }
    }
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
    }

    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "RatingBar", bundle: bundle)
        
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
    
    
    
    
    // add action of dropDown
    func initActionAndDelegete()  {
        
        
       rate1.addTarget(self, action: "changeRating:", for: .touchUpInside)
        rate2.addTarget(self, action: "changeRating:", for: .touchUpInside)

        rate3.addTarget(self, action: "changeRating:", for: .touchUpInside)

        rate4.addTarget(self, action: "changeRating:", for: .touchUpInside)
        rate5.addTarget(self, action: "changeRating:", for: .touchUpInside)

    }

    
    
    
    func changeRating(_ sender : UIButton){
     if sender.tag == 0 {
        switch sender.restorationIdentifier! {
        case "rate1":
            rate1.setImage(rateImage, for: .normal)
            rate2.setImage(unrateImage, for: .normal)
            rate3.setImage(unrateImage, for: .normal)
            rate4.setImage(unrateImage, for: .normal)
            rate5.setImage(unrateImage, for: .normal)
            rate1.tag = 1
            rate2.tag = 0
            rate3.tag = 0
            rate4.tag = 0
            rate5.tag = 0
            
            delegate.RatingBar(self, didChangeValue: 1)

            break
        case "rate2":
            rate1.setImage(rateImage, for: .normal)
            rate2.setImage(rateImage, for: .normal)
            rate3.setImage(unrateImage, for: .normal)
            rate4.setImage(unrateImage, for: .normal)
            rate5.setImage(unrateImage, for: .normal)
            rate1.tag = 1
            rate2.tag = 1
            rate3.tag = 0
            rate4.tag = 0
            rate5.tag = 0
            delegate.RatingBar(self, didChangeValue: 2)

            break
        case "rate3":
            rate1.setImage(rateImage, for: .normal)
            rate2.setImage(rateImage, for: .normal)
            rate3.setImage(rateImage, for: .normal)
            rate4.setImage(unrateImage, for: .normal)
            rate5.setImage(unrateImage, for: .normal)
            rate1.tag = 1
            rate2.tag = 1
            rate3.tag = 1
            rate4.tag = 0
            rate5.tag = 0
            delegate.RatingBar(self, didChangeValue: 3)

            break
        case "rate4":
            rate1.setImage(rateImage, for: .normal)
            rate2.setImage(rateImage, for: .normal)
            rate3.setImage(rateImage, for: .normal)
            rate4.setImage(rateImage, for: .normal)
            rate5.setImage(unrateImage, for: .normal)
            rate1.tag = 1
            rate2.tag = 1
            rate3.tag = 1
            rate4.tag = 1
            rate5.tag = 0
            delegate.RatingBar(self, didChangeValue: 4)

            break
        case "rate5":
            rate1.setImage(rateImage, for: .normal)
            rate2.setImage(rateImage, for: .normal)
            rate3.setImage(rateImage, for: .normal)
            rate4.setImage(rateImage, for: .normal)
            rate5.setImage(rateImage, for: .normal)
            rate1.tag = 1
            rate2.tag = 1
            rate3.tag = 1
            rate4.tag = 1
            rate5.tag = 1
            delegate.RatingBar(self, didChangeValue: 5)

            break
        default:
            
            break
        }
        
       
        
        
        }
        else{
            switch sender.restorationIdentifier! {
                case "rate1":
                    rate1.setImage(unrateImage, for: .normal)
                    rate2.setImage(unrateImage, for: .normal)
                    rate3.setImage(unrateImage, for: .normal)
                    rate4.setImage(unrateImage, for: .normal)
                    rate5.setImage(unrateImage, for: .normal)
                    rate1.tag = 0
                    rate2.tag = 0
                    rate3.tag = 0
                    rate4.tag = 0
                    rate5.tag = 0
                    delegate.RatingBar(self, didChangeValue: 0)

                    break
                case "rate2":
                    //rate1.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    rate2.setImage(unrateImage, for: .normal)
                    rate3.setImage(unrateImage, for: .normal)
                    rate4.setImage(unrateImage, for: .normal)
                    rate5.setImage(unrateImage, for: .normal)
                    //rate1.tag = 1
                    rate2.tag = 0
                    rate3.tag = 0
                    rate4.tag = 0
                    rate5.tag = 0
                    delegate.RatingBar(self, didChangeValue: 1)

                    break
                case "rate3":
                    //rate1.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                   // rate2.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    rate3.setImage(unrateImage, for: .normal)
                    rate4.setImage(unrateImage, for: .normal)
                    rate5.setImage(unrateImage, for: .normal)
                    //rate1.tag = 1
                    //rate2.tag = 1
                    rate3.tag = 0
                    rate4.tag = 0
                    rate5.tag = 0
                    delegate.RatingBar(self, didChangeValue: 2)

                    break
                case "rate4":
                    //rate1.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    //rate2.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                   // rate3.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    rate4.setImage(unrateImage, for: .normal)
                    rate5.setImage(unrateImage, for: .normal)
                    //rate1.tag = 0
                   // rate2.tag = 0
                    //rate3.tag = 1
                    rate4.tag = 0
                    rate5.tag = 0
                    delegate.RatingBar(self, didChangeValue: 3)

                    break
                case "rate5":
                    //rate1.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    //rate2.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    //rate3.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    //rate4.setBackgroundImage(UIImage.init(named: "rate"), for: .normal)
                    rate5.setImage(unrateImage, for: .normal)
                   // rate1.tag = 1
                    //rate2.tag = 1
                    //rate3.tag = 1
                    //rate4.tag = 1
                    rate5.tag = 0
                    delegate.RatingBar(self, didChangeValue: 4)

                break
                default:
            
                    break
                }
        
            }
        
        
    
    }
    

}
