//
//  ChtarNetwork.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/20/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit




protocol ChtarNetworkReponse{
    
    
    
    func networkResponse(response : URLResponse, error : NSError,data : NSData,Key : String)
    
    
    
}


///http://staging.brightcreations.com/bot/hr.php
//username -> bcuser  // password-> bc1234
//key -> Content-Type value -> application/json
import SystemConfiguration
enum HttpWay{
    case GET ,
    POST ,
    PUT,
    PATCH,
    DELETE}

enum ReachabilityStatus {
    case notReachable
    case reachableViaWWAN
    case reachableViaWiFi
}


class ChtarNetwork: NSObject {
    
    
    
    var NetworkDelegate : ChtarNetworkReponse!
        override init(){
    
    
            super.init()
        }
    

    static func RetreiveData<T>(_ urlString : String , httpWay : HttpWay ,Headers : T , bodyParameter : T ,key : String){
        
        
   
        var error : NSError!
        var configuration : URLSessionConfiguration! = .default
        var session : URLSession! = URLSession.init(configuration: configuration)
        
        var request : MutableURLRequest! = MutableURLRequest.init(url: URL.init(string: urlString)!)
        
        
    
        
        if (httpWay == .GET){
            
            request.httpMethod = "GET"
            
        }else if (httpWay == .POST){
            request.httpMethod = "POST"

        }else if (httpWay == .PUT){
            request.httpMethod = "PUT"

        }else if (httpWay == .PATCH){
            request.httpMethod = "PATCH"

        }else if (httpWay == .DELETE){
            request.httpMethod = "DELETE"

        }
        
        /// s et header values
            if (Headers  != nil ){
                
                
                print(Headers)
                
                var tempHeader = Headers as! [String : String]

                request.allHTTPHeaderFields = tempHeader
            }
        if (bodyParameter != nil ){
            
            let dataBody: Data = NSKeyedArchiver.archivedData(withRootObject: bodyParameter)
            
            request.httpBody = dataBody
           // let dictionary: Dictionary? = NSKeyedUnarchiver.unarchiveObject(with: dataExample) as! [String : Any]
            

        }

        
        //create task
        let task =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
           
            DispatchQueue.main.sync {
                
              //  if self.NetworkDelegate != nil {
                    
                    
               // }
            }
            if error != nil {
            
                print("error --->  \(error)")

            }
            
            else if data != nil {
            
                print("data  ---  >   \(data)")
            }
            
            if response as! HTTPURLResponse != nil {
            
                print("------status code -------")
                print((response as! HTTPURLResponse ).statusCode)
                
                    print("------status code -------")

//                do {
//                    let json = try JSONSerialization.data(withJSONObject: response!, options: []) as? [String : Any]
//            
//                        print("json data  of response  ---  >   \(json)")
//                
//                        } catch let error {
//                            
//                        }
            }
          
            print("----------------")
            print(String(data: data!, encoding: String.Encoding.utf8))
            // do stuff with response, data & error here
            print("reponse --- >  \(response)")
            
        
            UIApplication.shared.isNetworkActivityIndicatorVisible = false

            
        })

        
        task.resume()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

    
    
    }
    
    
    
    
    
    
    
    

    
    var currentReachabilityStatus: ReachabilityStatus {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return .notReachable
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return .notReachable
        }
        
        if flags.contains(.reachable) == false {
            // The target host is not reachable.
            return .notReachable
        }
        else if flags.contains(.isWWAN) == true {
            // WWAN connections are OK if the calling application is using the CFNetwork APIs.
            return .reachableViaWWAN
        }
        else if flags.contains(.connectionRequired) == false {
            // If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi...
            return .reachableViaWiFi
        }
        else if (flags.contains(.connectionOnDemand) == true || flags.contains(.connectionOnTraffic) == true) && flags.contains(.interventionRequired) == false {
            // The connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs and no [user] intervention is needed
            return .reachableViaWiFi
        }
        else {
            return .notReachable
        }
    }


}
