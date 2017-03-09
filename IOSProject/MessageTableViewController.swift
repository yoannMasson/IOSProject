//
//  MessageTableViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 09/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    var messages : [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**Testing message display */
        let users = NSSet()
        let groupe = Groupe(context: CoreDataManager.context)
        groupe.nom = GroupeName.etud
        users.adding(groupe)
        CoreDataManager.sendMessage(view: self, title: "testTitre", userMessage: "lolilol le message aaaaaaaaaaaaaaaaaaaabbbbbbbzhebhzebhzbehzabehzbhzaebaaaaa FIN", users: users)
        
        guard Connexion.getUser() != nil else {
            DialogBoxHelper.alert(view: self, withTitle: "pas de user", andMessage: "Vous n'êtes pas connecté")
            return
        }
        self.messages = CoreDataManager.getMessage(view: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MessageTableViewCell

        cell.setTitle(title: self.messages[indexPath.row].titre!)
        cell.setAuthor(author: (self.messages[indexPath.row].auteur?.nom)!+" "+(self.messages[indexPath.row].auteur?.prenom)!)
        cell.setMessage(message: self.messages[indexPath.row].message!)
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
