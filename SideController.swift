//
//  SideController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class SideController: NSObject ,UITableViewDataSource,UITableViewDelegate {

    var myView : SideView!
    
    
    var myModel : SideModel!
    
    override init(){
    
    
    super.init()
        myModel = SideModel()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            
           var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
        case 1:
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customPicker")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            //videoNAVID
        case 2:
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "videoNAVID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            // 
        case 3:
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gifAnimate")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            //GestureRecNAVID
        case 4:
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GestureRecNAVID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            
        case 5: //shareDataNavID
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "shareDataNavID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            
            
        case 6: //dropDownNavID
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dropDownNavID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            //Network API
        case 7: //Network API
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Network API")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            
            //fontNavID
        case 8: //fontNavID
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fontNavID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
            //expandTableNavID
            
            
        case 9: //expandTableNavID
            
            var viewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "expandTableNavID")
            
            SingleClass.swViewController.pushFrontViewController(viewController, animated: true)
        default:
            break
        }
        //
        
        
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.titles.count
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "sideCellID", for: indexPath)
        
        
        cell.textLabel?.text = myModel.titles[indexPath.row]
        
        return cell
        
    }
    
}
