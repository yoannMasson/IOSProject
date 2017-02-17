//
//  DemandeInscriptionViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 15/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class DemandeInscriptionViewController: UIViewController {

    @IBOutlet weak var identifiant: UITextField!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var mdp: UITextField!
    @IBOutlet weak var confirmationmdp: UITextField!
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    
    let transitionEtud = "transitionEtud"
    let transitionEnseignant = "transitionEnseignant"
    let transitionRespo = "transitionRespo"
    let transitionAdmin = "transitionAdmin"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valider(_ sender: Any) {
        /** Testing that all the fiels are correctly filled */
        guard let testid = self.identifiant.text, testid != "" else{
            self.alertError(errorMsg: "Problème d'Id", userInfo: "Il faut renseigner l'identifiant qui vous permettra de vous connecter")
            return
        }
        guard let testnom = self.nom.text, testnom != "" else{
            self.alertError(errorMsg: "Problème de nom", userInfo: "Il faut renseigner votre nom dans le champ \"Nom\"")
            return
        }
        guard let testprenom = self.prenom.text, testprenom != "" else{
            self.alertError(errorMsg: "Problème de prenom", userInfo: "Il faut renseigner votre prénom dans le champ \"Prénom\"")
            return
        }
        guard let testmdp = self.mdp.text, testmdp != "" else{
            self.alertError(errorMsg: "Problème de mdp", userInfo: "Il faut renseigner le mot de passe que vous souhaitez utiliser")
            return
        }
        
        guard let testconfirmationmdp = self.confirmationmdp.text, testconfirmationmdp == self.mdp.text else{
            self.alertError(errorMsg: "Problème de confirmation", userInfo: "Merci de confirmer le mot de passe que vous souhaitez utiliser")
            return
        }
    }
    
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier! {
        case self.transitionEtud:
                self.topLabel.text! = "Demande inscription: Etudiants"
        case self.transitionAdmin:
                self.topLabel.text! = "Demande inscription: Administration"
        case self.transitionRespo:
                self.topLabel.text! = "Demande inscription: Responsable dep."
        case self.transitionEnseignant:
                self.topLabel.text! = "Demande inscription: Enseignant"
        default:
             alertError(errorMsg: "Problème de groupe", userInfo: "L'application ne reconnaît pas votre groupe")
            
        }
    }
        
    func alertError(errorMsg error: String, userInfo msg:String = ""){
        let alert = UIAlertController (title: error,
                                       message: msg,
                                       preferredStyle:.alert)
        let cancelAction = UIAlertAction (title :"Ok", style:.default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
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
