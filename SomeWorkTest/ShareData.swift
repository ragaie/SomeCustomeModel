//
//  ShareData.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/29/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ShareData: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var shareData: UIButton!
    
    
    
    @IBOutlet weak var passwordEnter: UITextField!
    
    
    
    
    
    @IBOutlet weak var passwordLoad: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        
        shareData.addTarget(self, action: "shareData:", for: .touchUpInside)
        
        
        
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func shareData(_ sender : UIButton){
    
        
        let image = UIImage(named: "eagle")

        let activityViewController = UIActivityViewController(
            activityItems: ["welcome to my application ",image],
            applicationActivities: nil)
        
        
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]

        present(activityViewController, animated: true, completion: nil)
    
    
    }

    
    
    
    
    
    
    // share text
    @IBAction func shareTextButton(_ sender: UIButton) {
        
        // text to share
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    // share image
    @IBAction func shareImageButton(_ sender: UIButton) {
        
        // image to share
        let image = UIImage(named: "Image")
        
        // set up activity view controller
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func savePassword(_ sender: Any) {
        
        
       if  passwordEnter.text != nil {
        
                KeychainService.savePassword(token: passwordEnter.text as! NSString)

        }
        
        
        
    }
    
    
    @IBAction func loadPassword(_ sender: Any) {
        
        
        let password = KeychainService.loadPassword() // password = "Pa55worD"

        if password != nil {
        
                passwordLoad.text = password as! String
        
        }
        
        
    }
    
    
    
    


}
