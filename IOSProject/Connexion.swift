//
//  Connexion.swift
//  IOSProject
//
//  Created by Yoann MASSON on 24/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import Foundation
import CoreData


class Connexion {
    
    private static var user: Utilisateur?
    
    ///
    /// return the user, if he is connected
    ///

    class func getUser() -> Utilisateur? {
        return self.user
    }
    
    ///
    /// Connect and return the user associated with the login and password given in parameters
    ///
    /// - Parameters:
    ///     -login: the login of the user
    ///     -password: the password of the user
    class func getConnexion(login: String, password: String) -> Utilisateur?{
        self.user = CoreDataManager.connect(login: login, password: password)
        return self.user
    }
    
    /// Check if the current user is an admin
    class func isAdmin() -> Bool {
        guard let user = Connexion.getUser() else {
            return false
        }
        return user.groupe!.nom == GroupeName.administration || user.groupe!.nom == GroupeName.respo
    }
}
