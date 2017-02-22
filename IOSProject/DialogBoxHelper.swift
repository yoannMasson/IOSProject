//
//  DialogBoxHelper.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import Foundation
import UIKit

class DialogBoxHelper{
    ///
    /// shows an alert box
    ///
    /// - Parameters:
    ///     -title: title of the dialog box
    ///     -msg: additional msg to be displayed
    class func alert(view: UIViewController, withTitle title: String, andMessage msg:String = ""){
        let alert = UIAlertController (title: title,
                                       message: msg,
                                       preferredStyle:.alert)
        let cancelAction = UIAlertAction (title :"Ok", style:.default)
        alert.addAction(cancelAction)
        view.present(alert,animated: true)
    }
    
    ///shows information of the error
    /// - Parameters: 
    ///     - error: error to be displayed
    class func alert(view: UIViewController, error:NSError){
        self.alert(view: view, withTitle: "\(error)", andMessage: "\(error.userInfo)")
    }
}
