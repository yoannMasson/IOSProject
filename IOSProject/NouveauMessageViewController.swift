//
//  NouveauMessageViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 09/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class NouveauMessageViewController: UIViewController {

    @IBOutlet var messagetitle: UITextField!
    @IBOutlet var message: UITextView!
    @IBOutlet weak var etud: UISwitch!
    @IBOutlet weak var prof: UISwitch!
    @IBOutlet weak var admin: UISwitch!
    @IBOutlet weak var respo: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

     @IBAction func sendMessage(_ sender: Any) {
        let usersToSend = NSSet()
        if(etud.isOn){
            usersToSend.setValue(CoreDataManager.getGroupe(name: GroupeName.etud), forKey: GroupeName.etud)
        }
        if(prof.isOn){
            usersToSend.adding(CoreDataManager.getGroupe(name: GroupeName.prof))
        }
        if(admin.isOn){
            usersToSend.adding(CoreDataManager.getGroupe(name: GroupeName.administration))
        }
        if(respo.isOn){
            usersToSend.adding(CoreDataManager.getGroupe(name: GroupeName.respo))
        }

        guard usersToSend.count != 0 else{
            DialogBoxHelper.alert(view: self, withTitle: "Problème de destinataire", andMessage:"Il faut renseigner au moins un groupe de destinataire")
            return
        }
        
     }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
