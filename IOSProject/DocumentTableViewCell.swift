//
//  DocumentTableViewCell.swift
//  IOSProject
//
//  Created by Yoann MASSON on 23/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UIButton!
    @IBOutlet weak var url: UITextView!
    var documentDescription: String = ""
    var table : DocumentTableViewController?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func showDescription(_ sender: Any) {
        guard let table = self.table else {
            return
        }
        DialogBoxHelper.alert(view: table, withTitle: (title.titleLabel?.text)!, andMessage: documentDescription)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
