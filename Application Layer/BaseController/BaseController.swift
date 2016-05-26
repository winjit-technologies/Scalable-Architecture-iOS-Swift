  //
//  BaseController.swift
//  OffWork
//
//  Created by Winjit on 03/11/15.
//  Copyright © 2015 Winjit. All rights reserved.
//

import UIKit


class BaseController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
             // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
     /*func showTextHUD(sender: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: sender)
        PKHUD.sharedHUD.show()
    }*/
    
       
    // MARK: - Userdefined methods
    
    /**
    Creates random color object
    
    @return UIColor.
    */
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    /**
    Makes rounded corner of a view
    
    - Parameter radius corner radius to set.
    - Parameter view view object to which it set.
    */
    func makeRoundedBorder (radius:CGFloat , view:UIView)
    {
        view.layer.cornerRadius = radius;
        view.clipsToBounds = true;
        view.layer.masksToBounds = true;
    }
}
