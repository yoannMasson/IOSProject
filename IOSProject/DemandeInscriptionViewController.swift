//
//  DemandeInscriptionViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 15/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit
import CoreData

class DemandeInscriptionViewController: UIViewController {

    @IBOutlet weak var identifiant: UITextField!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var mdp: UITextField!
    @IBOutlet weak var confirmationmdp: UITextField!
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    

    var etat: String?
    var backToConnexion = "backToConnexion"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get Source
        if let etat = self.etat{
            self.topLabel.text = etat
        }else{
            self.topLabel.text = "groupe non reconnu"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valider(_ sender: Any) {
        /** Testing that all the fiels are correctly filled */
        guard let testid = self.identifiant.text, testid != "" else{
            DialogBoxHelper.alert(view:self,withTitle: "Problème d'Id", andMessage: "Il faut renseigner l'identifiant qui vous permettra de vous connecter")
            return
        }
        guard let testnom = self.nom.text, testnom != "" else{
            DialogBoxHelper.alert(view:self,withTitle:  "Problème de nom", andMessage: "Il faut renseigner votre nom dans le champ \"Nom\"")
            return
        }
        guard let testprenom = self.prenom.text, testprenom != "" else{
            DialogBoxHelper.alert(view:self,withTitle:  "Problème de prenom", andMessage: "Il faut renseigner votre prénom dans le champ \"Prénom\"")
            return
        }
        guard let testmdp = self.mdp.text, testmdp != "" else{
            DialogBoxHelper.alert(view:self,withTitle:  "Problème de mdp", andMessage: "Il faut renseigner le mot de passe que vous souhaitez utiliser")
            return
        }
        
        guard let testconfirmationmdp = self.confirmationmdp.text, testconfirmationmdp == self.mdp.text else{
            DialogBoxHelper.alert(view:self,withTitle: "Problème de confirmation", andMessage: "Merci de confirmer le mot de passe que vous souhaitez utiliser")
            return
        }
        
        //Check if the id does not already exist
        if (CoreDataManager.isInCoreDataUser(id: self.identifiant.text!)){
            DialogBoxHelper.alert(view: self, withTitle: "pb ID", andMessage: "identifiant déjà utilisé")
        }else{
            self.saveNewUser()
            performSegue(withIdentifier: backToConnexion, sender: self)
        }
    }
    
    
    /**Save a new user
        THE FUNCTION DOES NOT VERIFY ANY PRE CONDITION
    */
    private func saveNewUser(){

        let user = Utilisateur(context: CoreDataManager.context)
        user.identifiant = self.identifiant.text
        user.nom = self.nom.text
        user.prenom = self.prenom.text
        user.mdp = self.mdp.text
        user.accepter = false
        CoreDataManager.save()
    }
    

    
    func textFieldShouldReturn ( textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
