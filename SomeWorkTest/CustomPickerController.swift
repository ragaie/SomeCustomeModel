//
//  CustomPickerController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class CustomPickerController: NSObject,UIPickerViewDelegate,UINavigationControllerDelegate ,UIImagePickerControllerDelegate,UIPickerViewDataSource,
UIAlertViewDelegate {
    var viewShow : DatePikerView!
    var loader : Loader!

    var pickerRow : Int! = 0
    
    var myModel : CustomPickerModel!
    var myView : CustomPickerView!
    
    let picker = UIImagePickerController()

    
    var showLoader : Bool! = false
    
    override init(){
    
    super.init()
        myModel = CustomPickerModel()
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func getImageAction(_ sender: AnyObject) {
        
        var alert = UIAlertView(title: "get image  ", message: "", delegate: self,      cancelButtonTitle: "close", otherButtonTitles:" use Camera"," from gallary")
        
        alert.show()
        
        //openGallaryAndGetImage()
        
    }
    
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if( buttonIndex == 1){
            
            openCameraAndGetImage()
        }
            
        else if(buttonIndex == 2){
            openGallaryAndGetImage()
            
        }
        
        
    }
    
    
    
    
    
    func openGallaryAndGetImage()->Void{
        
        picker.allowsEditing = false //2
        picker.delegate = self
        picker.sourceType = .photoLibrary //3
        picker.modalPresentationStyle = .popover
        myView.present(picker,animated: true, completion: nil)//4
        
        
    }
    
    
    ///---------------------------------------------------------------->
    
    func openCameraAndGetImage()->Void{
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            
            myView.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        //imageInfoData = info
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        
        
        // myView.imageNameLable.text = info[UIImagePickerControllerMediaType] as! String
        //imagefileName = info[UIImagePickerControllerMediaType] as! String + ".jpg"
        
        //  print(info)
        
        
        var imgenew = resizeImage(image: chosenImage, newWidth: 400)
        
        var  imagData  =  UIImagePNGRepresentation(imgenew);
        
      //  myView.personalImage.image = imgenew
        
        
        myView.imageSelect.image = imgenew
        
        var imageString = imagData?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        
        //imageString  = "data:image/jpg;base64," + imageString
        
       // tempDict.setValue(imageString, forKey: "image")
        
        
        myView.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        
        myView.dismiss(animated: true, completion: nil)
    }
    
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize.init(width: newWidth, height: newHeight))
        image.draw(in: CGRect.init(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    ///////////////// loader 
    
    //////////////////// date picker //////
    
    func showLoader( _ sender : UIButton){
        
        if showLoader == false{
            showLoader(type : "start")
            showLoader = true
        }
        else{
            showLoader(type : "stop")
            showLoader = false
            
        }
    
        
        
    }
   
    
    func showToastDAta(_ sender : UIButton){
        
        
        
        Toast.init( "welcome to application ").Show()
    
    //ShowToast(title: "welcome", bodyMessage: "welcome to my view ")
    
    }
    
    
    
    
    func ShowToast(title :String ,bodyMessage : String)->Void{
        
        
        
        var   toastView  = UINib(nibName: "Toast", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ToastView
        toastView.titleLable.text = title
        toastView.messageView.text = bodyMessage
        
        var  appdelegate =  UIApplication.shared.delegate as! AppDelegate

        
        /// width for text message
        var maxLabelSize: CGSize = CGSize.init(width: appdelegate.window!.frame.width, height: CGFloat(9999))
        var contentNSString = bodyMessage as NSString
        var expectedLabelSize = contentNSString.boundingRect(with: maxLabelSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)], context: nil)
        
        

        
        toastView.frame = CGRect.init(x: appdelegate.window!.frame.width / 4 , y: appdelegate.window!.frame.height - 175 , width: appdelegate.window!.frame.width / 2 , height: expectedLabelSize.height + 40)
        
       
        
      
       
        
        
        
        UIApplication.shared.keyWindow?.addSubview(toastView)

        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            
            toastView.alpha = 0.0
            
        }, completion: nil)
        
        
        
    }

    
    
    
    
    
    
 ////////// loader show
    func showLoader(type : String) {
        
        //  tagButtonRun = sender.tag
        
        
        if loader == nil{
            loader  = UINib(nibName: "Loader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Loader
            
            
            var  appdelegate =  UIApplication.shared.delegate as! AppDelegate
            //            SingleClass.LoaderTemp.frame = CGRect.init(x: (appdelegate.window!.frame.width / 2) - 30 , y: (appdelegate.window!.frame.height / 2 ) - 40   , width: 60, height: 80)
            //
            
            loader.frame = CGRect.init(x: appdelegate.window!.frame.width / 2 - 30, y: appdelegate.window!.frame.height / 2 - 40, width: 60, height: 80)
          
        }
       
        
        
        
        
        if type == "start"{
            
            UIApplication.shared.keyWindow?.addSubview(loader)
            
            //SingleClass.indecator.startAnimating()
            
            
            
            
        }else if type == "stop"{
            
            loader.removeFromSuperview()
            loader = nil
        }
        
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    //////////////////// date picker //////
  
    
    func pickDate(_ sender: AnyObject) {
        
        //  tagButtonRun = sender.tag
        
        
        if viewShow == nil{
            viewShow  = UINib(nibName: "DatePick", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DatePikerView
            
            
            var  appdelegate =  UIApplication.shared.delegate as! AppDelegate
            //            SingleClass.LoaderTemp.frame = CGRect.init(x: (appdelegate.window!.frame.width / 2) - 30 , y: (appdelegate.window!.frame.height / 2 ) - 40   , width: 60, height: 80)
            //
            
            viewShow.frame = CGRect.init(x: 0, y: appdelegate.window!.frame.height, width: appdelegate.window!.frame.width, height: 175)
            
            
            
            viewShow.pickerDateView.datePickerMode = .date
            viewShow.pickerDateView.locale  =  Locale.init(identifier: languageManger.currentAppleLanguage())//"ar"
            
            
            
            //  viewShow.frame = CGRect.init(x: 0, y: myView.view.frame.height, width: myView.view.frame.width, height: 175)
            
            viewShow.cancel.addTarget(self, action: "dismissView:", for: UIControlEvents.touchUpInside)
            viewShow.GetDate.addTarget(self, action: Selector(("getDate:")), for: UIControlEvents.touchUpInside)
            
            // myView.view.addSubview(viewShow)
            
            UIApplication.shared.keyWindow?.addSubview(viewShow)
            
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                var basketTopFrame = self.viewShow.frame
                
                basketTopFrame.origin.y -= 175
                
                
                self.viewShow.frame = basketTopFrame
            }, completion: { finished in
                print("Basket doors opened!")
            })
        }
        
    }
    
    
    //// two action of show date picker view
    func dismissView(_ sender: AnyObject) -> Void {
        
        viewShow.removeFromSuperview()
        viewShow = nil
        
    }
    
    
    func getDate(_ sender: AnyObject) -> Void {
        
        let formatter = DateFormatter()
        //formatter.locale = Locale.init(identifier: "ar")
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        // formatter.dateStyle = DateFormatter.Style.medium
        //formatter.timeStyle = .medium
        
        let dateString = formatter.string(from: viewShow.pickerDateView.date)
        
        
       
        myView.datePicker.setTitle(dateString, for: .normal)
        viewShow.removeFromSuperview()
        viewShow = nil
        
        
    }
    
    
    
    
    
    
    func genderButtonPress(_ sender : UIButton!) -> Void {
        
        
        
        if myView.showDropDown != nil{
            //myModel.allDataChangeValue = []
            
            myView.showDropDown.dataPicker.reloadAllComponents()
        }
        else{
            
            
            myView.initDroupDown()
        }
        
        
        
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myModel.genderTitles.count
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        pickerRow = row
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  myModel.genderTitles[row]
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    
    
    
    
    func dismissPickerView(_ sender: AnyObject) -> Void {
        
        
        myView.showDropDown.removeFromSuperview()
        myView.showDropDown = nil
        
        
        
    }
    
    
    
    func ChangeGender(_ sender: AnyObject) -> Void {
        
        myView.PickerButton.setTitle(myModel.genderTitles[pickerRow], for: .normal)
        
        
        myView.showDropDown.removeFromSuperview()
        myView.showDropDown = nil
        
        
        
    }
    
    
    
    
    
    
    
    
}
