//
//  NewEventViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 25/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {
    

    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextView!
    
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

     @IBAction func addEvent(_ sender: Any) {
        guard let title = eventTitle.text,title != "" else{
            DialogBoxHelper.alert(view: self, withTitle: "problème titre", andMessage: "Merci de renseigner un titre")
            return
        }
        
        CoreDataManager.addEvent(title:title, date: eventDate.date, description : eventDescription.text)
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
