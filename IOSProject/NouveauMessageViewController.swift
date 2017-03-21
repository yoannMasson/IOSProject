//
//  NouveauMessageViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 09/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class NouveauMessageViewController: UIViewController {


    @IBOutlet weak var messageTitle: UITextField!
    @IBOutlet weak var message: UITextView!
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
        

        guard let messagetoSend = self.message.text,messagetoSend != "" else{
            DialogBoxHelper.alert(view: self, withTitle: "Pas de corps", andMessage:"Ilvous faut mettre un corps à votre message")
            return
        }
        
        guard let messageTitleToSend = self.messageTitle.text, messageTitleToSend != "" else{
            DialogBoxHelper.alert(view: self, withTitle: "Pas de titre", andMessage:"Il vous faut mettre un titre à votre message")
            return
        }
        
        CoreDataManager.sendMessage(view: self, title: messageTitleToSend, userMessage: messagetoSend, etud:etud.isOn, prof:prof.isOn, admin:admin.isOn, respo:respo.isOn)
        
        
     }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
