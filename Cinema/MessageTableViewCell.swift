//
//  MessageTableViewCell.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/8.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var systemImage: UIImageView!
    @IBOutlet weak var textMessage: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
     

}
