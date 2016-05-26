//
//  UsersOperations.swift
//  Application
//
//  Created by Winjit on 20/10/15.
//  Copyright © 2015 Winjit. All rights reserved.
//

import UIKit

class UsersOperations: SqlCommonOperations {

    /**
    Save user information in local database
    
    */
    func saveUser ()
    {
        if(openDB())
        {
           let query = "INSERT INTO Users(cName,cEmailId) VALUES(?,?)"
            
            if (sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK)
            {
                sqlite3_bind_text(statement, 1, "user1", -1, nil)
                sqlite3_bind_text(statement, 2, "email@winjit.com", -1, nil)
                
                if(sqlite3_step(statement) != SQLITE_DONE)
                {
                    print("error in insert operation \(sqlite3_errmsg(database))");
                }
                sqlite3_reset(statement)
            }
            closeDB()
        }
    }
}
