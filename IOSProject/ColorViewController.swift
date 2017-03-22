//
//  ViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = Connexion.getUser() else {
            return
        }
        guard let couleur = user.couleur else{
            return
        }
        switch(couleur){
            case "red":
                self.view.backgroundColor = UIColor.red
            case "green":
                self.view.backgroundColor = UIColor.green
            case "blue":
                self.view.backgroundColor = UIColor.blue
        default: break
            
        }
        // Do any additional setup after loading the view.
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
