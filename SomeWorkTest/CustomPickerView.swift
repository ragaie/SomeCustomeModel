//
//  CustomPickerView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class CustomPickerView: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    @IBOutlet weak var imageSelect: UIImageView!
    
    @IBOutlet weak var PickerButton: UIButton!
    
    
    @IBOutlet weak var datePicker: UIButton!
    
    @IBOutlet weak var pickImage: UIButton!
    
    @IBOutlet weak var showLoader: UIButton!
    
    @IBOutlet weak var showToast: UIButton!
    
    
    
    
    var myController : CustomPickerController!

    var showDropDown : dropDownList!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myController = CustomPickerController()
        
        myController.myView = self
        
        showToast.addTarget(myController, action: "showToastDAta:", for: .touchUpInside)
        pickImage.addTarget(myController, action: "getImageAction:", for: .touchUpInside)
        
        PickerButton.addTarget(myController, action: "genderButtonPress:", for: .touchUpInside)
        
        datePicker.addTarget(myController, action: "pickDate:", for: .touchUpInside)
        
        
        showLoader.addTarget(myController, action: "showLoader:", for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
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
        
        
    }
    
    
    func initDroupDown()-> Void{
        
        
        
        showDropDown  = UINib(nibName: "dropDownList", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! dropDownList
       
        showDropDown.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        showDropDown.cancelButton.addTarget(myController, action: "dismissPickerView:", for: UIControlEvents.touchUpInside)
        
        
        showDropDown.doneButton.addTarget(myController, action: "ChangeGender:", for: UIControlEvents.touchUpInside)
        
        
        // showDropDown.headerLabel.backgroundColor = UIColor.navBarColor()
        showDropDown.dataPicker.delegate = myController as! UIPickerViewDelegate?
        showDropDown.dataPicker.dataSource = myController as! UIPickerViewDataSource?
        
        
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
            var basketTopFrame = self.showDropDown.frame
            
            basketTopFrame.origin.y -= 200
            
            
            self.showDropDown.frame = basketTopFrame
        }, completion: { finished in
            print("Basket doors opened!")
        })
        
        UIApplication.shared.keyWindow?.addSubview(showDropDown)
        
        //self.view.addSubview(showDropDown)
        
        // return showDropDwon
        
    }
    

  
    
    
    

}
