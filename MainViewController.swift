//
//  MainViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 13/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITextFieldDelegate, UIApplicationDelegate{

    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldMdp: UITextField!
    @IBOutlet weak var id: UILabel!
    
    let connexionSegue = "Connexion"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of an resources that can be recreated.
    }

    func textFieldShouldReturn ( textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func seConnecter(_ sender: Any) {
        
        //Testing id required
        guard let testid = self.textFieldId.text, testid != "" else{
            DialogBoxHelper.alert(view:self,withTitle: "Problème d'Id", andMessage: "Il faut renseigner l'identifiant qui vous permettra de vous connecter")
            return
        }
        
        //Testing password required
        guard let testmdp = self.textFieldMdp.text, testmdp != "" else{
            DialogBoxHelper.alert(view:self,withTitle: "Problème de mdp", andMessage: "Il faut renseigner le mot de passe qui vous permettra de vous connecter")
            return
        }
        
        //testing if the user is real
        if Connexion.getConnexion(login: textFieldId.text!, password: textFieldMdp.text!) != nil {
            performSegue(withIdentifier: connexionSegue, sender: self)
        }else{
            DialogBoxHelper.alert(view: self, withTitle: "Pas de compte",andMessage:"Mauvais mot de passe ou mail")
        }

    }
    
    // MARK: -- TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
