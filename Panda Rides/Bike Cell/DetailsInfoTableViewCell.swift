//
//  DetailsInfoTableViewCell.swift
//  Panda Rides
//
//  Created by Kausik Jati on 01/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class DetailsInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var name_lbl: UILabel!
    
    @IBOutlet weak var description_lbl: UILabel!
    @IBOutlet weak var price_hours: UILabel!
    @IBOutlet weak var price_day: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
