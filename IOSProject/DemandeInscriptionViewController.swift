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

    @IBAction func valider(_ sender: Any) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
