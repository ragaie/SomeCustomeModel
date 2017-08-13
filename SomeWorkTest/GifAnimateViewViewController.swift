//
//  GifAnimateViewViewController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/14/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class GifAnimateViewViewController: UIViewController ,UITableViewDataSource{

    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    
    
    @IBOutlet weak var imageShowGif: UIImageView!
    
    
    
    @IBOutlet weak var tableViewShowData: UITableView!
    
    
    
    
    
    
    @IBOutlet weak var collectionViewShow: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       // collectionViewShow.dataSource = self
        
        tableViewShowData.dataSource = self
        
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

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
 
        
        
        let jeremyGif = UIImage.gifImageWithName(name: "loading-in")

        imageShowGif.image = jeremyGif
        

}
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableViewShowData.dequeueReusableCell(withIdentifier: "tableCellViewID", for: indexPath)
        
        
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    

    
    
}
