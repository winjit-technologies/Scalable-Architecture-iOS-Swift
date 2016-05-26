//
//  FeedList.swift
//  Application
//
//  Created by Winjit on 19/04/16.
//  Copyright © 2016 Winjit. All rights reserved.
//

import UIKit
import SDWebImage

class FeedList: UIViewController   {

    @IBOutlet weak var actindLoading: UIActivityIndicatorView!
    @IBOutlet weak var tblviwList: UITableView!
    var songListData = Array<Song>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Show loading status
        actindLoading.hidesWhenStopped = true
        actindLoading.startAnimating()
        
        //Get data from web API
        self.getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - User defined methods
    func getData()
    {
        let feedListManager = FeedListManager()
        feedListManager.getSongList { (result, error) in
            print (result)
            
            self.songListData = result
            self.tblviwList.reloadData()
            self.actindLoading.stopAnimating()

        }
    }
   
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (songListData.count)
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let song = songListData[indexPath.row]
       
        let lblTitle = cell.contentView.viewWithTag(101) as! UILabel
        lblTitle.text = song.title
        
        let imgThumbnail = cell.contentView.viewWithTag(100) as! UIImageView
        imgThumbnail.sd_setImageWithURL(NSURL(string: song.thumbnailUrl!))

        return cell
    }

}

