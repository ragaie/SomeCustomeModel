//
//  ExpandCellView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/31/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ExpandTablelView: UIViewController {

     @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var myController : ExpandTablelController!
    
    
    @IBOutlet weak var tableViewExpand: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        myController = ExpandTablelController()
        myController.myView = self
        
        
        
        tableViewExpand.delegate = myController
        tableViewExpand.dataSource = myController
        
        tableViewExpand.estimatedRowHeight = 300
        tableViewExpand.rowHeight = UITableViewAutomaticDimension
        
        
        
        
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
