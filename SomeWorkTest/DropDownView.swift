//
//  DropDownView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/9/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class DropDownView: UIViewController ,DropDownDelegate,RatingBarDelegate,PickerListDelegate{
    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var dropDownButton: DropDown!
    
    @IBOutlet weak var ratingBarView: RatingBar!
    
    
    
    @IBOutlet weak var pickerList: PickerList!
    
    
    
    
    
    var items = ["dfdf","ddgdgdg","dfgdg","dfgdfg","dfgdfg","dfgdgerert","dfdf","ddgdgdg","dfgdg","dfgdfg","dfgdfg","dfgdgerert"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        var drop : DropDown! = DropDown.init(frame: CGRect.init(x: 0, y: 100, width: 10, height: 200))
//        drop.dataSourceItem = items
//        drop.delegate = self
//        
//        view.addSubview(drop)
        
        dropDownButton.dataSourceItem = items
        
        dropDownButton.delegate = self
        
        ratingBarView.delegate = self

        pickerList.delegate = self
        pickerList.dataSourceItem = items
    }
    
    
    
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int) {
        
        print("\(items[row])")
        
    }
    func dropDown(_ dropDown: DropDown, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
        
       
 
        
    }
    
    
    func RatingBar(_ ratingBar: RatingBar, didChangeValue value: Int) {
        
        print("rate value = \(value)")
    }
  
    
    
    
    @IBAction func showPicker(_ sender: Any) {
        
        pickerList.showPicker()
        

        
    }
    
    

    @IBAction func showNotification(_ sender: Any) {
        
        
    Notify.init("welcome to notification ").Show()
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
    

}
