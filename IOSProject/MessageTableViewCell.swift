//
//  MessageTableViewCell.swift
//  IOSProject
//
//  Created by Yoann MASSON on 09/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    // MARK: -- Message
    

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var author: UILabel!
    
    func setTitle(title: String){
        self.title.text = title
    }
    
    func setAuthor(author: String){
        self.author.text = author
    }
    
    func setMessage(message: String){
        self.message.text = message
    }
    
    
    // MARK: -- TableviewCell functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
