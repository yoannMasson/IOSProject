//
//  QuiEtesVousViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class QuiEtesVousViewController: UIViewController {

    // MARK: - transition list
    let transitionEtud = "transitionEtud"
    let transitionEnseignant = "transitionEnseignant"
    let transitionRespo = "transitionRespo"
    let transitionAdmin = "transitionAdmin"
    
    
    // MARK: - view functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func alertError(errorMsg error: String, userInfo msg:String = ""){
        let alert = UIAlertController (title: error,
                                       message: msg,
                                       preferredStyle:.alert)
        let cancelAction = UIAlertAction (title :"Ok", style:.default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case self.transitionEtud:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = "Etudiants"
        case self.transitionAdmin:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = "Administration"
        case self.transitionRespo:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = "Responsable departement"
        case self.transitionEnseignant:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = "Enseignant"
        default:
            self.alertError(errorMsg: "Problème de groupe", userInfo: "L'application ne reconnaît pas votre groupe")
        }
        
    }
    

}
