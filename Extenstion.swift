//
//  Extenstion.swift
//  Amadeus
//
//  Created by Orchtech on 10/31/16.
//  Copyright © 2016 Orchtech. All rights reserved.
//

import UIKit


extension UILabel {
    func decideTextDirection () {
        let tagScheme = [NSLinguisticTagSchemeLanguage]
        let tagger    = NSLinguisticTagger(tagSchemes: tagScheme, options: 0)
        tagger.string = self.text
        let lang      = tagger.tag(at: 0, scheme: NSLinguisticTagSchemeLanguage,
                                   tokenRange: nil, sentenceRange: nil)
        
        if lang?.range(of:"ar") != nil {
            self.textAlignment = NSTextAlignment.right
        } else {
            self.textAlignment = NSTextAlignment.left
        }
    }

}

extension UITextField {
    func decideTextDirection () {
        let tagScheme = [NSLinguisticTagSchemeLanguage]
        let tagger    = NSLinguisticTagger(tagSchemes: tagScheme, options: 0)
        tagger.string = self.text
        let lang      = tagger.tag(at: 0, scheme: NSLinguisticTagSchemeLanguage,
                                   tokenRange: nil, sentenceRange: nil)
        
        if lang?.range(of:"ar") != nil {
            self.textAlignment = NSTextAlignment.right
        } else {
            self.textAlignment = NSTextAlignment.left
        }
    }
    
}















extension UITableView {
    func scrollToBottom() {
        let sections = numberOfSections-1
        if sections >= 0 {
            let rows = numberOfRows(inSection: sections)-1
            if rows >= 0 {
                let indexPath = IndexPath(row: rows, section: sections)
                DispatchQueue.main.async { [weak self] in
                    self?.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
    }
}

//MARK:Extent string  
extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}



extension UIColor{
    
    
       //var barColor : UIColor! = UIColor.init(red: 93/255.0, green: 31/255.0, blue: 69/255.0, alpha: 1)
      // var titleColor : UIColor! = UIColor.init(red: 28/255.0, green: 173/255.0, blue: 221/255.0, alpha: 1)
//    
    
    
    
    class func navBarColor() -> UIColor{
  
        
    
            return colorWithHexString(hex: "cf1417")

     
        
        
        
        
    }
    
    
    //navigationController
    class func SetNavigation(navigationController : UINavigationController) -> Void{
     

            navigationController.navigationBar.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.navBarColor()]
            
            
     
        
        
        
    }

    class func titleColor() -> UIColor{
        
            return UIColor.white
  
    }
    
    
    
    
    
    class func colorWithHexString (hex:String) -> UIColor {
        var cString:String = (hex as! NSString).trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    
}
