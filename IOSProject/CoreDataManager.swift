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
    
    /// Svave all data in the core data manager
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
    
    // MARK: -- Users functions
    
    // Get the list of all users
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
    
    /// Check if the user is in the database
    ///
    /// - Parameters:
    ///      -id: the id of the user to be checked
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
    
    /// Connect the user with the parametrs given
    ///
    /// - Parameters:
    ///     -login: the mail of the user
    ///      -password: password of the user
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
    
    /// Check if the current user is an admin
    class func isAdmin() -> Bool {
        guard let user = Connexion.getUser() else {
           return false
        }
        return user.groupe!.nom == "Responsable departement" || user.groupe!.nom == "Administration"
    }
    
    // MARK: -- Messages functions
    
    /// Get the messages of the current connected user
    ///
    /// - Parameters:
    ///      -view: the view to display an error if no user is connected
    class func getMessage(view: UIViewController) -> [Message] {
        guard let user = Connexion.getUser() else {
            DialogBoxHelper.alert(view: view, withTitle: "pb de connexion", andMessage: "Aucun utilisateur de connecté")
            return []
        }
        var messagesToReturn : [Message] = []
        let request : NSFetchRequest<Message> = Message.fetchRequest()
        do{
            let messages = try context.fetch(request)
            for message in messages{
                if(message.destinataire == user.groupe){
                    messagesToReturn.append(message)
                }
            }
            return messagesToReturn;
            
        }
        
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
    }
}

