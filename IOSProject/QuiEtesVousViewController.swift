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
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case self.transitionEtud:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = GroupeName.etud
        case self.transitionAdmin:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = GroupeName.administration
        case self.transitionRespo:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = GroupeName.respo
        case self.transitionEnseignant:
            let demandeInscriptionViewController = segue.destination as! DemandeInscriptionViewController
            demandeInscriptionViewController.etat = GroupeName.prof
        default:
            DialogBoxHelper.alert(view:self,withTitle:"groupe non reconnu",andMessage:"groupe non reconnu")
        }
        
    }
    

}
