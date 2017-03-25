//
//  EventViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 25/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var addEventButton: UIBarButtonItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if(!Connexion.isAdmin()){
            addEventButton.isEnabled = false
            
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
