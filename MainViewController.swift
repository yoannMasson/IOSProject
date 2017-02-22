//
//  MainViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 13/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldMdp: UITextField!
    @IBOutlet weak var id: UILabel!
    
    @IBAction func change(_ sender: Any) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of an resources that can be recreated.
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
