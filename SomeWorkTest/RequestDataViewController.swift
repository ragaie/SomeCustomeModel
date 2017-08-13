//
//  RequestDataViewController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/20/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class RequestDataViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    
    
    
    @IBAction func getRequest(_ sender: Any) {
        //username -> bcuser  // password-> bc1234
        //key -> Content-Type value -> application/json
        
        var tempheader : NSDictionary! = ["username":"bcuser","password":"bc1234","Content-Type":"application/json"]
         var body : NSDictionary! = ["username":"bcuser","password":"bc1234","Content-Type":"application/json"]
        
        ChtarNetwork.RetreiveData("http://staging.brightcreations.com/bot/hr.php", httpWay: .GET, Headers: tempheader, bodyParameter: nil,key : "getdata")
         ChtarNetwork.RetreiveData("http://staging.brightcreations.com/bot/hr.php", httpWay: .POST, Headers: tempheader, bodyParameter: body,key : "getdata")
         ChtarNetwork.RetreiveData("http://staging.brightcreations.com/bot/hr.php", httpWay: .DELETE, Headers: tempheader, bodyParameter: nil,key : "getdata")
    }
    
    
    
    
    
    @IBAction func postRequest(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func otherRequest(_ sender: Any) {
        
        
        
        
    }
    
    
    
    


}
