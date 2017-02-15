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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valider(_ sender: Any) {
        guard let text = self.identifiant.text, text != "" else{
            self.alertError(errorMsg: "Problème d'Id", userInfo: "Il faut renseigner l'identifiant qui vous permettra de vous connecter")
            return
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
