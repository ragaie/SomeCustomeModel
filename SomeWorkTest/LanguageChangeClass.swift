//
//  LanguageChangeClass.swift
//  Change-Language
//
//  Created by Ragaie alfy on 5/9/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

let APPLE_LANGUAGE_KEY = "AppleLanguages"


 let languageManger = LanguageChangeClass()






extension Bundle {
    func specialLocalizedStringForKey(key: String, value: String?, table tableName: String?) -> String {
        /*2*/let currentLanguage = languageManger.currentAppleLanguage()
        
        print(languageManger.currentAppleLanguage())
        var bundle = Bundle();
        /*3*/if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
        /*4*/return (bundle.specialLocalizedStringForKey(key: key, value: value, table: tableName))
    }
}


class LanguageChangeClass: NSObject {

    
    
        /// get current Apple language
        func currentAppleLanguage() -> String{
            let userdef = UserDefaults.standard
            let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
            let current = langArray.firstObject as! String
            return current
        }
    
    
    
        /// set @lang to be the first in Applelanguages list
         func setAppleLAnguageTo(lang: String) {
            let userdef = UserDefaults.standard
            userdef.set([lang], forKey: APPLE_LANGUAGE_KEY)
            userdef.synchronize()
            
            languageManger.DoTheSwizzling()
        }
    
    
    
    
    
    
        func DoTheSwizzling() {
            MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(key:value:table:)))
            //
            //        MethodSwizzleGivenClassName(cls: UIApplication.self, originalSelector: Selector("userInterfaceLayoutDirection"), overrideSelector: Selector("cstm_userInterfaceLayoutDirection"))
        }
    
    
        func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
            let origMethod: Method = class_getInstanceMethod(cls, originalSelector);
            
            let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector);
            
            
            if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
                class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
            } else {
                method_exchangeImplementations(origMethod, overrideMethod);
            }
        }
    
    
    
    
    
    
    
    
    func setLaguageOfApplication(lang : String){
        
        
        
        switch lang {
            
            case "ar":
                languageManger.setAppleLAnguageTo(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                break
            
            
            case "en":
                languageManger.setAppleLAnguageTo(lang: "en")
            
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                break
            
            
            case "fr":
                languageManger.setAppleLAnguageTo(lang: "fr")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                break
            default:
            
            
                break
        }
        
        
        
        
        
        
        
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        rootviewcontroller.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWNAVID")
        
        //SWNAVID //mainNavID
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: .curveEaseOut, animations: { () -> Void in
        }) { (finished) -> Void in
        }
 
        
    }
 ///////////////  end set view controller 
 
    
    
}






