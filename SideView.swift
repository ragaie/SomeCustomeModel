//
//  SideView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class SideView: UIViewController {

    
    @IBOutlet weak var userImage: UIImageExtender!
    
    
    @IBOutlet weak var userName: UILabel!
    
    
    
    @IBOutlet weak var sideTableView: UITableView!
    
    var myController : SideController!
    override func viewDidLoad() {
        super.viewDidLoad()

        myController = SideController()
        myController.myView = self
        
        sideTableView.dataSource = myController
        sideTableView.delegate = myController
        
        // Do any additional setup after loading the view.
    }


    
 
    


}
