//
//  Login.swift
//  Application
//
//  Created by Winjit on 06/10/15.
//  Copyright © 2015 Winjit. All rights reserved.
//

import UIKit

class Login: BaseController
{
    //MARK:- IBOutlet or variable Declarations
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var iLoginAttempt: Int = 0
    
    
    //MARK:- View Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - User Defined IBActions

    
    
    /**
     Function to run when user tap on Login button. Do the validation of user name and passoword fields. After successful validation do the login otherwise show alert messages in case of any error
     
     - Parameter sender.
     */
    @IBAction func btnLogin(sender: AnyObject)
    {
        let feedList = self.storyboard?.instantiateViewControllerWithIdentifier("FeedList") as! FeedList
        
        self.navigationController?.pushViewController(feedList, animated: true)
    }
    
    
    // MARK: - TextField delegate functions
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if(textField==txtUserName)
        {
            txtPassword.becomeFirstResponder()
        }
        else
        {
            textField .resignFirstResponder()
        }
        
        return true
    }
    
}
