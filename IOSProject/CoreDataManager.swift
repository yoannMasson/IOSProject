//
//  CoreDataManager.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager: NSObject{
    
    ///get context from application
    ///
    /// - Returns: 'NSManagedObjectContext' of core data
    static var context : NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            exit(EXIT_FAILURE)
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    @discardableResult
    class func save() -> NSError?{
        do{
            try CoreDataManager.context.save()
            return nil
        }
        catch let error as NSError{
            return error
        }
    }
    
    class func getUsers() -> [Utilisateur]{
        let request : NSFetchRequest<Utilisateur> = Utilisateur.fetchRequest()
        do{
            let users = try context.fetch(request)
            return users
        }
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
    }
    
    class func isInCoreDataUser (id: String) -> Bool{
        let users = self.getUsers()
        var find = false
        for users in users {
            if (users.identifiant == id){
                find = true
            }
        }
        return find
    }
    
    class func connect( login: String, password: String) -> Utilisateur? {
        let users = self.getUsers()
        var userToReturn : Utilisateur?
        for user in users {
            if (user.identifiant == login && password == user.mdp){
                userToReturn = user
            }
        }
        return userToReturn
    }
    
}

