//
//  ViewController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
   
    
    
    @IBOutlet weak var texttest: UITextField!
    
    @IBOutlet weak var TitleWork: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =    NSLocalizedString("Chtar Demo", comment: "")

        
        TitleWork.text =  NSLocalizedString("welcome to my application", comment: "")

        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        SingleClass.swViewController = self.revealViewController()
       
        
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
    
        if self.revealViewController() != nil {
            
            if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "en"{
               // menuButton.action = "revealToggle:"
                
                menuButton.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
                self.revealViewController().rightViewRevealWidth = 0
                self.revealViewController().rightRevealToggle(animated: false)
                print("language english ")
                
            }else if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "ar"{
                
                self.revealViewController().rightViewRevealWidth = self.view.frame.size.width/3 * 2
                self.revealViewController().rearViewRevealWidth = 0
                
                menuButton.addTarget(self.revealViewController(), action: "rightRevealToggle:", for: .touchUpInside)

                
            }
         
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        

    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func arabicButton(_ sender: Any) {
        print(languageManger.currentAppleLanguage())

        
        
        if languageManger.currentAppleLanguage() == "en"{
        

            languageManger.setLaguageOfApplication(lang: "ar")
            
            //texttest.textAlignment = .right

            
            
        }
        
    }
    
   
    
    
    @IBAction func englishButton(_ sender: Any) {
        
        print(languageManger.currentAppleLanguage())
        if languageManger.currentAppleLanguage() == "ar"{
            
            

            languageManger.setLaguageOfApplication(lang: "en")
            //texttest.textAlignment = .left

        }
    }
    
    

}

