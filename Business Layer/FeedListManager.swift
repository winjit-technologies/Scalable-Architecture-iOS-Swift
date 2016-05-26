//
//  FeedListManager.swift
//  Application
//
//  Created by Winjit on 19/04/16.
//  Copyright © 2016 Winjit. All rights reserved.
//

import UIKit
import SwiftyJSON

class FeedListManager: NSObject {

    /**
     Function to get song list by sending request to web service
     - Parameter completion block having result and error as parameters
     */
    func getSongList(completion:(result: Array<Song>, error: Bool)->Void)
    {
        let requestManager = RequestManager()
        requestManager.getRequest(ServerConfig.webUrl, params: nil, header: nil) { (response, error) in
            
            if (response != nil)
            {
               let parsedResult = self.parseData(response!)
                
                // - TODO: Save result in sqlite database here whenever needed
                
                completion(result: parsedResult, error: false)
            }
            else{
                completion(result: Array<Song>(), error: true)
            }
        }
    }
    
    /**
     Function to parse song list response.
     
     - Parameter data response of song kist request.
     */
    func parseData(data: AnyObject?) -> Array<Song>
    {
        var result = Array<Song>()
        let json = JSON(data!)
        
        if !json.isEmpty
        {
            if let itemList = json["items"].array{
                for dict in itemList
                {
                    let song = Song()
                    if let person = dict["snippet"].dictionary {
                        if let title = person["title"]?.string {
                            song.title = title
                        }
                        if let description = person["description"]?.string {
                            song.songdescription = description
                        }
                        if let imagedict = person["thumbnails"]?.dictionary {
                            if let thumbnail = imagedict["default"]?.dictionary {
                                if let thumbnailurl = thumbnail["url"]?.string {
                                    song.thumbnailUrl = thumbnailurl
                                }
                            }
                        }
                    }
                    result.append(song)
                }
            }
        }

       return result
    }
}
