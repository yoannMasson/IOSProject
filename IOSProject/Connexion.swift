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
    
    class func getUser() -> Utilisateur? {
        return self.user
    }
    
    class func getConnexion(login: String, password: String) -> Utilisateur?{
        self.user = CoreDataManager.connect(login: login, password: password)
        return self.user
    }
    
}
