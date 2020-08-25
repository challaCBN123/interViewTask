//
//  dataCell.swift
//  interViewTask
//
//  Created by Bhargava on 18/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class dataCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var titileLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
