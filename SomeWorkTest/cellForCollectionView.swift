//
//  cellForCollectionView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/14/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class cellForCollectionView: UITableViewCell,UICollectionViewDataSource {

    
    
    
    
    
    
    @IBOutlet weak var colletiondataView: UICollectionView!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        colletiondataView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 13
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        var cell = colletiondataView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifer", for: indexPath)
        
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.red
            
        }else{
            
            
            
            cell.backgroundColor = UIColor.yellow
            
            
            
        }
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
        
        
    }
    

}
