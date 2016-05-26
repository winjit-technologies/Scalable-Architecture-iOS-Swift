//
//  RequestManager.swift
//  Application
//
//  Created by Winjit on 14/04/16.
//  Copyright © 2016 Winjit. All rights reserved.
//

import UIKit
import Alamofire

class RequestManager: NSObject {
    
    /**
     Function to initiate POST request.
     
     - Parameter url  URL to request
     - Parameter params  parameters if any
     - Parameter header  request header if any
     - Parameter completion block to return response with error if any
     */
    func postRequest(url:String,params:[String:AnyObject]?,header:[String:String]?,completion:(response:AnyObject? ,error:NSError?)->Void){
        Alamofire.request(.POST, url, parameters:params, encoding:ParameterEncoding.JSON, headers: header).responseJSON { (objResponse) -> Void in
            completion(response: objResponse.result.value,error: objResponse.result.error)
        }
    }
    
    /**
     Function to initiate GET request.
     
     - Parameter url  URL to request
     - Parameter params  parameters if any
     - Parameter header  request header if any
     - Parameter completion block to return response with error if any
     */
    func getRequest(url:String,params:[String:AnyObject]?,header:[String:String]?,completion:(response:AnyObject? ,error:NSError?)->Void){
        Alamofire.request(.GET, url, parameters:params, encoding:ParameterEncoding.JSON, headers: header).responseJSON { (objResponse) -> Void in
            completion(response: objResponse.result.value,error: objResponse.result.error)
        }
    }
}
