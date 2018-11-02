//
//  UncompletedTaskTableViewCell.swift
//  TaskManager
//
//  Created by Katelyn Pace on 10/30/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class UncompletedTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var TaskTitle: UILabel!
    
    @IBOutlet weak var CompletedStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
