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
    
    
    /// Update the name or/and firstname of the connecteduser
    ///
    /// - Parameters:
    ///      -name: the name of the new user
    ///      -firstName: the first name of the new user
    class func updateUser(name: String, firstName: String){
        guard let user = Connexion.getUser() else{
            return
        }
        user.nom = name
        user.prenom = firstName
        CoreDataManager.save()
    }
    
    class func getNbUncheckedUser() -> Int {
        return getUnacceptedUsers().count
    }
    
    /// Return all the unaccepted user in an array
    class func getUnacceptedUsers() -> [Utilisateur]{
        
        let request : NSFetchRequest<Utilisateur> = Utilisateur.fetchRequest()
        var usersToReturn : [Utilisateur] = []
        do{
            let users = try context.fetch(request)
            for user in users {
                if(!user.accepter){
                    usersToReturn.append(user)
                }
            }
            return usersToReturn
        }
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
    }
    
    
    
    /// Save a new user
    ///
    /// - Parameters:
    ///      -id: the id of the new user
    ///      -nom: the name of the new user
    ///      -prenom: the first name of the new user
    ///      -mdp: the password of the new user
    ///      -userGroupe: the groupe of the new user
    class public func saveNewUser(identifiant: String, nom: String, prenom: String, mdp: String, userGroupe: String ){
        
        let user = Utilisateur(context: CoreDataManager.context)
        user.mail = identifiant
        user.nom = nom
        user.prenom = prenom
        user.mdp = mdp
        user.accepter = false
        let groupe = getGroupe(name: userGroupe)
        user.groupe = groupe
        CoreDataManager.save()
    }
    
    /// Check if the user is in the database
    ///
    /// - Parameters:
    ///      -id: the id of the user to be checked
    class func isInCoreDataUser (id: String) -> Bool{
        let users = self.getUsers()
        var find = false
        for user in users {
            if (user.mail == id){
                find = true
            }
        }
        return find
    }
    
    /// Connect the user with the parametrs given
    ///
    /// - Parameters:
    ///     -login: the mail of the user
    ///     -password: password of the user
    class func connect( login: String, password: String) -> Utilisateur? {
        let users = self.getUsers()
        var userToReturn : Utilisateur?
        for user in users {
            if (user.mail == login && password == user.mdp && user.accepter == true ){
                userToReturn = user
            }
        }
        return userToReturn
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
                if(message.destinataire!.contains(user.groupe)){
                    messagesToReturn.append(message)
               }
            }
            return messagesToReturn;
            
        }
        
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
    }

    ///
    /// Send a message
    ///
    /// - Parameters:
    ///     -view: the view to display an error if needed
    ///     -title: the title of the message
    ///     -userMessage: the message
    ///     -etud: a boolean saying wether the student should recieve the message or not 
    ///     -prof: a boolean saying wether the prof should recieve the message or not 
    ///     -admin: a boolean saying wether the admin should recieve the message or not
    ///     -respo: a boolean saying wether the respo should recieve the message or not
    class func sendMessage(view: UIViewController,title: String, userMessage: String, etud: Bool, prof: Bool, admin: Bool, respo: Bool){
        let message = Message(context: CoreDataManager.context)
        if(etud){
            message.addToDestinataire(CoreDataManager.getGroupe(name: GroupeName.etud))
        }
        if(prof){
            message.addToDestinataire(CoreDataManager.getGroupe(name: GroupeName.prof))
        }
        if(admin){
            message.addToDestinataire(CoreDataManager.getGroupe(name: GroupeName.administration))
        }
        if(respo){
            message.addToDestinataire(CoreDataManager.getGroupe(name: GroupeName.respo))
        }
        
        guard message.destinataire?.count != 0 else{
            DialogBoxHelper.alert(view: view, withTitle: "Problème de destinataire", andMessage:"Il faut renseigner au moins un groupe de destinataire")
            return
        }
        
        message.auteur = Connexion.getUser()
        message.message = userMessage
        message.titre = title
      //  message.date = NSDate.timeIntervalSinceReferenceDate
        
        CoreDataManager.save()
    }
    
    // MARK: -- Group functions
    
    class func getGroupe( name: String) -> Groupe {
        let request : NSFetchRequest<Groupe> = Groupe.fetchRequest()
        var groupeToReturn : Groupe?
        do{
            let groupes = try context.fetch(request)
            for groupe in groupes {
                if (groupe.nom == name){
                    groupeToReturn = groupe
                }
            }
            if (groupeToReturn == nil ){
                groupeToReturn = Groupe (context: CoreDataManager.context)
                groupeToReturn!.nom = name
                CoreDataManager.save()
            }
            
            return groupeToReturn!
        }
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
    }
    
    
    // MARK: -- Documents functions
    
    /// Get all the document
    ///
    /// - Parameters:
    ///      -view: the view to display an error if no user is connected
    class func getDocument() -> [Document] {


        let request : NSFetchRequest<Document> = Document.fetchRequest()
        do{
            let documents = try context.fetch(request)
            return documents
        }
        catch _ as NSError{
            exit(EXIT_FAILURE)
        }
        
    }
    
    ///
    /// Send a message
    ///
    /// - Parameters:


    class func addDocument(title : String, description: String?,url: String){
        let document = Document(context: CoreDataManager.context)
        document.titre = title
        document.url = url
        if (description != nil){
            document.documentDescription = description
        }else{
            document.documentDescription = "Pas de description pour ce document"
        }
        CoreDataManager.save()
    }


}

