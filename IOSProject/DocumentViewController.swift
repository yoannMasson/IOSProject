//
//  DocumentViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 23/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class DocumentViewController: ColorViewController {


    
    @IBOutlet weak var documentTitle: UITextField!
    @IBOutlet weak var documentDescription: UITextView!
    @IBOutlet weak var documentUrl: UITextField!
    let backToMenu = "backToMenu"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

     @IBAction func addDocument(_ sender: Any) {
        
        guard let title = documentTitle.text, title != "" else{
            DialogBoxHelper.alert(view: self, withTitle: "Pb Titre", andMessage: "veuillez renseigner un titre au document")
            return
        }
        
        guard let url = documentUrl.text, url != "" else{
            DialogBoxHelper.alert(view: self, withTitle: "Pb Url", andMessage: "veuillez renseigner une url au document")
            return
        }
        CoreDataManager.addDocument(title: title, description: documentDescription.text, url : url)
        performSegue(withIdentifier: backToMenu, sender: self)
     }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
