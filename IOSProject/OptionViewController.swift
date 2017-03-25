//
//  OptionViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 25/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class OptionViewController: ColorViewController {
    
    @IBOutlet weak var topName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let backToMenu = "backToMenu"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fields initialisation
        guard let user = Connexion.getUser() else {
            return
        }
        
        topName.text = "\(user.nom!) - \(user.prenom!)"
        nameField.text = user.nom
        firstNameField.text = user.prenom
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

     @IBAction func updateInfo(_ sender: Any) {
        guard let user = Connexion.getUser() else {
            return
        }
        
        guard let pass = passwordField.text, pass == user.mdp else {
            DialogBoxHelper.alert(view: self, withTitle: "Mauvais password", andMessage: "Pour changer vos informations, vous devez renseigner votre mot de passe")
            return
        }
        
        guard let name = nameField.text,name != "" else {
            DialogBoxHelper.alert(view: self, withTitle: "problème nom", andMessage: "Vous devez avoir un nom")
            return
        }
        
        guard let firstName = firstNameField.text,name != "" else {
            DialogBoxHelper.alert(view: self, withTitle: "problème prénom", andMessage: "Vous devez avoir un prenom")
            return
        }
        
        CoreDataManager.updateUser(name: name,firstName: firstName)
        self.performSegue(withIdentifier: backToMenu, sender: self)
     }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
