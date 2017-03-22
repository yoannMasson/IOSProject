//
//  colorPickerViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class colorPickerViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blue(_ sender: Any) {
        guard let user = Connexion.getUser() else{
            DialogBoxHelper.alert(view: self, withTitle:"pb connection", andMessage:"Pas de user connecté" )
            return
        }
        
        user.couleur = "blue"
        CoreDataManager.save()
        super.viewDidLoad()
    }

    @IBAction func green(_ sender: Any) {
        guard let user = Connexion.getUser() else{
            DialogBoxHelper.alert(view: self, withTitle:"pb connection", andMessage:"Pas de user connecté" )
            return
        }
        
        user.couleur = "green"
        CoreDataManager.save()
        super.viewDidLoad()

    }
    
    @IBAction func red(_ sender: Any) {
        guard let user = Connexion.getUser() else{
            DialogBoxHelper.alert(view: self, withTitle:"pb connection", andMessage:"Pas de user connecté" )
            return
        }
        
        user.couleur = "red"
        CoreDataManager.save()
        super.viewDidLoad()

    }
    
    @IBAction func normal(_ sender: Any) {
        guard let user = Connexion.getUser() else{
            DialogBoxHelper.alert(view: self, withTitle:"pb connection", andMessage:"Pas de user connecté" )
            return
        }
        
        user.couleur = nil
        CoreDataManager.save()
        super.viewDidLoad()
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
