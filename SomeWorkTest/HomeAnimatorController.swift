//
//  HomeAnimatorController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/30/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class HomeAnimatorController: NSObject,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var myView : HomeAnimatorView!
    
    var selectCell : ImageCollectionCell!
    var selectIndex : IndexPath!
    override init(){
    
        super.init()
    
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectIndex = indexPath
        
        let selectedHerb = herbs[indexPath.row]
         selectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionID", for: indexPath) as!ImageCollectionCell
        //present details view controller
        let herbDetails = myView.storyboard!.instantiateViewController(withIdentifier: "HerbDetailsViewController") as! HerbDetailsViewController
        // send data
        herbDetails.herb = selectedHerb
        herbDetails.transitioningDelegate = myView
        
       // myView.navigationController?.pushViewController(herbDetails, animated: true)
        myView.navigationController?.present(herbDetails, animated: true, completion: nil)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return herbs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionID", for: indexPath) as! ImageCollectionCell
        
        cell.image.image =   UIImage(named: herbs[indexPath.row].image)

        
        return cell
    }
    

}
