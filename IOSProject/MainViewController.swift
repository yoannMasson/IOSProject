//
//  MainViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 13/02/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var textFieldId: UIView!
    @IBOutlet weak var texteFieldMdp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* for i in 1...1000000000{
            self.id.text="\(i)"
        }*/
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var id: UILabel!
    
    func textFieldShouldReturn(textFieldId: UITextField) -> Bool {
        textFieldId.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(textFieldMdp: UITextField) -> Bool {
        textFieldMdp.resignFirstResponder()
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
