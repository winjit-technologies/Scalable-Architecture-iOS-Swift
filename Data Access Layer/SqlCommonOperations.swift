//
//  SqlCommonOperations.swift
//  Application
//
//  Created by Winjit on 16/10/15.
//  Copyright © 2015 Winjit. All rights reserved.
//

import UIKit

class SqlCommonOperations: NSObject {
    
    var database: COpaquePointer = nil
    var statement: COpaquePointer = nil
    let strDatabaseName = "Application.sqlite"
    
    /**
    Get data base path
    
    - Returns: String Database path
    */
    func getDBPath () -> String
    {
        var path = ""
        
        let paths =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        path = "\(paths[0])/\(strDatabaseName)"
        
        return path
    }
    
    /**
    Copy database from bundle to a document folder if required
    
    */
    func copyDBIfNeeded()
    {
        var success=false;
        let fileManager = NSFileManager.defaultManager()
        
        success = fileManager.fileExistsAtPath(getDBPath())
        
        if(success)
        {
            return
        }
        else
        {
            do
            {
                let source = (NSBundle.mainBundle().resourcePath?.stringByAppendingString("/\(strDatabaseName)"))!
                try fileManager.copyItemAtPath(source, toPath: getDBPath())
            }
            catch _
            {
               print("Database is not available")
            }
        }
    }
    
    /**
    Open Database
    
    - Returns: Bool Database is opened or not
    */
    func openDB() -> Bool
    {
        copyDBIfNeeded()
        
        if(sqlite3_open(getDBPath(), &database) == SQLITE_OK)
        {
            return true
        }
        return false
    }
    
    /**
    Close database connection
    
    */
    func closeDB()
    {
        sqlite3_finalize(statement)
        sqlite3_close(database)
    }
    
    
    /**
    Executes the non query provided in parameter. (Like delete)
    
    - Parameters: query sql query
    */
    func executeNonQuery(query : String) -> Bool
    {
        if(openDB())
        {
            if(sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK)
            {
                if (sqlite3_step(statement) != SQLITE_DONE)
                {
                    return false
                }
                sqlite3_reset(statement)
            }
            closeDB()
        }
        return true
    }
    
    
}
