//
//  ExpandTablelController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/31/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ExpandTablelController: NSObject ,UITableViewDelegate,UITableViewDataSource{
    
    var myView : ExpandTablelView!
    var myModel : ExpandTablelModel!
    
    
    
    var selectIndex : IndexPath!
    var previousIndex : IndexPath!
    
    override init(){
    
        super.init()
        
        myModel = ExpandTablelModel()
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectIndex = indexPath
        
        
        
        if previousIndex != nil && selectIndex == previousIndex   {
            
            tableView.reloadRows(at: [indexPath], with: .fade)
            previousIndex = nil
            
        }
            
        else  if previousIndex == nil {
            
            tableView.reloadRows(at: [indexPath], with: .fade)
            previousIndex = indexPath
        }
        else{
            
            tableView.reloadRows(at: [previousIndex,indexPath], with: .fade)
            
            previousIndex = indexPath
        }
        
        
        
        
        
        
        
        

        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        if tableView.tag == 1{
        
                return 5
        }
        
            return 3
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //var cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
        
        if tableView.tag == 1{
        
        //
            let cell = tableView.dequeueReusableCell(withIdentifier: "insideCell", for: indexPath)
            
            
         
            
            return cell
        }
        
        
        if  previousIndex != nil && selectIndex == previousIndex{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            
            
            return cell
            
        }
        else   if selectIndex != nil && indexPath == selectIndex{
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as! tableContainCell
            
            cell.tableviewData.dataSource = self
            cell.tableviewData.delegate = self
            //cell.tableviewData.frame  = CGRect(x: cell.tableviewData.frame.origin.x, y: cell.tableviewData.frame.origin.y, width: cell.tableviewData.frame.size.width, height: 500)
            
            
            let heightConstraint = NSLayoutConstraint(item:  cell.tableviewData, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:  (cell.tableviewData.dequeueReusableCell(withIdentifier: "insideCell")?.frame.height)! * 5)
            cell.tableviewData.addConstraint(heightConstraint)
            
        
            
            
            
            
            return cell
            
            
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            
            
            return cell
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     
        
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
}
