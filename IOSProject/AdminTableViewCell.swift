//
//  AdminTableViewCell.swift
//  IOSProject
//
//  Created by Yoann MASSON on 24/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class AdminTableViewCell: UITableViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    var user : Utilisateur?
    var table : AdminTableViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func accept(_ sender: Any) {
        guard let user = user else {
            return
        }
        user.accepter = true
        CoreDataManager.save()
        self.refreshTable()
    }
    
    @IBAction func reject(_ sender: Any) {
        guard let user = user else {
            return
        }
        CoreDataManager.context.delete(user)
        CoreDataManager.save()
        self.refreshTable()
    }
    
    /// Refresh the table
    private func refreshTable(){
        guard let table = self.table else {
            return
        }
        table.tableView.reloadData()
    }

        
}
