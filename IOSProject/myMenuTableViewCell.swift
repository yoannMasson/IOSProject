//
//  myMenuTableViewCell.swift
//  IOSProject
//
//  Created by Yoann MASSON on 21/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class myMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var textMenu: UILabel!
    @IBOutlet weak var nbUncheckedUser: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
