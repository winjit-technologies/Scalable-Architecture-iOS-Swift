//
//  SyncManager.swift
//  Application
//
//  Created by Winjit on 13/10/15.
//  Copyright © 2015 Winjit. All rights reserved.
//

import UIKit
import AFNetworking


class SyncManager: NSObject
{
    
    func requestPost(param: NSMutableDictionary, query: String, completion:(result: AnyObject, error: AnyObject)->Void)
    {
        let baseURL = NSURL(string:strWebServiceURL)
        
        let objManager : AFHTTPSessionManager = AFHTTPSessionManager ( baseURL: baseURL)
        objManager.responseSerializer = AFJSONResponseSerializer ()
        objManager.requestSerializer = AFJSONRequestSerializer()
        objManager.requestSerializer .setValue("application/json", forHTTPHeaderField: "Content-Type")
        objManager.requestSerializer .setValue("application/json", forHTTPHeaderField: "Accept")
        objManager.requestSerializer .setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        //objManager.requestSerializer .acceptableContentTypes ["application/zip","text/html","application/json","application/x-zip"];
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        (objManager .POST(query, parameters: param,
            success:
            {
                (NSURLSessionDataTask task, json) -> Void in
                //Some code
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                completion(result: json, error: "")
            },
            failure:
            {
                (NSURLSessionDataTask task, NSError error) -> Void in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                completion(result: "" , error: error)
        }))
        
    }
    
    func requestGet(param: NSMutableDictionary, query: String, completion:(result: AnyObject, error: AnyObject)->Void)
    {
        let objManager : AFHTTPSessionManager = AFHTTPSessionManager ()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        objManager.GET(query, parameters: param,
            success:
            {
                (NSURLSessionDataTask task, json) -> Void in
                //Some code
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                completion(result: json, error: "")
            },
            failure:
            {
                (NSURLSessionDataTask task, NSError error) -> Void in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                completion(result: "" , error: error)
        })
    }
    
    
}
