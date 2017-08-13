//
//  CustomeFontsView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class CustomeFontsView: UIViewController ,UITableViewDataSource{
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    @IBOutlet weak var tableViewItem: UITableView!
    
    
    var customFonts = ["andlso","arab3end","ArabDances","ARABIAN KNIGHT","ARABOLIC","BArabics","BArshia","BCompset","BDavat","BElham","BEsfhnBd","Besmellah_2","BFantezy","BFerdosi","BJadidBd","BKoodakO","Diwanltr","Taibaijan Bold","Taibaijan Italic","Taibaijan","Thabit","Besmellah_2"]
    var fontsName : [String]! = []// ["andlso","arab3end","ArabDances","ARABIAN KNIGHT","ARABOLIC","BArabics","BArshia","BCompset","BDavat","BElham","BEsfhnBd","Besmellah_2","BFantezy","BFerdosi","BJadidBd","BKoodakO","Diwanltr","Taibaijan Bold","Taibaijan Italic","Taibaijan","Thabit","Besmellah_2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
  
        
        for item in UIFont.familyNames{
            
            print(item)
            fontsName.append(item)

            for item in UIFont.fontNames(forFamilyName: item){
            //fontsName.append(item)
            
                            print(item)
                if item != nil {
                        //fontsName.append(item)
                }
            }
        
        
        
        
        }
        
        
        
        tableViewItem.dataSource = self
        
        
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
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fontsName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        
        
        ///Besmellah_2.ttf
        
        cell.textLabel?.text = "welcome  " +  fontsName[indexPath.row]
        
         cell.textLabel?.font = UIFont.init(name: fontsName[indexPath.row], size: 25)
        cell.detailTextLabel?.text = "مرحبا بك في اختيار الخطوط"
        cell.detailTextLabel?.font = UIFont.init(name: fontsName[indexPath.row], size: 25)
        return cell
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    



}
