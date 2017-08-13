//
//  GestureRecognizersView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/15/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class GestureRecognizersView: UIViewController ,UIGestureRecognizerDelegate{

    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    @IBOutlet weak var showAction: UILabel!
    
    
    
    
    @IBOutlet weak var egaleImageScale: UIImageView!
    
    // to mange run more gesture at same time
    var initialTransform: CGAffineTransform?
    
    var gestures = Set<UIGestureRecognizer>(minimumCapacity: 3)

    // declare Swipe gesture recognizers for each direction...
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeUpRec = UISwipeGestureRecognizer()
    let swipeDownRec = UISwipeGestureRecognizer()
    
  
    
    // declare a Tap gesture recognizer...
    
    let tapRec = UITapGestureRecognizer()
    
    
    
    
    
    // declare a Rotation gesture recognizer...
    
    let rotateRec = UIRotationGestureRecognizer()
    
    //// pinch scale 
    
    let ScaleRec = UIPinchGestureRecognizer()
    
    
    let gesturePin = UIPanGestureRecognizer()

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        view.backgroundColor = UIColor.white

        
        
        menuButton.action = nil
        if self.revealViewController() != nil {
            
            if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "en"{
                menuButton.action = "revealToggle:"
                self.revealViewController().rightViewRevealWidth = 0
                print("language english ")
                
            }else if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "ar"{
                
                //                print("language is arabic")
                self.revealViewController().rightViewRevealWidth = self.view.frame.size.width/3 * 2
                self.revealViewController().rearViewRevealWidth = 0
                menuButton.action =   "rightRevealToggle:"
                
                
            }
            
            
            
            menuButton.target = self.revealViewController()
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    
    
   
        swipeRightRec.addTarget(self, action: #selector(GestureRecognizersView.swipedRight) )
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        
        
        swipeLeftRec.addTarget(self, action: #selector(GestureRecognizersView.swipedLeft) )
        swipeLeftRec.direction = .left
        self.view!.addGestureRecognizer(swipeLeftRec)
        
        
        swipeUpRec.addTarget(self, action: #selector(GestureRecognizersView.swipedUp) )
        swipeUpRec.direction = .up
        self.view!.addGestureRecognizer(swipeUpRec)
        
        
        swipeDownRec.addTarget(self, action: #selector(GestureRecognizersView.swipedDown) )
        swipeDownRec.direction = .down
        self.view!.addGestureRecognizer(swipeDownRec)
        
        
        
        
     
        tapRec.addTarget(self, action:#selector(GestureRecognizersView.tappedView))
        tapRec.numberOfTouchesRequired = 1
        tapRec.numberOfTapsRequired = 1
        self.view!.addGestureRecognizer(tapRec)
        
        
        
      
        
        
        
        
        /// i will add all them to effect each other
        rotateRec.addTarget(self, action:#selector(GestureRecognizersView.processTransform))
        self.view!.addGestureRecognizer(rotateRec)
        
        rotateRec.delegate = self

        
        ScaleRec.addTarget(self, action: #selector(GestureRecognizersView.processTransform))
        self.view!.addGestureRecognizer(ScaleRec)
        ScaleRec.delegate = self

        
        gesturePin.addTarget(self, action: #selector(GestureRecognizersView.processTransform))
        self.view.addGestureRecognizer(gesturePin)
  
        
        
    }
    
    
    
    
    
/// end viewdidload
    
    
    
    
    
    
    func swipedRight()   {
        
        showAction.text = "swiped right  ---------->"
        
    }
    
    
    func swipedLeft()   {
        showAction.text = "<-------  swiped left "
        
    }
    func swipedUp() {
        showAction.text = "  up swiped"
        
    }
    func swipedDown()  {
        
        showAction.text = "down swiped "
    }
    
    
    func tappedView(sender : UITapGestureRecognizer)  {
        
    
        
        
        egaleImageScale.isHighlighted = true
        showAction.text = "tapped press >>>>>"
        
        
        
        
    }
    
    
    
    // MARK: - Gesturies
    
    func transformUsingRecognizer(_ recognizer: UIGestureRecognizer, transform: CGAffineTransform) -> CGAffineTransform {
        
        if let rotateRecognizer = recognizer as? UIRotationGestureRecognizer {
            
            return transform.rotated(by: rotateRecognizer.rotation / 2)
        }
        
        if let pinchRecognizer = recognizer as? UIPinchGestureRecognizer {
            let scale = pinchRecognizer.scale
            
         
                
                return transform.scaledBy(x: scale  , y: scale )
       
            
            
        }
        
        
        //// pan move
        
        if let panRecognizer = recognizer as? UIPanGestureRecognizer {
            let deltaX = panRecognizer.translation(in: egaleImageScale).x
            let deltaY = panRecognizer.translation(in: egaleImageScale).y
            
            return transform.translatedBy(x: deltaX / 2 , y: deltaY / 2)
        }
        
        return transform
    }
    
    
    
    
    
    
    
    
    
    func processTransform(_ sender: Any) {
        
        let gesture = sender as! UIGestureRecognizer
        
        switch gesture.state {
            
        case .began:
            if gestures.count == 0 {
                // check transform it is avialable of not // get inital tranform from view
                initialTransform = egaleImageScale.transform
            }
            gestures.insert(gesture)
            
        case .changed:
            //add all gustrue to one tranform then apply it
            if var initial = initialTransform {
                gestures.forEach({ (gesture) in
                    initial = transformUsingRecognizer(gesture, transform: initial)
                    
                })
                egaleImageScale.transform = initial
                
            }
            
            
            
        case .ended:
            if let pinchRecognizer = gesture as? UIPinchGestureRecognizer {
                let scale = pinchRecognizer.scale
                
                
             
            }
            
            
            if let rotateRecognizer = gesture as? UIRotationGestureRecognizer {
                
                
                // rotateTextLayer(rotateValue: rotateRecognizer.rotation)
            }
            
            gestures.remove(gesture)
            
        default:
            break
        }
        
        
        
    }
    
    
    
    
    
    ///to make gusture work with each other on touch
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
    

    
    
    
    
////
////    func rotatedView(sender:UIRotationGestureRecognizer) {
////        
////        
////        egaleImageScale.transform = egaleImageScale.transform.rotated(by: sender.rotation)
////        
////      print(  sender.rotation)
////        
////        if (sender.state == .began) {
////            
////            print("began rotating")
////        }
////        if (sender.state == .changed) {
////            
////            // print the rotation values...
////            print(  sender.rotation )
////        }
////        if (sender.state == .ended) {
////            
////            print("ended rotating")
////        }
////    }
//    
// 
//    
//    
//    
//    func scaleImage(sender : UIPinchGestureRecognizer)  {
//        
//        print("scale =  \(sender.scale)")
//
//        
//        egaleImageScale.transform =  egaleImageScale.transform.scaledBy(x: sender.scale, y: sender.scale)
//        
//        
//                sender.scale = 1
//        
//        
//    }
    
    
    
    
    
    
//    func handlePan(sender : UIPanGestureRecognizer)  {
//    
//        if sender.state == .began || sender.state == .changed {
//            
//            let translation = sender.translation(in: self.view)
//            // note: 'view' is optional and need to be unwrapped
//            
//            egaleImageScale.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
//            
//            
//           // gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
//           // egaleImageScale.setTranslation(CGPoint.zero, in: self.view)
//    
//            
//        }
//       
//    }
 
    
    
    
    

}
